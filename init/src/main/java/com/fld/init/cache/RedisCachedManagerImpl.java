package com.fld.init.cache;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;

import javax.annotation.PostConstruct;

import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.dao.DataAccessException;
import org.springframework.data.redis.connection.RedisConnection;
import org.springframework.data.redis.connection.RedisZSetCommands.Tuple;
import org.springframework.data.redis.core.RedisCallback;
import org.springframework.data.redis.core.RedisTemplate;
import org.springframework.data.redis.serializer.RedisSerializer;
import org.springframework.data.redis.serializer.StringRedisSerializer;
import com.fld.framework.exception.CacheException;
import com.fld.framework.util.ConsistentHash;
import com.fld.framework.util.JacksonUtils;

public class RedisCachedManagerImpl implements RedisCachedManager {

	private static final Logger LOGGER = Logger.getLogger(RedisCachedManager.class);

	protected RedisTemplate<String, Object> redisTemplate;
	/**
	 * key
	 */
	private RedisSerializer<String> keySerializer = new StringRedisSerializer();
	/**
	 * String value
	 */
	private RedisSerializer<String> valueSerializer = new StringRedisSerializer();

	/**
	 * 单独选DB 优先使用
	 */
	private Integer dbIndex = null;

	/**
	 * DB列表，一致性hash分布，优先权低于 dbIndex
	 */
	List<Integer> dbNodes = new ArrayList<>();

	// 一致性hash控制类
	private ConsistentHash<Integer> consistentHash = null;

	public RedisCachedManagerImpl() {

	}

	public RedisCachedManagerImpl(RedisTemplate<String, Object> redisTemplate) {
		super();
		this.redisTemplate = redisTemplate;
	}

	/**
	 * 
	 * @Description:hash列表初始化方法，若使用列表，必须作为初始化方法
	 * @Date: 2014年7月21日 上午9:31:49
	 * @author zhaoxikun
	 * @return void
	 * 
	 */
	@PostConstruct
	public void initDbNodes() {
		if (null != dbNodes && !dbNodes.isEmpty()) {
			consistentHash = new ConsistentHash<>(dbNodes);
		}
	}

	@Override
	public Long addOrIncr(String key) {
		return addOrIncr(key, -1);
	}

