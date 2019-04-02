package com.fld.init.cache;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Map;

public interface RedisCachedManager {
	/**
	 * SortedSet score 正无穷 <br>
	 * 例如 ZRANGEBYSCORE salary -inf +inf # 显示整个有序集及成员的 score 值 <br>
	 * 例如 ZRANGEBYSCORE salary -inf 5000 # 显示工资 <=5000 的所有成员
	 */
	// public static final String SORTEDSET_SCORE_PLUS_INFINITY = "+inf";
	/**
	 * SortedSet score 负无穷 <br>
	 * 例如 ZRANGEBYSCORE salary -inf +inf # 显示整个有序集及成员的 score 值 <br>
	 * 例如 ZRANGEBYSCORE salary -inf 5000 # 显示工资 <=5000 的所有成员
	 */
	// public static final String SORTEDSET_SCORE_MINUS_INFINITY = "-inf";

	/**
	 * 添加操作(对象)
	 * 
	 * @param key
	 * @param o
	 * @return
	 */
	public boolean set(String key, Serializable o);

	/**
	 * 若不存在则添加操作(对象)
	 * 
	 * @param key
	 * @param o
	 * @return
	 */
	public boolean setNX(String key, Serializable o);

	/**
	 * 若不存在则添加操作(对象)
	 * 
	 * @param key
	 * @param exprieInSecond
	 *            超时时间单位秒
	 * @param o
	 * @return
	 */
	public boolean setNX(String key, int exprieInSecond, Serializable o);

	/**
	 * 对应于set操作，没有就add，有就replace
	 * 
	 * @param key
	 * @param exprieInSecond
	 *            超时时间单位秒
	 * @param o
	 * @return
	 */
	public boolean set(String key, int exprieInSecond, Serializable o);

	/**
	 * 取单个信息(对象)
	 * 
	 * @param key
	 * @return Object
	 */
	public String get(String key);

	/**
	 * 取单个信息(对象)
	 * 
	 * @param key
	 * @return Object
	 */
	public <T extends Serializable> T get(String key, Class<T> clazz);

	/**
	 * 取多个信息
	 * 
	 * @param key
	 * @return
	 */
	public Map<String, String> getMultiString(String... key);

	/**
	 * 删除 本类总接口全部捕获异常
	 * 
	 * @param key
	 * @return
	 */
	public boolean remove(String key);

	/**
	 * 将相关key的value加一返回
	 */
	public Long addOrIncr(String key);

	/**
	 * 将相关key的value加指定值返回现
	 */
	public Long addOrIncr(String key, int incrValue);

	/**
	 * 
	 * @Description:设置过期时间
	 * @param key
	 * @param exprieInSecond
	 *            单位：秒
	 * @return boolean
	 * 
	 */
	boolean expire(String key, int exprieInSecond);

	/**
	 * 
	 * @Description:判断key是否存在
	 * @param key
	 * @return boolean
	 * 
	 */
	boolean hasKey(String key);

	/**
	 * 
	 * @Description:获取hash
	 * @param key
	 * @return Map<String,String>
	 * 
	 */
	Map<String, String> getHash(String key);

	/**
	 * 
	 * @Description:
	 * @param key
	 * @param hashKey
	 * @return Object
	 * 
	 */
	String getHash(String key, String hashKey);

	/**
	 * 
	 * @Description:
	 * @param key
	 * @param m
	 * @return boolean
	 * 
	 */
	boolean setHash(String key, Map<String, String> m);

	/**
	 * 
	 * @Description:
	 * @param key
	 * @param hashKey
	 * @param hashValue
	 * @return boolean
	 * 
	 */
	boolean setHash(String key, String hashKey, String hashValue);

	/**
	 * 
	 * @Description:
	 * @param key
	 * @param hashKey
	 * @return boolean
	 */
	boolean removeHash(String key, String hashKey);

	/**
	 * 
	 * @Title: countHash
	 * @Description: hash 数量
	 * @author zhaokuner
	 * @param key
	 * @return
	 */
	Long countHash(String key);

	/**
	 * 
	 * @Title: setSortedSet
	 * @Description:
	 * @author zhaokuner
	 * @param key
	 * @param score
	 * @param o
	 * @return
	 * 
	 */
	boolean setSortedSet(String key, Double score, Serializable member);

