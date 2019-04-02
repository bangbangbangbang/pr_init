<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>喵姐早教说</title>
	<%@include file="../../header_v2.4.0.jsp" %>
	<%@include file="../../header_wxjsapi.jsp"%>
	 <link rel="stylesheet" href="<b:staticUrl>/res/css/prekindergarten/sharelinks.css</b:staticUrl>">
	 <script type="text/javascript">
	var wxfenxiangcb_dtl={
				title: '${wxshare.title}', // 分享标题
				desc : '${wxshare.desc}',
			    link: '${wxshare.link}', // 分享链接
			    imgUrl: '${wxshare.imgUrl}', // 分享图标
			    shareTimeline:function(bool){
			    
			    },
			    shareAppMessage:function(bool){
			     
			    }
			};
	
			 initwxfx(wxfenxiangcb_dtl);
			
	</script>
</head>
<body>
    <div class="wrapPage"> 
        <div class="centreRegion">
            <!--个人信息-->
            <div class="headerRegion">
                <div class="portrait clearfix">
                     <div class="porImg fl">
                         <img src="${albumUrl }" alt="">
                     </div>
                     <div class="porName fl">
                        <span class="nameTop">${nickName }</span>
                        <p class="nameBaby">宝宝：<span>${babyNickname }</span></p>
                     </div>
                </div>
                <h3 class="regionTitle"> 第 ${week} 阶段${name}成绩单
                </h3>
                <div class="regionBtn">
                    <p>${name}</p>
                </div>
            </div>
            <!--百分比值-->
            <ul class="ratio clearfix">
              <c:if test="${size > 0}">
                <!--语言表达-->
                <li class="ratioPublic">
                    <div class="languageDiv">
                        <p>${list[0].analyzeScorString}<span>%</span></p>
                    </div>
                    <p class="langText">${list[0].dimensionName}</p>
                </li>
                 </c:if>
                <c:if test="${size > 1}">
                <li class="ratioPublic">
                    <div class="languageDiv lifeDiv">
                        <p class="lifeP">${list[1].analyzeScorString}<span>%</span></p>
                    </div>
                    <p class="langText lifeText">${list[1].dimensionName}</p>
                </li>
                </c:if>
                <c:if test="${size > 2}">
                <li class="ratioPublic">
                    <div class="languageDiv sociologyDiv">
                        <p class=" sociologyP">${list[2].analyzeScorString}<span>%</span></p>
                    </div>
                    <p class="langText sociologyText">${list[2].dimensionName}</p>
                </li>
                 </c:if>
                <c:if test="${size > 3}">
                <li class="ratioPublic">
                    <div class="languageDiv familyDiv">
                        <p class="familyP">${list[3].analyzeScorString}<span>%</span></p>
                    </div>
                    <p class="langText familyText">${list[3].dimensionName}</p>
                </li>
                </c:if>
            </ul>
            <!--分割线-->
            <div class="line">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li class="liImg">
                       <img src="<b:staticUrl>/res/img/prekindergarten/sharelinks/u5422.png</b:staticUrl>" alt="" class="lineImg">
                    </li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
                
            </div>
            <!--让宝宝不哭不闹轻松入园-->
            <div class="regionTxt">
                <div class="txtTitle clearfix">
                    <h2 class="fl">4-8周</h2>
                    <span class="fl">让宝宝不哭不闹轻松入园</span>
                </div>
                <p>72项智能任务单元</p>
                <p>完美提升入园必备4项核心能力</p>
                <p class="txtP">国内第一套入园适应训练</p>
            </div>
            <div class="line">
                <ul>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                    <li></li>
                </ul>
                
            </div>
            <div class="botCode clearfix">
                <img src="/yzmm/account/qrcode/gen?url=${shareQRcode }" alt="" class="code fl">
                <div class="botRight fl">
                    <div class="rightPress clearfix">
                        <img src="<b:staticUrl>/res/img/prekindergarten/sharelinks/u3183.png</b:staticUrl>" alt="" class="fl">
                        <p class="fl">长按识别二维码</p>
                    </div>
                    <p class="rightFollow">定制专属入园适应训练方案</p>
                </div>
            </div>
        </div>
    </div>      
</body>
</html>