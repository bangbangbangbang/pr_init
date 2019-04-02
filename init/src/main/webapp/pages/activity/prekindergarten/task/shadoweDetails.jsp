<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <!--忽略页面中的邮箱格式为邮箱-->
    <meta name="format-detection" content="email=no">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, user-scalable=0, minimum-scale=1.0, maximum-scale=1.0">
    <meta name="format-detection" content="telephone=no,address=no,email=no">
    <meta name="keywords" content="喵姐,喵姐早教说,0到6岁早期教育,家庭教育,家长教育,父母课堂,育儿知识,儿童教育,母婴育儿,">
    <meta name="description" content="喵姐早教说是喵姐高寿岩创办的为家庭教育提供专业靠谱的0到6岁早期教育、育儿知识的平台。">
    <title>喵姐早教说</title>
     <%@include file="../../../header_v2.4.0.jsp" %>
    <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/shadoweDetails.css</b:staticUrl>">
	<style type="text/css">
		.wrapPage .shaDetBtn {
		 text-align: center;
		 font-size: 0.3rem;
		 color: #949494;
		 padding-bottom: 0.5rem;
		}
	</style>
</head>
<body>
    <div class="wrapPage">
            <!--顶部的标题-->
            <h3 class="shaDetTit">家庭版入园准备训练</h3>
            <p class="shaDetAtta">训练主题</p>
            <!--社会交往-->
            <div class="contentReco clearfix">
                 <div class="recoSubLe">
                      <p>社会交往</p>
                 </div>
                 <div class="recoSubRi clearfix">
                      <p class="subMar">• 适应能力</p>
                      <p class="subMar">• 专注做事</p>
                      <p>• 遵守规则</p>
                      <p>• 与人合作</p>
                </div>
           </div>        
           <!--语言表达-->
           <div class="contentReco clearfix">
                 <div class="recoSubLe">
                      <p class="lang">语言表达</p>
                 </div>
                 <div class="recoSubRi clearfix">
                      <p class="subLan subMar">• 理解他人意图</p>
                      <p class="subLan">• 服从指令</p>
                      <p class="subLan">• 向不熟悉的人表达需求</p>
                </div>
           </div>
           <!--生活自理-->
           <div class="contentReco clearfix">
                <div class="recoSubLe">
                     <p>生活自理</p>
                </div>
                <div class="recoSubRi clearfix">
                     <p class="subMar">• 吃饭习惯</p>
                     <p class="subMar">• 排便控制</p>
                     <p>• 睡眠作息</p>
                     <p>• 自我服务意识</p>
                </div>
           </div>
           <!--家庭准备-->
           <div class="contentReco clearfix">
                <div class="recoSubLe">
                     <p class="lang">家庭准备</p>
                </div>
                <div class="recoSubRi clearfix">
                     <p class="subLan subMar">• 亲子依恋关系</p>
                     <p class="subLan">•  孩子的安全感</p>
                     <p class="subLan">• 家庭的心态及重视程度</p>
               </div>
          </div>
          <a href="javascript:void(0);" class="shadoweBtn">了解详情</a>
          <div style="padding-bottom: 0.5rem">
          	<p class="shaDetBtn" style="text-align: center;font-size: 0.3rem;color: #949494;">听说：现在报名还有优惠</p>
          </div>
     </div>
     <script type="text/javascript">
     $(function(){
	     $('.shadoweBtn').on('click',function(){
	     	HH.href('/yzmm/account/activity/kja/task/shadoweDetails?activityId=${activityId}');
	     });
     })
     </script>
</body>
</html>