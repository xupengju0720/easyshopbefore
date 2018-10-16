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
				<a href="index.html" class="logo">
					<i > <img src="img/logo555.png" style="width: 100px;height: 100px">
				</i>
				</a>
				<p>欢迎注册</p>
			</div>
			<div class="right">
				<a href="login.html">立即登录</a>
				<p>已有京东账号？</p>
			</div>
		</div>
		<div class="zhong">
			<form action="newone" method="post" class="loginForm left">
				<h2>会员注册</h2>
				<ul>
					<li>
						<span>手机号:</span>
						<input type="text" name="tel" id="tel"  required="required"  value=""  placeholder="请输入您的手机号" class="psw" />
					</li>
					<li class="clear"></li>
					<li>
						<span>用户名:</span>
						<input type="text" name="email" id="email" required="required"  placeholder="请输入您的账号"  value=""  class="user"/>
					</li>
					<li class="clear"></li>
					<li>
					   <span>密码:</span>
						<input type="password" name="password" id="password" required="required"  value=""  class="psw"/>
					</li>
					<li>
						<input type="hidden" name="level" id="level" value=0 " class="psw"/>
					</li>
					<li>
						<input type="hidden" name="status" id="status" value=0 class="psw"/>
					</li>
					<li>
						<input type="hidden" name="amount" id="amount" value=0 class="psw"/>
					</li>
					<li>
						<input type="hidden" name="comments" id="comments" value="bz" class="psw"/>
					</li>
				</ul>
				<p class="clear"></p>
				<p><input type="checkbox" name="" id="" value="" checked="checked" class="remember"/>
					<label for="">同意</label>
					<a href="">注册条款</a>
				</p>
				<a><button type="submit">新会员注册</button></a>
			</form>
				<a class="right" href="">
				<img src="img/call.png"/>
				<h3>手机快速注册</h3>
				<p>中国大陆手机用户，</p>
				<p>
					编辑短信"<em>YIDEJIA</em>"发送到：
				</p>
				<p>
					<em>暂未开放</em>
				</p>
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
