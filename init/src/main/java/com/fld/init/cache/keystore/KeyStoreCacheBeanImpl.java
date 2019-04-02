package com.fld.init.cache.keystore;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicLong;

import org.apache.commons.lang3.StringUtils;
import org.springframework.stereotype.Service;

@Service
public class KeyStoreCacheBeanImpl implements IKeyStoreCache {
	// baseconfig中取
	// @Resource
	// private IConfigService configService;

	private AtomicLong time = new AtomicLong(0);
	private Long breakTime = 5L * 60 * 1000;

	private Map<String, String> myKeyMap = new ConcurrentHashMap<String, String>();
	private Map<String, String> targetKeyMap = new ConcurrentHashMap<String, String>();

	public KeyStoreCacheBeanImpl() {
	}

	/**
	 * 本系统发给serviceId的key
	 * 
	 * @param serviceId
	 * @return
	 */
	@Override
	public String getMykey(String serviceId) {
		String sercertKey = myKeyMap.get(serviceId);
		if (StringUtils.isBlank(sercertKey)) {
			initKeystore();
			sercertKey = myKeyMap.get(serviceId);
		}
		// TODO yzmm
		if (StringUtils.isBlank(sercertKey)) {
			return "gj6uaP4JrkJQBbP3qj8VdiO9";
		}
		return sercertKey;
	}

	@Override
	public String getTargekey(String targetServiceId) {
		String sercertKey = targetKeyMap.get(targetServiceId);
		if (StringUtils.isBlank(sercertKey)) {
			initKeystore();
			sercertKey = targetKeyMap.get(targetServiceId);
		}
		// TODO yzmm
		if (StringUtils.isBlank(sercertKey)) {
			return "gj6uaP4JrkJQBbP3qj8VdiO9";
		}
		return sercertKey;
	}

	private void initKeystore() {
		long current = System.currentTimeMillis();

		if (current - time.get() > breakTime) {
			/**
			 * RelationReq rReq = new RelationReq(); rReq.setInternalIp(Configuration.PROJECT_RUNTIME_IP); rReq.setInternalPort(Configuration.PROJECT_RUNTIME_PORT); ServiceResult<List<RelationResp>> srcs = configService.getRelationListByServiceId(rReq); if(srcs.isSuccess() && null != srcs.getBusinessObject()){ for (RelationResp rr : srcs.getBusinessObject()) { if(null == rr){ continue; } if(Configuration.SERVICE_ID.equals(rr.getGoalServiceId())){ myKeyMap.put(rr.getFromServiceId(),
			 * rr.getSercertKey()); }else if(Configuration.SERVICE_ID.equals(rr.getFromServiceId())){ targetKeyMap.put(rr.getGoalServiceId(), rr.getSercertKey()); } } //清除原有数据 time.set(current); }
			 */
			// yzmm
		}
	}

}
