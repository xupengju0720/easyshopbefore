<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="model/list_header.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title>小蜗个人中心</title>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type="text/javascript" src="js/GR.js"></script>
		<script type="text/javascript" src="js/Top.js"></script>
		<link rel="stylesheet" type="text/css" href="css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="css/GR.css"/>
		<script type="text/javascript">
		function member_add(){
			show("loginedit.jsp",300,250);
		}
		function fresh() {
			location.href = "GR.jsp";
		}
		function ShoppingCar(id){
			location.href="ShoppingCarindex?id="+id;
		}
		
		</script>
	</head>
	<body>
		<!--顶-->
		<div class="nav-top">
			<ul>
				<li>
					<i><a href="index.jsp">返回首页</a></i>
					<b>
						<a>已登录</a>
						<em>|</em>
						<a>已注册</a>
					</b>
				</li>
				<li>
					<em>您好！${sessionScope.sdetail.email}&nbsp;&nbsp;<a href="clearsession" style="color: #ee2a7b;">退出</a></em>
					<em>
						<i></i>
						<a href="Ordersselect">我的订单</a>
					</em>
					<em>
						<i></i>
						<a onclick="ShoppingCar(${sessionScope.sdetail.id})">购物车</a>
					</em>
					<em>
						<i></i>
						<a href="">下载App</a>
					</em>
				</li>
			</ul>
		</div>
	
		<div class="ucenter" style="margin-top: 200px">
			<div class="left" style="width: 160px;">
				<h2>
					<span>操作</span>
				</h2>
				<div class="ctn">
					<div class="forum">
						<div class="head">
							<span>订单中心</span>
						</div>
						<div class="ctn">
							<ul>
								<li>
									<a href="Ordersselect">我的订单</a>
								</li>
								<li>
									<a href="">我的收藏</a>
								</li>
							</ul>
						</div>
					</div>
					<div class="forum">
						<div class="head">
							<span>我的账号</span>
						</div>
						<div class="ctn">
							<ul>
								<li>
								<a href="Ordersover.jsp">新增地址</a>
								</li>
								<li>
									<a href="javascript:void(0)" onclick="member_add()">修改密码</a>
								</li>
								<li>
								<a href="addressselect">地址管理</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
			<div class="right" style="width: 826px;">
				<div class="info">
					<div class="photo">
						<a href="" class="pic">
							<img src="img/cc7bc520fec.jpg" alt="" />
						</a>
						<span class="name">${sessionScope.sdetail.tel}</span>
						<span class="level">银卡会员</span>
					</div>
					<div class="my-info left">
						<div class="infohader">
							<span class="name">${sessionScope.sdetail.tel}，</span>
							<span class="tips">欢迎您！上一次登录时间:${sessionScope.date}</span>
						</div>
						<ul class="infobody">
							<li>
								<div class="left">
									<span>订单提醒：</span>
									<b>待处理订单(0)</b>
									<b>待评价订单(0)</b>
									<b>待晒单订单(0)</b>
								</div>
								<em style="margin-top: 6px;"></em>
								<div class="foot">
									<span>我的账号</span>
								</div>
							</li>
							<li>
								<div class="left">
									<span>我的关注：</span>
									<b>降价商品(0)</b>
									<b>促销商品(0)</b>
									<b>新到货商品(0)</b>
								</div>
								<em style="height: 38px;"></em>
								<div class="foot">
									<em>消费总额：&nbsp;￥ 2679.00</em>
								</div>
							</li>
							<li>
								<div class="left">
									<span>消息：</span>
									<b>提醒/通知(0)</b>
									<b>促销商品(0)</b>
								</div>
								<em></em>
								<div class="foot">
									<em>我的积分：&nbsp;26.79 分</em>
								</div>
							</li>
						</ul>
					</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="clear"></div>
		<!--尾-->
		<div class="footer-1">
			<nav class="footer-nav">
				<b>
					<span>新手指南</span>
					<a href="">购物指南</a>
					<a href="">会员介绍</a>
					<a href="">注册流程</a>
					<a href="">隐私声明</a>
				</b>
				<b>
					<span>付款方式</span>
					<a href="">关于支付宝</a>
					<a href="">财富通</a>
					<a href="">网银支付</a>
					<a href="">信用卡支付</a>
				</b>
				<b>
					<span>配送服务</span>
					<a href="">配送中心</a>
					<a href="">商品打包流程</a>
					<a href="">商品发货流程</a>
					<a href="">快递查询</a>
				</b>
				<b>
					<span>售后服务</span>
					<a href="">退换货政策</a>
					<a href="">退换货流程</a>
					<a href="">退款说明</a>
					<a href="">常见问题</a>
				</b>
				<b>
					<span>关于小蜗</span>
					<a href="">关于我们</a>
					<a href="">联系我们</a>
					<a href="">商家入驻</a>
					<a href="">招贤纳士</a>
				</b>
				<b>
					<img src="img/FOOTER-1.png"/>
					<a href="">小蜗手机客户端</a>
				</b>
				<b style="width: 92px; height: 92px; border: 1px solid #DDDDDD;margin-top: 20px;">
					<img src="img/FOOTER-2.jpg" style="margin: 0 auto 5px;width: 100%;"/>
					<a href="" style="margin-left: 25px;">四点一刻</a>
				</b>
				<b style="width: 92px; height: 92px; border: 1px solid #DDDDDD;margin-top: 20px;margin-left: 30px;">
					<img src="img/FOOTER-3.jpg" style="margin: 0 auto 5px;width: 100%;"/>
					<a href="" style="margin-left: 25px;">小蜗微信</a>
				</b>
				<em>
					<i>
						<b></b>
						<span>
							<h6>客服热线</h6>
							<h5>020-38899377</h5>
						</span>
					</i>
					<b>CEO邮箱：ceo@xiaowo.com</b>
					<b>客服邮箱：service@xiaowo.com</b>
				</em>
			</nav>
		</div>
		<div class="footer-2">
			<nav class="nav-1">
				<a href="">About&nbsp;us</a>
				<a href="">友情链接</a>
				<a href="">免责条款</a>
				<a href="">法律声明</a>
				<a href="">分类大全</a>
				<a href="">爱尝鲜</a>
				<a href="">美丽课堂</a>
				<a href="">女人妆</a>
			</nav>
			<nav class="nav-2">
				<span>
					<i>Powered by www.yidejia.com © 2008-2016</i>
					<a href="">粤ICP备13070863号</a>
				</span>
				<span style="margin-left: 20px;">
					<i>增值电信业务经营许可证</i>
					<a href="">粤B2-20140314</a>
				</span>
				<a href="" title="站长统计">
					<img src="img/FOOTER.gif"/>
				</a>
			</nav>
			<a class="nav-3" href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44011302000649">
				<img src="img/FOOTER-5.png"/>
				<p>粤公网安备 44011302000649号</p>
			</a>
			<nav class="nav-4">
				<a href="">
					<img src="img/FOOTER-6.png"/>
				</a>
				<a href="">
					<img src="img/FOOTER-7.jpg"/>
				</a>
			</nav>
			<nav class="nav-5">
				<div>
					<em class="em-1"></em>
					<i><span>正品</span>保障</i>
					<i>正品授权 假一赔十</i>
				</div>
				<div>
					<em class="em-2"></em>
					<i><span>无理由</span>退换</i>
					<i>无条件 退换货</i>
				</div>
				<div>
					<em class="em-3"></em>
					<i><span>免</span>运费</i>
					<i>全场满 299元</i>
				</div>
				<div>
					<em class="em-4"></em>
					<i><span>快捷</span>支付</i>
					<i>快捷支付 有卡便付</i>
				</div>
				<div>
					<em class="em-5"></em>
					<i><span>实物</span>拍摄</i>
					<i>实物拍 购买放心</i>
				</div>
				<div>
					<em class="em-6"></em>
					<i><span>闪电</span>发货</i>
					<i>闪电发货 快速到家</i>
				</div>
			</nav>
		</div>
		<div class="clear"></div>
		<div class="footer-3"></div>
		
	</body>
</html>
