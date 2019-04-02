<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@include file="/commons/header-static.jsp" %>
<!DOCTYPE html>
<html>
<head lang="en">
    <meta charset="UTF-8">
    <title>喵姐早教说会员号</title>
     <%@include file="../header_v2.1.jsp" %>
    <script src="<b:staticUrl>/res/js/activity/datetime.js</b:staticUrl>"></script>
    <script src="<b:staticUrl>/res/js/activity/center.js</b:staticUrl>"></script>
</head>
<body>
<ul class="main">
		<li class="blockitem" onclick="window.location='/yzmm/account/toUploadLogo'">
			<div class="name">头像</div>
			<div class="cont"><div class="photo"><img src="${album}" ></div><span class="arrow"></span></div>
		</li>
		<li class="blockitem">
			<div class="name">姓名</div>
			<div class="cont"><span class="txt">${realName}</span></div>
		</li>	
		<li class="blockitem">
			<div class="name">性别</div>
			<div class="cont"><span class="txt">${sex}</span></div>
		</li>
		<li class="blockitem">
			<div class="name">手机号</div>
			<div class="cont"><span class="txt">${telephone}</span></div>
		</li>
	</ul>
	<ul class="main border0 baoHandle">
		<li class="blockitem" onclick="window.location='/yzmm/account/toModifyNickName'">
			<div class="name">昵称</div>
			<div class="cont"><span class="txt2">${nickName}</span><span class="arrow"></span></div>
		</li>
		<li class="blockitem">
				<div class="name">我的身份</div>
				<div class="cont idenfyValue"><span class="txt2"><c:if test="${babyOrNot==0}">喵星人</c:if><c:if test="${babyOrNot==1}">孕妈／爸</c:if><c:if test="${babyOrNot==2}">宝妈／爸</c:if></span><span class="arrow"></span></div>
		</li>
		<c:if test="${babyOrNot==1}">
			<li class="blockitem baobao">
				<div class="name">预产期</div>
				<div class="cont"><span class="txt2" id="babyBirthday" data-babyid="${babyId }"></span><span class="arrow"></span></div>
			</li>
		</c:if>
		<c:if test="${babyOrNot==2}">
			<c:if test="${hasCount==1}">
				<li class="blockitem baobao">
					<div class="name">大宝</div>
					<div class="cont"><span class="txt2 firstBabyId" data-babyid="${firstBabyId }" data-firstbabyid="${firstBabyId }" data-datetime="${firstBabyBirthday}">${firstBabySex} ${firstBabyBirthday}</span><span class="arrow"></span></div>
				</li>
			</c:if>
			<c:if test="${hasCount==2}">
				<li class="blockitem baobao">
					<div class="name">大宝</div>
					<div class="cont"><span class="txt2 firstBabyId" data-babyid="${firstBabyId }" data-firstbabyid="${firstBabyId }" data-datetime="${firstBabyBirthday}">${firstBabySex} ${firstBabyBirthday}</span><span class="arrow"></span></div>
				</li>
				<li class="blockitem baobao">
					<div class="name">二宝</div>
					<div class="cont"><span class="txt2 secondBabyId"data-babyid="${secondBabyId }" data-secondbabyid="${secondBabyId }" data-datetime="${secondBabyBirthday}">${secondBabySex} ${secondBabyBirthday}</span><span class="arrow"></span></div>
				</li>
			</c:if>
			<c:if test="${hasCount==3}">
				<li class="blockitem baobao">
					<div class="name">大宝</div>
					<div class="cont"><span class="txt2 firstBabyId" data-babyid="${firstBabyId }" data-firstbabyid="${firstBabyId }" data-datetime="${firstBabyBirthday}">${firstBabySex} ${firstBabyBirthday}</span><span class="arrow"></span></div>
				</li>
				<li class="blockitem baobao">
					<div class="name">二宝</div>
					<div class="cont"><span class="txt2 secondBabyId" data-babyid="${secondBabyId }" data-secondbabyid="${secondBabyId }" data-datetime="${secondBabyBirthday}">${secondBabySex} ${secondBabyBirthday}</span><span class="arrow"></span></div>
				</li>
				<li class="blockitem baobao">
					<div class="name">三宝</div>
					<div class="cont"><span class="txt2 thirdBabyId" data-babyid="${thirdBabyId }" data-thirdbabyid="${thirdBabyId }" data-datetime="${thirdBabyBirthday}">${thirdBabySex} ${thirdBabyBirthday}</span><span class="arrow"></span></div>
				</li>
			</c:if>
		</c:if>
		<c:if test="${babyOrNot==2}">
			<li class="blockitem baoBtn">
				<a href="javascript:;" class="addBtn tjbb">添加宝贝</a>
				<a href="javascript:;" class="removeBtn">删除宝贝</a>
			</li>
		</c:if>
		<c:if test="${babyOrNot==0||babyOrNot==1}">
			<li class="blockitem baoBtn" style='display:none'>
				<a href="javascript:;" class="addBtn">添加宝贝</a>
				<a href="javascript:;" class="removeBtn">删除宝贝</a>
			</li>
		</c:if>
	</ul>
	<div class="centerBack"><a href="/yzmm/account/user/info">返回</a></div>
