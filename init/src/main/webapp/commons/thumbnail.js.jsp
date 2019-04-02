<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
function thumbnailImg(img){
	if(img){
		if(img.indexOf("<%=com.sevenchildren.yzmm.framework.constant.Configuration.QINIU_FILE_BUCKET_HTTP%>")!=0){
			return img;
		}
		var img = img.replace("<%=com.sevenchildren.yzmm.framework.constant.Configuration.QINIU_FILE_BUCKET_HTTP%>", "<%=com.sevenchildren.yzmm.framework.constant.Configuration.THUMBNAIL_FILE_HTTP%>");
		return img+ "?imageMogr2/thumbnail/!50p";
	}
	return "";
};
</script>
