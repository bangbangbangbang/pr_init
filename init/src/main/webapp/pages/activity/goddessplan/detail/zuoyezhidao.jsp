<!--作业指导 -->
<style>
	.zyzd {
	    width: 100%;
	    max-width: 540px;
	    margin: 0 auto;
	    height: 100%;
	    position: fixed;
	    top: 0;
	    z-index: 100;
	    padding: 0 0.4rem;
	    overflow: auto;
	    background-color: rgba(0, 0, 0, 0.5);
   }
   .zyzd .zyzdBox {
	    margin-top: 2.66666667rem;
	    padding: 0.64rem 0;
	    background-color: #fff;
	    border-radius: 0.10666667rem;
	}
	.zyzd .tit {
	    text-align: center;
	    color: #666;
	}
	.font17 {
	    font-size: 17px;
	    line-height: 17px;
	}
	.zyzd .zyzdItem div {
	    padding: 0.4rem 0.74666667rem;
	    border-bottom: 0.32rem solid #efeff4;
	}
	.zyzd .zyzdItem h2 {
	    padding-bottom: 0.16rem;
	    font-weight: normal;
	    color: #666;
	}
	.font15 {
	    font-size: 15px;
	    line-height: 15px;
	}
	.zyzd .zyzdItem p {
	    line-height: 0.50666667rem;
	    color: #666;
	}
	.zyzd .zyzdBtn {
	    display: block;
	    width: 4.53333333rem;
	    height: 1.22666667rem;
	    line-height: 1.22666667rem;
	    margin: 0 auto;
	    margin-top: 0.4rem;
	    background-color: #e51812;
	    border-radius: 0.10666667rem;
	    text-align: center;
	    color: #fff;
	}
	
	.font18 {
	    font-size: 18px;
	    line-height: 18px;
	}
</style>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<div class="zyzd zuoyezhidao" style="padding-bottom: 100px;" hidden="">
	<div class="zyzdBox zuoyezhidaoBox">
	<div class="font17 tit">第${week}周作业指导</div>
		<div class="zyzdItem">
		  <c:if test="${not empty daysPlanActivity.activityDetailOneTitle or not empty daysPlanActivity.activityDetailOne}">
			<div>
				  <c:if test="${not empty daysPlanActivity.activityDetailOneTitle}">
				<h2 class="font15">${daysPlanActivity.activityDetailOneTitle}：</h2>
				</c:if>
				  <c:if test="${not empty daysPlanActivity.activityDetailOne}">
				<p class="font12">${daysPlanActivity.activityDetailOne}</p>
				</c:if>
			</div>
			</c:if>
		  <c:if test="${not empty daysPlanActivity.activityDetailTwoTitle or not empty daysPlanActivity.activityDetailTwo}">
			<div>
				<c:if test="${not empty daysPlanActivity.activityDetailTwoTitle}">
				<h2 class="font15">${daysPlanActivity.activityDetailTwoTitle}：</h2>
				</c:if>
				<c:if test="${not empty daysPlanActivity.activityDetailTwo}">
				<p class="font12">${daysPlanActivity.activityDetailTwo}</p>
				</c:if>
			</div>
			</c:if>
		  <c:if test="${not empty daysPlanActivity.activityDetailThreeTitle or not empty daysPlanActivity.activityDetailThree}">
			<div>
				 <c:if test="${not empty daysPlanActivity.activityDetailThreeTitle}">
				<h2 class="font15">${daysPlanActivity.activityDetailThreeTitle}：</h2>
				</c:if>
				 <c:if test="${not empty daysPlanActivity.activityDetailThree}">
				<p class="font12">${daysPlanActivity.activityDetailThree}</p>
				</c:if>
			</div>
			</c:if>
		</div>
	<a href="javascript:void(0)" class="font18 zyzdBtn zuoyezhidaoBtn">我学会了</a>
	</div>
</div>