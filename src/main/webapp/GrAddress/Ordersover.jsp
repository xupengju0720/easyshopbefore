<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="../css/login.css"/>
		<link rel="stylesheet" type="text/css" href="../css/reg.css"/>
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/login.js"></script>
	</head>
	
	<body>
			<form action="addressinsert" method="post" class="loginForm left" accept-charset="UTF-8">
						<span>省市:</span>
						<input type="text" name="zone" id="zone" value="" placeholder="请输入地址省市" class="user"/>
						<br> <span>城区:</span>
						<input type="text" name="addr" id="addr" required="required"  value="" placeholder="请输入城区" class="psw"/>
					    <br> <span>姓名:</span>
						<input type="text" name="name" id="name" value="" placeholder="请输入接收人" class="psw"/>
						<input type="hidden" name="user_id" id="user_id" value="${sessionScope.sdetail.id}" class="psw"/>
						<input type="hidden" name="tel" id="tel" value="${sessionScope.sdetail.tel}" class="psw"/>
						<input type="hidden" name="status" id="status" value=0 class="psw"/>
				<p class="clear"></p>
				<a><button type="submit">保存</button></a>
			</form>
	</body>
</html>