	@Override
	public Long addOrIncr(final String key, final int incrValue) {
		try {

			final byte[] rawKey = rawKey(key);

			return this.redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					if (incrValue > 0) {
						return connection.incrBy(rawKey, incrValue);
					} else {
						return connection.incr(rawKey);
					}
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	/**
	 * @Description:反序列key
	 * @Date: 2014年5月21日 下午12:11:24
	 * @param key
	 * @return String
	 * 
	 */
	private String deserializeHashKey(byte[] bytes) {
		return keySerializer.deserialize(bytes);
	}

	/**
	 * @Description:反序列值
	 * @param bs
	 * @return String
	 * 
	 */
	private String deserializeValue(byte[] bs) {
		return valueSerializer.deserialize(bs);
	}

	/**
	 * @Description:反序列hash
	 * @param entries
	 * @return Map<String,Object>
	 * 
	 */
	private Map<String, String> deserializeHashMap(Map<byte[], byte[]> entries) {
		// connection in pipeline/multi mode
		if (entries == null) {
			return null;
		}

		Map<String, String> map = new LinkedHashMap<>(entries.size());

		for (Map.Entry<byte[], byte[]> entry : entries.entrySet()) {
			map.put(deserializeHashKey(entry.getKey()), deserializeValue(entry.getValue()));
		}

		return map;
	}

	@Override
	public boolean expire(final String key, final int exprieInSecond) {
		try {

			final byte[] rawKey = rawKey(key);

			return this.redisTemplate.execute(new RedisCallback<Boolean>() {

				@Override
				public Boolean doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.expire(rawKey, exprieInSecond);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public String get(final String key) {
		if (null == key) {
			return null;
		}
		try {
			final byte[] rawKey = rawKey(key);
			Object value = this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public String doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return deserializeValue(connection.get(rawKey));
				}
			}, true);
			return null != value ? value.toString() : null;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public <T extends Serializable> T get(String key, Class<T> clazz) {
		String rs = get(key);
		if (StringUtils.isBlank(rs)) {
			return null;
		}
		return JacksonUtils.readValue(rs, clazz);
	}

	@Override
	public Map<String, String> getHash(final String key) {

		try {

			final byte[] rawKey = rawKey(key);
			Map<byte[], byte[]> entries = redisTemplate.execute(new RedisCallback<Map<byte[], byte[]>>() {
				@Override
				public Map<byte[], byte[]> doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.hGetAll(rawKey);
				}
			}, true);

			return deserializeHashMap(entries);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Map<String, String> getMultiString(String... key) {
		Map<String, String> result = new HashMap<>();
		if (key == null || key.length == 0) {
			return result;
		}
		for (String k : key) {
			result.put(k, this.get(k));
		}
		return result;
	}

	public RedisTemplate<String, Object> getRedisTemplate() {
		return redisTemplate;
	}

	@Override
	public boolean hasKey(final String key) {
		try {

			final byte[] rawKey = rawKey(key);

			return this.redisTemplate.execute(new RedisCallback<Boolean>() {

				@Override
				public Boolean doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.exists(rawKey);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public boolean setNX(final String key, Serializable o) {
		return setNX(key, 0, o);
	}

	@Override
	public boolean setNX(String key, int exprieInSecond, Serializable o) {
		return setNX(key, exprieInSecond, serializableToString(o));
	}

	private boolean setNX(final String key, final int exprieInSecond, String o) {
		if (null == o) {
			return false;
		}
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(String.valueOf(o));

			Boolean b = this.redisTemplate.execute(new RedisCallback<Boolean>() {

				@Override
				public Boolean doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					if (exprieInSecond <= 0) {
						return connection.setNX(rawKey, rawValue);
					} else {
						Boolean bnx = connection.setNX(rawKey, rawValue);
						if (Boolean.TRUE.equals(bnx)) {
							connection.expire(rawKey, exprieInSecond);
						}
						return bnx;
					}
				}
			}, true);

			return b;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	private boolean set(final String key, final int exprieInSecond, String o) {
		if (null == o) {
			return false;
		}
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(o);

			this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public Object doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					if (exprieInSecond <= 0) {
						connection.set(rawKey, rawValue);
					} else {
						connection.setEx(rawKey, exprieInSecond, rawValue);
					}
					return null;
				}
			}, true);

			return true;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	/**
	 * 对应于set操作，没有就add，有就replace
	 * 
	 * @param key
	 * @param exprieInSecond
	 *            超时时间单位秒
	 * @param o
	 * @return
	 */
	@Override
	public boolean set(String key, int exprieInSecond, Serializable o) {
		return set(key, exprieInSecond, serializableToString(o));
	}

	private boolean set(String key, String o) {
		return this.set(key, 0, o);
	}

	/**
	 * 添加操作(对象)
	 * 
	 * @param key
	 * @param o
	 * @return
	 */
	@Override
	public boolean set(String key, Serializable o) {
		return set(key, serializableToString(o));
	}

	/**
	 * @Description:
	 * @param key
	 * @return byte[]
	 * 
	 */
	private byte[] rawKey(String key) {
		return keySerializer.serialize(key);
	}

	/**
	 * @Description:序列化值
	 * @param o
	 * @return byte[]
	 * 
	 */
	private byte[] rawValue(String o) {
		return valueSerializer.serialize(o);
	}

	@Override
	public boolean remove(final String key) {
		try {
			final byte[] rawKey = rawKey(key);

			this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public Object doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					connection.del(rawKey);
					return null;
				}
			}, true);

			return true;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	/**
	 * @Description:key的hash mod dbSize
	 * @param key
	 * @return int
	 * 
	 */
	private int chooseDb(String key) {
		return dbIndex == null ? consistentHash(key) : dbIndex;
	}

	private int consistentHash(String key) {
		if (null != consistentHash) {
			return consistentHash.get(key);
		}
		return 0;
	}

	public void setRedisTemplate(RedisTemplate<String, Object> redisTemplate) {
		this.redisTemplate = redisTemplate;
	}

	@Override
	public boolean setHash(final String key, Map<String, String> m) {
		if (m.isEmpty()) {
			return false;
		}
		try {

			final byte[] rawKey = rawKey(key);

			final Map<byte[], byte[]> hashes = new LinkedHashMap<>(m.size());

			for (Entry<String, String> entry : m.entrySet()) {
				hashes.put(rawKey(entry.getKey()), rawValue(entry.getValue()));
			}

			redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public Object doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					connection.hMSet(rawKey, hashes);
					return null;
				}
			}, true);

			return true;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public boolean setHash(final String key, String hashKey, String hashValue) {
		if (null == hashValue || null == hashKey) {
			return false;
		}
		try {
			final byte[] rawKey = rawKey(key);
			final byte[] rawHashKey = rawKey(hashKey);
			final byte[] rawHashValue = rawValue(hashValue);

			return redisTemplate.execute(new RedisCallback<Boolean>() {

				@Override
				public Boolean doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.hSet(rawKey, rawHashKey, rawHashValue);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public String getHash(final String key, String hashKey) {
		try {
			if (StringUtils.isBlank(key) || StringUtils.isBlank(hashKey)) {
				return null;
			}
			final byte[] rawKey = rawKey(key);
			final byte[] rawHashKey = rawHashKey(hashKey);

			byte[] rawHashValue = this.redisTemplate.execute(new RedisCallback<byte[]>() {

				@Override
				public byte[] doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.hGet(rawKey, rawHashKey);
				}
			}, true);

			return deserializeValue(rawHashValue);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	/**
	 * @Description:
	 * @param hashKey
	 * @return byte[]
	 * 
	 */
	private byte[] rawHashKey(String hashKey) {
		return this.rawKey(hashKey);
	}

	public RedisSerializer<String> getKeySerializer() {
		return keySerializer;
	}

	public void setKeySerializer(RedisSerializer<String> keySerializer) {
		this.keySerializer = keySerializer;
	}

	@Override
	public boolean removeHash(final String key, String hashKey) {
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawHashKey = rawHashKey(hashKey);

			this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public Object doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					connection.hDel(rawKey, rawHashKey);
					return null;
				}
			}, true);
			return true;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long countHash(String key) {
		try {

			final byte[] rawKey = rawKey(key);

			return this.redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.hLen(rawKey);
				}
			}, true);
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	private String serializableToString(Serializable o) {
		if (null == o) {
			return null;
		}
		if (o instanceof String) {
			return o.toString();
		} else {
			return JacksonUtils.toJson(o);
		}
	}

	private <T extends Serializable> T stringToSerializable(String s, Class<T> clazz) {
		if (null == s) {
			return null;
		}
		if (String.class.equals(clazz)) {
			return clazz.cast(s);
		} else {
			return JacksonUtils.readValue(s, clazz);
		}
	}

	public Integer getDbIndex() {
		return dbIndex;
	}

	public void setDbIndex(Integer dbIndex) {
		this.dbIndex = dbIndex;
	}

	public List<Integer> getDbNodes() {
		return dbNodes;
	}

	public void setDbNodes(List<Integer> dbNodes) {
		this.dbNodes = dbNodes;
	}

	@Override
	public boolean hasSortedSet(final String key, Serializable member) {
		if (null == member) {
			return false;
		}
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));

			Long result = redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zRevRank(rawKey, rawValue);
				}
			}, true);

			return null != result && result >= 0;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Double scoreSortedSet(final String key, Serializable member) {
		if (null == member) {
			return -1D;
		}
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));

			Double result = redisTemplate.execute(new RedisCallback<Double>() {
				@Override
				public Double doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zScore(rawKey, rawValue);
				}
			}, true);

			return null == result ? -1D : result;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long countSortedSet(final String key, Double min, Double max) {
		try {

			final byte[] rawKey = rawKey(key);

			return redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zCount(rawKey, min, max);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public boolean setSortedSet(final String key, Double score, Serializable member) {
		if (null == member) {
			return false;
		}
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));

			redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public Object doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					connection.zAdd(rawKey, score, rawValue);
					return null;
				}
			}, true);