	/**
	 * 
	 * @Title: setSortedSet
	 * @Description: sortSet 中成员分值自增
	 * @author yifan
	 * @param key
	 * @param score
	 * @param o
	 * @return
	 * 
	 */
	Double incrbySortedSet(String key, Double score, Serializable member);

	/**
	 * 
	 * @Title: setSortedSet
	 * @Description:获取sortedSet集合中成员数量
	 * @author yifan
	 * @param key
	 * @param score
	 * @param o
	 * @return
	 * 
	 */
	Long cardSortedSet(String key);

	/**
	 * 
	 * @Title: removeSortedSet
	 * @Description:
	 * @author zhaokuner
	 * @param key
	 * @param member
	 * @return
	 * 
	 */
	boolean removeSortedSet(String key, Serializable member);

	/**
	 * 
	 * @Title: rangeSortedSet
	 * @Description: 排序 score 小到大 下标参数 start 和 stop 都以 0 为底，也就是说，以 0 表示有序集第一个成员，以 1 表示有序集第二个成员，以此类推。你也可以使用负数下标，以 -1 表示最后一个成员， -2 表示倒数第二个成员，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param begin
	 * @param end
	 * @return
	 * 
	 */
	ArrayList<String> rangeSortedSet(String key, Long begin, Long end);

	/**
	 * 
	 * @Title: rangeSortedSet
	 * @Description: 排序 score 小到大 下标参数 start 和 stop 都以 0 为底，也就是说，以 0 表示有序集第一个成员，以 1 表示有序集第二个成员，以此类推。你也可以使用负数下标，以 -1 表示最后一个成员， -2 表示倒数第二个成员，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param begin
	 * @param end
	 * @param clazz
	 * @return
	 * 
	 */
	<T extends Serializable> ArrayList<T> rangeSortedSet(String key, Long begin, Long end, Class<T> clazz);

	/**
	 * 
	 * @Title: revrangeSortedSet
	 * @Description: 排序 score 大到小 下标参数 start 和 stop 都以 0 为底，也就是说，以 0 表示有序集第一个成员，以 1 表示有序集第二个成员，以此类推。你也可以使用负数下标，以 -1 表示最后一个成员， -2 表示倒数第二个成员，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param begin
	 * @param end
	 * @return
	 * 
	 */
	ArrayList<String> revrangeSortedSet(String key, Long begin, Long end);

	/**
	 * 
	 * @Title: revrangeSortedSet
	 * @Description: 排序 score 大到小 下标参数 start 和 stop 都以 0 为底，也就是说，以 0 表示有序集第一个成员，以 1 表示有序集第二个成员，以此类推。你也可以使用负数下标，以 -1 表示最后一个成员， -2 表示倒数第二个成员，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param begin
	 * @param end
	 * @return
	 * 
	 */
	<T extends Serializable> ArrayList<com.fld.framework.entity.Entry<Double, T>> revrangeSortedSetWithScores(String key, Long begin, Long end, Class<T> clazz);

	/**
	 * 
	 * @Title: revrangeSortedSet
	 * @Description: 排序 score 大到小 下标参数 start 和 stop 都以 0 为底，也就是说，以 0 表示有序集第一个成员，以 1 表示有序集第二个成员，以此类推。你也可以使用负数下标，以 -1 表示最后一个成员， -2 表示倒数第二个成员，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param begin
	 * @param end
	 * @param clazz
	 * @return
	 * 
	 */
	<T extends Serializable> ArrayList<T> revrangeSortedSet(String key, Long begin, Long end, Class<T> clazz);

	/**
	 * 
	 * @Title: revrangebyscoreSortedSet
	 * @Description: 返回有序集 key 中， score 值介于 max 和 min 之间(默认包括等于 max 或 min )的所有的成员。有序集成员按 score 值递减(从大到小)的次序排列。 可选的 LIMIT(offset count) 参数指定返回结果的数量及区间(就像SQL中的 SELECT LIMIT offset, count )
	 * @author zhaokuner
	 * @param key
	 * @param min
	 * @param max
	 * @param offset
	 *            可以为空，查询不分页
	 * @param count
	 *            可以为空，查询不分页
	 * @return
	 * 
	 */
	ArrayList<String> revrangebyscoreSortedSet(String key, Double min, Double max, Long offset, Long count);

