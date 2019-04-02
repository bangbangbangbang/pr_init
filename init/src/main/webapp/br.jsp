<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix='j' uri='/jsputil'%>
<!DOCTYPE html>
<html>
<head>
<script src="/res/js/jquery-2.1.1.min.js"></script> 
<script src="/res/js/common.js"></script> 
 </head>
 <body>
 
<h2>rnToBrCode</h2>
<textarea class="rnToBrCodeTT" rows="10" cols="100"></textarea>
<div class="rnToBrCode" style="min-height: 50px;background: #46f371;">

</div>
<script type="text/javascript">
 $(".rnToBrCodeTT").on("blur",function(){
	 $(".rnToBrCode").html($(this).val().rnToBrCode());
 })
 </script>
 <hr>
 
 
 
 
 
 
 
 <h2>brCodeToBr</h2>
<textarea class="brCodeToBrTT" rows="10" cols="100"></textarea>
<div class="brCodeToBr" style="min-height: 50px;background: #46f371">

</div>
 <script type="text/javascript">
 $(".brCodeToBrTT").on("blur",function(){
	 $(".brCodeToBr").text( $(this).val().brCodeToBr());
 })
 </script>
 </body>
 </html>