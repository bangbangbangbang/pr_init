package com.fld.init.model.dto.account;

import java.util.HashMap;
import java.util.Map;

public class UserComment implements java.io.Serializable {

	private static final long serialVersionUID = 1L;

	/**
	 * 评论id db_column: id
	 */
	private String id;
	/**
	 * 课程id db_column: course_id
	 */
	private String courseId;
	/**
	 * 用户uid db_column: uid
	 */
	private String uid;
	/**
	 * 课程类型：0 直播1 点播 db_column: course_type
	 */
	private Integer courseType;
	/**
	 * 评论类型：0.文字,1.打赏 2送花 db_column: comment_type
	 */
	private Integer commentType;
	/**
	 * 关联Id db_column: relate_id
	 */
	private Long relateId;
	/**
	 * 评论序号 db_column: comment_order_id
	 */
	private Long commentOrderId;
	/**
	 * 评论内容 db_column: content
	 */
	private String content;
	/**
	 * 图片 db_column: img_url
	 */
	private String imgUrl;
	/**
	 * 语音 db_column: voice_url
	 */
	private byte[] voiceUrl;
	/**
	 * 状态：1 正常 0 屏蔽 db_column: comment_status
	 */
	private Integer commentStatus;
	/**
	 * 操作员 db_column: oper_id
	 */
	private String operId;
	/**
	 * 操作时间 db_column: oper_time
	 */
	private Integer operTime;
	/**
	 * 原因 db_column: reason
	 */
	private String reason;
	/**
	 * 屏蔽时间 单位：秒 db_column: mask_time
	 */
	private Integer maskTime;
	/**
	 * 创建时间 单位：秒 db_column: create_time
	 */
	private Integer createTime;
	/**
	 * 修改时间 单位：秒 db_column: update_time
	 */
	private Integer updateTime;
	/**
	 * 备注 db_column: memo
	 */
	private String memo;

	public UserComment() {
	}

	public UserComment(String id) {
		this.id = id;
	}

	public UserComment(UserComment userComment) {
		if (null != userComment) {
			this.setId(userComment.getId());
			this.setCourseId(userComment.getCourseId());
			this.setUid(userComment.getUid());
			this.setCourseType(userComment.getCourseType());
			this.setCommentType(userComment.getCommentType());
			this.setRelateId(userComment.getRelateId());
			this.setCommentOrderId(userComment.getCommentOrderId());
			this.setContent(userComment.getContent());
			this.setImgUrl(userComment.getImgUrl());
			this.setVoiceUrl(userComment.getVoiceUrl());
			this.setCommentStatus(userComment.getCommentStatus());
			this.setOperId(userComment.getOperId());
			this.setOperTime(userComment.getOperTime());
			this.setReason(userComment.getReason());
			this.setMaskTime(userComment.getMaskTime());
			this.setCreateTime(userComment.getCreateTime());
			this.setUpdateTime(userComment.getUpdateTime());
			this.setMemo(userComment.getMemo());
		}
	}

	public Map<String, Object> toMap() {
		HashMap<String, Object> map = new HashMap<>();
		map.put("id", this.id);
		map.put("courseId", this.courseId);
		map.put("uid", this.uid);
		map.put("courseType", this.courseType);
		map.put("commentType", this.commentType);
		map.put("relateId", this.relateId);
		map.put("commentOrderId", this.commentOrderId);
		map.put("content", this.content);
		map.put("imgUrl", this.imgUrl);
		map.put("voiceUrl", this.voiceUrl);
		map.put("commentStatus", this.commentStatus);
		map.put("operId", this.operId);
		map.put("operTime", this.operTime);
		map.put("reason", this.reason);
		map.put("maskTime", this.maskTime);
		map.put("createTime", this.createTime);
		map.put("updateTime", this.updateTime);
		map.put("memo", this.memo);
		return map;
	}

	public void setId(String value) {
		this.id = value;
	}

	public String getId() {
		return this.id;
	}

	public void setCourseId(String value) {
		this.courseId = value;
	}

	public String getCourseId() {
		return this.courseId;
	}

	public void setUid(String value) {
		this.uid = value;
	}

	public String getUid() {
		return this.uid;
	}

	public void setCourseType(Integer value) {
		this.courseType = value;
	}

	public Integer getCourseType() {
		return this.courseType;
	}

	public void setCommentType(Integer value) {
		this.commentType = value;
	}

	public Integer getCommentType() {
		return this.commentType;
	}

	public void setRelateId(Long value) {
		this.relateId = value;
	}

	public Long getRelateId() {
		return this.relateId;
	}

	public void setCommentOrderId(Long value) {
		this.commentOrderId = value;
	}

	public Long getCommentOrderId() {
		return this.commentOrderId;
	}

	public void setContent(String value) {
		this.content = value;
	}

	public String getContent() {
		return this.content;
	}

	public void setImgUrl(String value) {
		this.imgUrl = value;
	}

	public String getImgUrl() {
		return this.imgUrl;
	}

	public void setVoiceUrl(byte[] value) {
		this.voiceUrl = value;
	}

	public byte[] getVoiceUrl() {
		return this.voiceUrl;
	}

	public void setCommentStatus(Integer value) {
		this.commentStatus = value;
	}

	public Integer getCommentStatus() {
		return this.commentStatus;
	}

	public void setOperId(String value) {
		this.operId = value;
	}

	public String getOperId() {
		return this.operId;
	}

	public void setOperTime(Integer value) {
		this.operTime = value;
	}

	public Integer getOperTime() {
		return this.operTime;
	}

	public void setReason(String value) {
		this.reason = value;
	}

	public String getReason() {
		return this.reason;
	}

	public void setMaskTime(Integer value) {
		this.maskTime = value;
	}

	public Integer getMaskTime() {
		return this.maskTime;
	}

	public void setCreateTime(Integer value) {
		this.createTime = value;
	}

	public Integer getCreateTime() {
		return this.createTime;
	}

	public void setUpdateTime(Integer value) {
		this.updateTime = value;
	}

	public Integer getUpdateTime() {
		return this.updateTime;
	}

	public void setMemo(String value) {
		this.memo = value;
	}

	public String getMemo() {
		return this.memo;
	}

}