<!--身份选择-->
<div class="font18 idenfy">
	<div class="idenfyList">
		<div class="idenfyItem">
			<div class="perCont">
				<span>孕妈／爸</span>
				<span class="active">宝妈／爸</span>
				<span>喵星人</span>
			</div>
		</div>
		<div class="handleBtn">
			<a href="javascript:void(0)" class="btn_cancle">取消</a>
			<a href="javascript:void(0)" class="btn_sure">确定</a>
		</div>
	</div>
</div>
<!--日历控件-->
<div class="font18 scroll" style="display:none;">
	<div class="scrollList">
		<div class="scrollTit">
			<span class="per33">年</span>
			<span class="per33">月</span>
			<span class="per33">日</span>
		</div>
		<div class="line"></div>
		<div class="scollItem per33 year">
			<div class="perCont">
				<span>2014</span>
				<span class="active">2015</span>
				<span>2016</span>
				<span>2017</span>
				<span>2019</span>
				<span>2020</span>
				<span>2021</span>
				<span>2022</span>
				<span>2023</span>
			</div>
		</div>
		<div class="scollItem per33 month">
			<div class="perCont">
				<span>1</span>
				<span class="active">2</span>
				<span>3</span>
				<span>4</span>
				<span>5</span>
				<span>6</span>
				<span>7</span>
				<span>8</span>
				<span>9</span>
				<span>10</span>
				<span>11</span>
				<span>12</span>
			</div>
		</div>
		<div class="scollItem per33 day">
			<div class="perCont">
				<span>1</span>
				<span class="active">2</span>
				<span>3</span>
				<span>4</span>
				<span>5</span>
				<span>6</span>
				<span>7</span>
				<span>8</span>
				<span>9</span>
				<span>10</span>
				<span>11</span>
				<span>12</span>
				<span>13</span>
				<span>14</span>
				<span>15</span>
				<span>16</span>
				<span>17</span>
				<span>18</span>
				<span>19</span>
				<span>20</span>
				<span>21</span>
				<span>22</span>
				<span>23</span>
				<span>24</span>
				<span>25</span>
				<span>26</span>
				<span>27</span>
				<span>28</span>
			</div>
		</div>
		<div class="scollItem per25" style="display:none"></div>
		<div class="clearfloat"></div>
		<div class="handleBtn">
			<a href="javascript:void(0)" class="btn_cancle">取消</a>
			<a href="javascript:void(0)" class="btn_sure">确定</a>
		</div>
	</div>
</div>
 <jsp:include page="/pages/header_footer.jsp">
		<jsp:param value="4" name="menu"/>
</jsp:include>
<script>
//孕妈预产期界面元素初始化
var babyBirthday='${babyBirthday }';
if(babyBirthday){
	$('#babyBirthday').html(fmtDate(new Date(babyBirthday*1000),'yyyy.MM.dd'));
	//data-datetime="${firstBabyBirthday}"
	$('#babyBirthday')[0].setAttribute('data-datetime',fmtDate(new Date(babyBirthday*1000),'yyyy.MM.dd'));
}
var babySex;//宝宝性别

var idenfy="${babyOrNot}";//身份信息 0喵  1孕 2宝妈
</script>
</body>
</html>