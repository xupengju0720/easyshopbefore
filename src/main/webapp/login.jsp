<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="css/login.css"/>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/login.js"></script>
	</head>
	<body>
		<div class="nav-zhong">
			<div class="left">
				 <i > <img src="img/logo555.png" style="width: 100px;height: 100px"/>
		         </i> 
			</div>
			<div class="right">
				<a href="register.jsp">立即注册</a>
				<p>还没有小蜗账号？</p>
			</div>
		</div>
		<div class="zhong">
			<form action="login" method="post" class="loginForm left">
				<h2>会员登录</h2>
				<ul>
					<li>
						<span>账号:</span>
						<input type="text" name="email" id="email" value="" required="required" placeholder="请输入您的手机号/邮箱/昵称" class="user"/>
						<div class="verify-tips">
							<h2>请输入您的手机号/邮箱/昵称</h2>
							<span>请输入您的手机号/邮箱/昵称</span>
						</div>
					</li>
					<li class="clear"></li>
					<li>
						<span>密码:</span>
						<input type="password" name="password" id="password" required="required"  value="" placeholder="请输入您的密码" class="psw"/>
						<div class="verify-tips">
							<h2>请输入您的密码</h2>
							<span>请输入您的密码</span>
						</div>
					</li>
				</ul>
				<p class="clear"></p>
				<p>
					<input type="checkbox" name="" id="" value="" checked="checked" class="remember"/>
					<label for="">自动登录</label>
					<a href="">忘记密码？</a>
				</p>
				<a><button  type="submit">立即登录</button></a>
				<div class="three">
					<h2>第三方账号登录:</h2>
					<a class="icon-box">
						<div class="weixin">
							<img src="img/weixin.png" alt="" />
						</div>
						<p>微信登录</p>
					</a>
				</div>
			</form>
			<a class="right" href="">
				<img src="img/login-1.png"/>
			</a>
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