	/**
	 * 
	 * @Title: revrangebyscoreSortedSet
	 * @Description: 返回有序集 key 中， score 值介于 max 和 min 之间(默认包括等于 max 或 min )的所有的成员。有序集成员按 score 值递减(从大到小)的次序排列。 可选的 LIMIT(offset count) 参数指定返回结果的数量及区间(就像SQL中的 SELECT LIMIT offset, count )
	 * @author zhaokuner
	 * @param key
	 * @param min
	 * @param max
	 * @param offset
	 *            可以为空，查询不分页
	 * @param count
	 *            可以为空，查询不分页
	 * @param clazz
	 * @return
	 * 
	 */
	<T extends Serializable> ArrayList<T> revrangebyscoreSortedSet(String key, Double min, Double max, Long offset, Long count, Class<T> clazz);

	/**
	 * 
	 * @Title: rangebyscoreSortedSet
	 * @Description: 返回有序集 key 中，所有 score 值介于 min 和 max 之间(包括等于 min 或 max )的成员。有序集成员按 score 值递增(从小到大)次序排列。 可选的 LIMIT(offset count) 参数指定返回结果的数量及区间(就像SQL中的 SELECT LIMIT offset, count )
	 * @author zhaokuner
	 * @param key
	 * @param min
	 * @param max
	 * @param offset
	 *            可以为空，查询不分页
	 * @param count
	 *            可以为空，查询不分页
	 * @return
	 * 
	 */
	ArrayList<String> rangebyscoreSortedSet(String key, Double min, Double max, Long offset, Long count);

	/**
	 * 
	 * @Title: rangebyscoreSortedSet
	 * @Description: 返回有序集 key 中，所有 score 值介于 min 和 max 之间(包括等于 min 或 max )的成员。有序集成员按 score 值递增(从小到大)次序排列。 可选的 LIMIT(offset count) 参数指定返回结果的数量及区间(就像SQL中的 SELECT LIMIT offset, count )
	 * @author zhaokuner
	 * @param key
	 * @param min
	 * @param max
	 * @param offset
	 *            可以为空，查询不分页
	 * @param count
	 *            可以为空，查询不分页
	 * @param clazz
	 * @return
	 * 
	 */
	<T extends Serializable> ArrayList<T> rangebyscoreSortedSet(String key, Double min, Double max, Long offset, Long count, Class<T> clazz);

	/**
	 * 
	 * @Title: countSortedSet
	 * @Description: 返回有序集 key 中， score 值在 min 和 max 之间(默认包括 score 值等于 min 或 max )的成员的数量。
	 * @author zhaokuner
	 * @param key
	 * @param min
	 * @param max
	 * @return
	 * 
	 */
	Long countSortedSet(String key, Double min, Double max);

	/**
	 * 
	 * @Title: hasSortedSet
	 * @Description: member 是否存在
	 * @author zhaokuner
	 * @param key
	 * @param member
	 * @return
	 * 
	 */
	boolean hasSortedSet(String key, Serializable member);

	/**
	 * 
	 * @Title: scoreSortedSet
	 * @Description: 返回有序集 key 中，成员 member 的 score 值。 如果 member 元素不是有序集 key 的成员，或 key 不存在，返回 nil [-1] 。
	 * @author zhaokuner
	 * @param key
	 * @param member
	 * @return
	 */
	Double scoreSortedSet(String key, Serializable member);

	/**
	 * 
	 * @Title: rankSortedSet
	 * @Description: 返回有序集 key 中成员 member 的排名。其中有序集成员按 score 值递增(从小到大)顺序排列。 排名以 0 为底，也就是说， score 值最小的成员排名为 0 。
	 * @author zhaokuner
	 * @param key
	 * @param member
	 * @return
	 */
	Long rankSortedSet(String key, Serializable member);

