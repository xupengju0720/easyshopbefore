<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<link rel="stylesheet" type="text/css" href="css/reg.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
	</head>
	
	<body>
		<div class="nav-zhong">
			<div class="left">
				<i > <img src="img/logo555.png" style="width: 100px;height: 100px"/> 
		       </i>
				<a>添加地址</a>
			</div>
		</div>
		<div class="zhong">
		
			<form action="addressadd" method="post" class="loginForm left" accept-charset="UTF-8">
				<h2>填写地址</h2>
				<ul>
					<li>
						<span>省市:</span>
						<input type="text" name="zone" id="zone" value="" placeholder="请输入地址省市" class="user"/>
					</li>
					<li class="clear"></li>
					<li>
						<span>城区:</span>
						<input type="text" name="addr" id="addr" required="required"  value="" placeholder="请输入城区" class="psw"/>
					</li>
					<li class="clear"></li>
					<li>
					   <span>接收人：</span>
						<input type="text" name="name" id="name" value="" placeholder="请输入接收人" class="psw"/>
					</li>
					<li>
						<input type="hidden" name="user_id" id="user_id" value="${sessionScope.sdetail.id}" class="psw"/>
					</li>
					<li>
						<input type="hidden" name="tel" id="tel" value="${sessionScope.sdetail.tel}" class="psw"/>
					</li>
					<li>
						<input type="hidden" name="status" id="status" value=0 class="psw"/>
					</li>
				</ul>
				<p class="clear"></p>
				<a><button type="submit">新增</button></a>
			</form>
			
		</div>
		<b class="xia">
			<div class="about">
				<a href="">About us</a>
				<a href="">友情链接</a>
				<a href="">免责条款</a>
				<a href="">法律声明</a>
				<a href="">分类大全</a>
				<a href="">体验中心</a>
				<a href="">美丽课堂</a>
				<a href="">女人妆</a>
				<a href="">护肤百科</a>
			</div>
			<p>
				Powered by www.yidejia.com © 2008-2016 
				<a href="">粤ICP备13070863号</a>
			</p>
		</b>
		<div class="tan">
			<div class="zh">
				<div class="z">
					<h3>微信登录</h3>
					<img src="img/weixinlogin.jpg"/>
					<h4>请使用微信扫描二维码登录</h4>
					<h4>"小蜗商城"</h4>
				</div>
			</div>
		</div>
	</body>
</html>