			return true;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Double incrbySortedSet(final String key, Double score, Serializable member) {
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));

			return this.redisTemplate.execute(new RedisCallback<Double>() {

				@Override
				public Double doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zIncrBy(rawKey, score, rawValue);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long cardSortedSet(final String key) {
		try {
			final byte[] rawKey = rawKey(key);
			return this.redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zCard(rawKey);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long rankSortedSet(String key, Serializable member) {
		try {
			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));
			return this.redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zRank(rawKey, rawValue);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long revrankSortedSet(String key, Serializable member) {
		try {
			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));
			return this.redisTemplate.execute(new RedisCallback<Long>() {

				@Override
				public Long doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zRevRank(rawKey, rawValue);
				}
			}, true);

		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public boolean removeSortedSet(final String key, Serializable member) {
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(serializableToString(member));

			this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public Object doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					connection.zRem(rawKey, rawValue);
					return null;
				}
			}, true);
			return true;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public ArrayList<String> rangeSortedSet(final String key, Long begin, Long end) {
		return rangeSortedSet(key, begin, end, String.class);
	}

	@Override
	public <T extends Serializable> ArrayList<T> rangeSortedSet(final String key, Long begin, Long end, Class<T> clazz) {
		try {
			final byte[] rawKey = rawKey(key);
			ArrayList<T> list = null;
			Set<byte[]> set = this.redisTemplate.execute(new RedisCallback<Set<byte[]>>() {

				@Override
				public Set<byte[]> doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zRange(rawKey, begin, end);
				}
			}, true);
			if (null != set) {
				list = new ArrayList<>();
				Iterator<byte[]> iterator = set.iterator();
				while (iterator.hasNext()) {
					byte[] b = iterator.next();
					String value = deserializeValue(b);
					list.add(stringToSerializable(value, clazz));
				}
			}
			return list;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public ArrayList<String> rangebyscoreSortedSet(final String key, Double min, Double max, Long offset, Long count) {
		return rangebyscoreSortedSet(key, min, max, offset, count, String.class);
	}

	@Override
	public <T extends Serializable> ArrayList<T> rangebyscoreSortedSet(final String key, Double min, Double max, Long offset, Long count, Class<T> clazz) {
		try {
			final byte[] rawKey = rawKey(key);
			ArrayList<T> list = null;
			Set<byte[]> set = this.redisTemplate.execute(new RedisCallback<Set<byte[]>>() {

				@Override
				public Set<byte[]> doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					if (null == offset || null == count) {
						return connection.zRangeByScore(rawKey, min, max);
					}
					return connection.zRangeByScore(rawKey, min, max, offset, count);
				}
			}, true);
			if (null != set) {
				list = new ArrayList<>();
				Iterator<byte[]> iterator = set.iterator();
				while (iterator.hasNext()) {
					byte[] b = iterator.next();
					String value = deserializeValue(b);
					list.add(stringToSerializable(value, clazz));
				}
			}
			return list;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public ArrayList<String> revrangeSortedSet(final String key, Long begin, Long end) {
		return revrangeSortedSet(key, begin, end, String.class);
	}

	@Override
	public <T extends Serializable> ArrayList<T> revrangeSortedSet(final String key, Long begin, Long end, Class<T> clazz) {
		try {
			final byte[] rawKey = rawKey(key);
			ArrayList<T> list = null;
			Set<byte[]> set = this.redisTemplate.execute(new RedisCallback<Set<byte[]>>() {

				@Override
				public Set<byte[]> doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zRevRange(rawKey, begin, end);
				}
			}, true);

			if (null != set) {
				list = new ArrayList<>();
				Iterator<byte[]> iterator = set.iterator();
				while (iterator.hasNext()) {
					byte[] b = iterator.next();
					String value = deserializeValue(b);
					list.add(stringToSerializable(value, clazz));
				}
			}
			return list;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public <T extends Serializable> ArrayList<com.fld.framework.entity.Entry<Double, T>> revrangeSortedSetWithScores(final String key, Long begin, Long end, Class<T> clazz) {
		try {
			final byte[] rawKey = rawKey(key);
			ArrayList<com.fld.framework.entity.Entry<Double, T>> list = new ArrayList<>();
			Set<Tuple> set = this.redisTemplate.execute(new RedisCallback<Set<Tuple>>() {

				@Override
				public Set<Tuple> doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					return connection.zRevRangeWithScores(rawKey, begin, end);
				}
			}, true);

			if (null != set) {
				Iterator<Tuple> iterator = set.iterator();
				while (iterator.hasNext()) {
					Tuple t = iterator.next();
					String value = deserializeValue(t.getValue());
					list.add(new com.fld.framework.entity.Entry<>(t.getScore(), stringToSerializable(value, clazz)));
				}
			}
			return list;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public ArrayList<String> revrangebyscoreSortedSet(final String key, Double min, Double max, Long offset, Long count) {
		return revrangebyscoreSortedSet(key, min, max, offset, count, String.class);
	}

	@Override
	public <T extends Serializable> ArrayList<T> revrangebyscoreSortedSet(final String key, Double min, Double max, Long offset, Long count, Class<T> clazz) {
		try {
			final byte[] rawKey = rawKey(key);
			ArrayList<T> list = null;
			Set<byte[]> set = this.redisTemplate.execute(new RedisCallback<Set<byte[]>>() {

				@Override
				public Set<byte[]> doInRedis(RedisConnection connection) {
					connection.select(chooseDb(key));
					if (null == offset || null == count) {
						return connection.zRevRangeByScore(rawKey, min, max);
					}
					return connection.zRevRangeByScore(rawKey, min, max, offset, count);
				}
			}, true);

			if (null != set) {
				list = new ArrayList<>();
				Iterator<byte[]> iterator = set.iterator();
				while (iterator.hasNext()) {
					byte[] b = iterator.next();
					String value = deserializeValue(b);
					list.add(stringToSerializable(value, clazz));
				}
			}
			return list;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public <T> T listLIndex(final String key, Long index, Class<T> clazz) {
		return JacksonUtils.readValue(listLIndex(key, index), clazz);
	}

	@Override
	public String listLIndex(final String key, Long index) {
		if (null == key) {
			return null;
		}
		try {
			final byte[] rawKey = rawKey(key);
			Object value = this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public String doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return deserializeValue(connection.lIndex(rawKey, index));
				}
			}, true);
			return null != value ? value.toString() : null;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long listLLen(final String key) {
		if (null == key) {
			return null;
		}
		try {
			final byte[] rawKey = rawKey(key);
			return this.redisTemplate.execute(new RedisCallback<Long>() {
				@Override
				public Long doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return connection.lLen(rawKey);
				}
			}, true);
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public <T> T listLPop(final String key, Class<T> clazz) {
		return JacksonUtils.readValue(listLPop(key), clazz);
	}

	@Override
	public String listLPop(final String key) {
		if (null == key) {
			return null;
		}
		try {
			final byte[] rawKey = rawKey(key);
			Object value = this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public String doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return deserializeValue(connection.lPop(rawKey));
				}
			}, true);
			return null != value ? value.toString() : null;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long listLPush(final String key, Serializable o) {
		return listLPush(key, serializableToString(o));
	}

	@Override
	public Long listLPush(final String key, String value) {
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(value);
			return this.redisTemplate.execute(new RedisCallback<Long>() {
				@Override
				public Long doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return connection.lPush(rawKey, rawValue);
				}
			}, true);
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public <T> T listRPop(final String key, Class<T> clazz) {
		return JacksonUtils.readValue(listRPop(key), clazz);
	}

	@Override
	public String listRPop(final String key) {
		if (null == key) {
			return null;
		}
		try {
			final byte[] rawKey = rawKey(key);
			Object value = this.redisTemplate.execute(new RedisCallback<Object>() {

				@Override
				public String doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return deserializeValue(connection.rPop(rawKey));
				}
			}, true);
			return null != value ? value.toString() : null;
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	@Override
	public Long listRPush(final String key, Serializable o) {
		return listRPush(key, serializableToString(o));
	}

	@Override
	public Long listRPush(final String key, String value) {
		try {

			final byte[] rawKey = rawKey(key);
			final byte[] rawValue = rawValue(value);
			return this.redisTemplate.execute(new RedisCallback<Long>() {
				@Override
				public Long doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return connection.rPush(rawKey, rawValue);
				}
			}, true);
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

	/***
	 * 获取键值的有效期
	 * 
	 * @param key
	 * @return
	 */
	@Override
	public Long getExpireTime(String key) {
		if (null == key) {
			return 0L;
		}
		try {
			final byte[] rawKey = rawKey(key);
			return this.redisTemplate.execute(new RedisCallback<Long>() {
				@Override
				public Long doInRedis(RedisConnection connection) throws DataAccessException {
					connection.select(chooseDb(key));
					return connection.ttl(rawKey);
				}
			}, true);
		} catch (Exception e) {
			LOGGER.error("redis throw exception", e);
			throw new CacheException(e);
		}
	}

}