	/**
	 * 
	 * @Title: rankSortedSet
	 * @Description: 返回有序集 key 中成员 member 的排名。其中有序集成员按 score 值递减(从大到小)排序。 排名以 0 为底，也就是说， score 值最大的成员排名为 0 。
	 * @author zhaokuner
	 * @param key
	 * @param member
	 * @return
	 */
	Long revrankSortedSet(String key, Serializable member);

	/**
	 * 
	 * @Title: listLIndex
	 * @Description: 返回列表 key 中，下标为 index 的元素。<br>
	 *               下标(index)参数 start 和 stop 都以 0 为底，也就是说，以 0 表示列表的第一个元素，以 1 表示列表的第二个元素，以此类推。<br>
	 *               你也可以使用负数下标，以 -1 表示列表的最后一个元素， -2 表示列表的倒数第二个元素，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param index
	 * @param clazz
	 * @return
	 */
	<T> T listLIndex(String key, Long index, Class<T> clazz);

	/**
	 * 
	 * @Title: listLIndex
	 * @Description: 返回列表 key 中，下标为 index 的元素。<br>
	 *               下标(index)参数 start 和 stop 都以 0 为底，也就是说，以 0 表示列表的第一个元素，以 1 表示列表的第二个元素，以此类推。<br>
	 *               你也可以使用负数下标，以 -1 表示列表的最后一个元素， -2 表示列表的倒数第二个元素，以此类推。
	 * @author zhaokuner
	 * @param key
	 * @param index
	 * @return
	 */
	String listLIndex(String key, Long index);

	/**
	 * 
	 * @Title: listLLen
	 * @Description返回列表 key 的长度。 如果 key 不存在，则 key 被解释为一个空列表，返回 0 .
	 * @author zhaokuner
	 * @param key
	 * @return
	 */
	Long listLLen(String key);

	/**
	 * 
	 * @Title: listLPop
	 * @Description: 移除并返回列表 key 的头元素。
	 * @author zhaokuner
	 * @param key
	 * @param clazz
	 * @return
	 */
	<T> T listLPop(String key, Class<T> clazz);

	/**
	 * 
	 * @Title: listLPop
	 * @Description: 移除并返回列表 key 的头元素。
	 * @author zhaokuner
	 * @param key
	 * @return
	 */
	String listLPop(String key);

	/**
	 * 
	 * @Title: listLPush
	 * @Description: 将一个或多个值 value 插入到列表 key 的表头 如果 key 不存在，一个空列表会被创建并执行 LPUSH 操作。
	 * @author zhaokuner
	 * @param key
	 * @param o
	 * @return
	 */
	Long listLPush(String key, Serializable o);

	/**
	 * 
	 * @Title: listLPush
	 * @Description: 将一个或多个值 value 插入到列表 key 的表头 如果 key 不存在，一个空列表会被创建并执行 LPUSH 操作。
	 * @author zhaokuner
	 * @param key
	 * @param value
	 * @return
	 */
	Long listLPush(String key, String value);

	/**
	 * 
	 * @Title: listRPop
	 * @Description:移除并返回列表 key 的尾元素。
	 * @author zhaokuner
	 * @param key
	 * @param clazz
	 * @return
	 */
	<T> T listRPop(String key, Class<T> clazz);

	/**
	 * 
	 * @Title: listRPop
	 * @Description: 移除并返回列表 key 的尾元素。
	 * @author zhaokuner
	 * @param key
	 * @return
	 */
	String listRPop(String key);

	/**
	 * 
	 * @Title: listRPush
	 * @Description:将一个或多个值 value 插入到列表 key 的表尾(最右边)。如果 key 不存在，一个空列表会被创建并执行 RPUSH 操作。
	 * @author zhaokuner
	 * @param key
	 * @param o
	 * @return
	 */
	Long listRPush(String key, Serializable o);

	/**
	 * 
	 * @Title: listRPush
	 * @Description:将一个或多个值 value 插入到列表 key 的表尾(最右边)。如果 key 不存在，一个空列表会被创建并执行 RPUSH 操作。
	 * @author zhaokuner
	 * @param key
	 * @param value
	 * @return
	 */
	Long listRPush(String key, String value);

	/***
	 * 获取键值的有效期
	 * 
	 * @param key
	 * @return
	 */
	public Long getExpireTime(String key);

}
