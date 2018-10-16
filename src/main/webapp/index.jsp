<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title>京东商城首页</title>
<script type="text/javascript" src="js/jquery.min.js"></script>
<script type="text/javascript" src="js/XW-1-SY.js"></script>
<script type="text/javascript" src="js/Top.js"></script>
<link rel="stylesheet" type="text/css" href="css/XW-1-HandF.css" />
<link rel="stylesheet" type="text/css" href="css/XW-1-SY.css" />
<script>
		$(document).ready(function() {
			if(${requestScope.plist==null}){
				location.href="index";
			}
		});
		
		function detail(id){
			location.href="index1?id="+id;
		}
		
		function ShoppingCar(){
			if(${sessionScope.sdetail==null}){
				 if(confirm('请先登录')){
					  location.href = "login.jsp";
				  }
			}else{
				var userid=parseInt("${sessionScope.sdetail.id}");
				location.href="ShoppingCarindex?id="+userid;
		}
		}
		function ShoppingCar2(){
			if(${sessionScope.sdetail==null}){
				  if(confirm('请先登录')){
					  location.href = "login.jsp";
				  }
			}else{
				location.href="Ordersselect";
		}
		}
		function ShoppingCar3(){
			if(${sessionScope.sdetail==null}){
				  if(confirm('请先登录')){
					  location.href = "login.jsp";
				  }
			}else{
				location.href="GR.jsp";
		}
		}
		function selecttype(id){
		 location.href="producttype?id="+id; 
		}
		function selecttype1(id){
			 location.href="producttype1?id="+id; 
			}
	</script>
</head>
<body>

	<!--顶-->
	<div class="nav-top">
		<ul>
			<li><i>欢迎来到京东商城</i> <b> <a href="login.jsp">登录</a> <em>|</em>
					<a href="register.jsp">免费注册</a>
			</b></li>
			<li><em> <i></i> <a onclick="ShoppingCar2()">我的订单</a>
			</em> <em> <i></i> <a onclick="ShoppingCar3()">个人中心</a>
			</em> 
			
		 <!--  	<em> <i></i> <a href="">关注收藏</a></em> 
			<em> <i></i> <a href="">下载App</a></em> --> 
			
			</li>
		</ul>
	</div>
	<!--中-->
	<div class="nav-zhong">
		<a href="index.jsp" class="logo"> <i > <img src="img/logo555.png" style="width: 100px;height: 100px"
				alt="" /> 
		</i> <b>京东</b>
		</a>
		
			<form action="Product" method="post">
		<div class="search">
			<div class="shang">
				<div class="zuo">
					<span>搜商品</span> <em></em>
				</div>
				<!--  <b> <a href="">美妆</a> <a href="">护肤</a>
				</b> <em></em> -->
				
				<input type="text" name="txt" id="txt"
					placeholder="请输入要查找的商品名称" /> 
					
					<input type="submit" 
					value="搜索" />
			</div>
		</div>
		</form>
		<div class="gouwuche" >
			<div>
				<i></i> <b onclick="ShoppingCar()">我的购物车</b> 
			</div>
		</div>
		
	</div>
	<!--Nav-->
	<div class="nav">
		<nav>
			<b>全部分类</b>
		</nav>
	</div>

	<!--Banner-->
	<ul class="Ban-and-guanggao">
		<li class="Ban left" >
			<div class="shang" >
				   <ul class="zuo left" style="background-color: pink">
				 	<c:forEach items="${requestScope.list}" var="r">
						<c:if test="${r.parentid==0}">
							<li style="color: red; margin-left: 80px" ><h3>${r.name}</h3></li>
							<li>
							<i>
							 <c:forEach items="${requestScope.list}" var="rr">
										<c:if test="${rr.parentid==1}">
											<li><a  style="color:blue;"   onclick="selecttype1(${rr.id});">${rr.name}</a></li>
											<br>
												<c:forEach items="${requestScope.list}" var="rrr">
														<c:if test="${rrr.parentid==rr.id}">
												      <i>
												<a onclick="selecttype(${rrr.id});">${rrr.name}</a>&nbsp&nbsp&nbsp
											         </i>
											         </c:if>
										       </c:forEach>  
										       <br>
										       <br>
										</c:if>
									</c:forEach>
								</i>
							</li>
						</c:if>
					</c:forEach> 
				</ul>
				<div class="you right">
					<div class="shang-b">
						<img src="images/shouji.jpg" style="width: 670px;height:370px;" onclick="selecttype1(${3});"/> 
						<img src="images/jiaju.jpg" style="width: 670px;height:370px;" onclick="selecttype1(${2});"/>
						<img src="images/fuzhuang.jpg" style="width: 670px;height:370px;" onclick="selecttype1(${4});" /> 
						 <b> 
						 <em>1</em> 
						 <em>2</em> 
						 <em>3</em>
						</b>
					</div>
				</div>
			</div>
			<div class="clear"></div>
			<div class="xia">
				<h2>
					<span>HOP</span>热门活动
				</h2>
				<div class="remen">
					<a href=""> <img src="img/SY-remen-1.png" alt="" />
					</a> <a href="#"> <img src="img/SY-remen-2.png"
						alt="" />
					</a> <a href="#"> <img src="img/SY-remen-3.png" alt="" />
					</a> <a href="#"> <img src="img/SY-reemen-4.png" alt="" />
					</a>
				</div>
			</div>
		</li>
		<li class="guanggao right">
			<div class="tiyan">
				<b> <span>做用户服务体验最好的商城</span>
				</b> <i> <em> <b></b> <span>
							<h3>建议留言</h3>
							<h4>如果您有好的建议，欢迎给我们留言</h4>
					</span>
				</em> <em> <b></b> <span>
							<h3>建议留言</h3>
							<h4>如果您有好的建议，欢迎给我们留言</h4>
					</span>
				</em>
				</i>
			</div>
			<div class="clear"></div>
			<div class="gonggao1">
				<div class="top">
					<i class="i1"> <em>商城公告</em> <em>社区动态</em>
					</i> <i class="i2"> <em>商城公告</em> <em>社区动态</em>
					</i> <span> <i> <em></em>
							<h3>春节假期发通知</h3>
					</i> <i> <em></em>
							<h3>新品上市：清透水润，遮瑕隔离</h3>
					</i> <i> <em></em>
							<h3>璀璨新季：出游"拍拍拍"的正确姿势</h3>
					</i>
					</span> <span> <i> <em></em>
							<h3>【社区】做任务赚爱豆</h3>
					</i> <i> <em></em>
							<h3>【免费使用】多效修颜防晒霜名单公布</h3>
					</i> <i> <em></em>
							<h3>妍诗美7周年&nbsp;“我们的蜕变墙”&nbsp;得奖名单！</h3>
					</i>
					</span>
				</div>
			</div>
			<div class="tuijian">
				<img src="img/SY-youshang-retui-1.jpg" class="img1" /> <img
					src="img/SY-youshang-retui-2.jpg" class="img2" /> <em class="em1"></em>
				<em class="em2"></em> <img src="img/SY-youshang-retui-3.jpg"
					class="img3" />
			</div>
		</li>
	</ul>
	<ul class="clear"></ul>
	<!--服饰-->
	<div class="FuShi">
		<div class="top">
			<b class="zuo left"> <span>京东</span>服饰
			</b>
		</div>
		
		<div class="tu">
			<c:forEach items="${requestScope.plist}" var="r">
			 <c:if test="${r.t_parentid==4}">
				<em> <c:if test="${r.pic!=null}">
						<img src="${r.pic}" height="450" width="400"  onclick="detail(${r.id})">
					</c:if>
				</em>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="clear"></div>
	<div class="FuShi">
		<div class="top">
			<b class="zuo left"> <span>京东</span>手机
			</b>
		</div>
		<div class="tu">
			<c:forEach items="${requestScope.plist}" var="r">
			 <c:if test="${r.t_parentid==3}">
				<em> <c:if test="${r.pic!=null}">
						<img src="${r.pic}" height="450" width="400"  onclick="detail(${r.id})">
					</c:if>
				</em>
				</c:if>
			</c:forEach>
		</div>
	</div>
	<div class="clear"></div>
	<div class="FuShi">
		<div class="top">
			<b class="zuo left"> <span>京东</span>家具
			</b>
		</div>
		<div class="tu">
	  
			<c:forEach items="${requestScope.plist}" var="r">
			  <c:if test="${r.t_parentid==2}">
				<em> 
				<c:if test="${r.pic!=null}">
						<img src="${r.pic}" height="450" width="400"  onclick="detail(${r.id})">
				</c:if>
				</em>
				</c:if>
			</c:forEach>
		</div>
	</div>
	
	<div class="clear"></div>
	
	<div class="clear"></div>
	<!--尾-->
	<div class="footer-1">
		<nav class="footer-nav">
			<b> <span>新手指南</span> <a href="">购物指南</a> <a href="">会员介绍</a> <a
				href="">注册流程</a> <a href="">隐私声明</a>
			</b> <b> <span>付款方式</span> <a href="">关于支付宝</a> <a href="">财富通</a> <a
				href="">网银支付</a> <a href="">信用卡支付</a>
			</b> <b> <span>配送服务</span> <a href="">配送中心</a> <a href="">商品打包流程</a>
				<a href="">商品发货流程</a> <a href="">快递查询</a>
			</b> <b> <span>售后服务</span> <a href="">退换货政策</a> <a href="">退换货流程</a>
				<a href="">退款说明</a> <a href="">常见问题</a>
			</b> <b> <span>关于小蜗</span> <a href="">关于我们</a> <a href="">联系我们</a> <a
				href="">商家入驻</a> <a href="">招贤纳士</a>
			</b> <b> <img src="img/FOOTER-1.png" /> <a href="">小蜗手机客户端</a>
			</b> <b
				style="width: 92px; height: 92px; border: 1px solid #DDDDDD; margin-top: 20px;">
				<img src="img/FOOTER-2.jpg" style="margin: 0 auto 5px; width: 100%;" />
				<a href="" style="margin-left: 25px;">四点一刻</a>
			</b> <b
				style="width: 92px; height: 92px; border: 1px solid #DDDDDD; margin-top: 20px; margin-left: 30px;">
				<img src="img/FOOTER-3.jpg" style="margin: 0 auto 5px; width: 100%;" />
				<a href="" style="margin-left: 25px;">小蜗微信</a>
			</b> <em> <i> <b></b> <span>
						<h6>客服热线</h6>
						<h5>020-38899377</h5>
				</span>
			</i> <b>CEO邮箱：ceo@xiaowo.com</b> <b>客服邮箱：service@xiaowo.com</b>
			</em>
		</nav>
	</div>
	<div class="footer-2">
		<nav class="nav-1">
			<a href="">About&nbsp;us</a> <a href="">友情链接</a> <a href="">免责条款</a>
			<a href="">法律声明</a> <a href="">分类大全</a> <a href="">爱尝鲜</a> <a href="">美丽课堂</a>
			<a href="">女人妆</a>
		</nav>
		<nav class="nav-2">
			<span> <i>Powered by www.yidejia.com © 2008-2016</i> <a
				href="">粤ICP备13070863号</a>
			</span> <span style="margin-left: 20px;"> <i>增值电信业务经营许可证</i> <a
				href="">粤B2-20140314</a>
			</span> <a href="" title="站长统计"> <img src="img/FOOTER.gif" />
			</a>
		</nav>
		<a class="nav-3"
			href="http://www.beian.gov.cn/portal/registerSystemInfo?recordcode=44011302000649">
			<img src="img/FOOTER-5.png" />
			<p>粤公网安备 44011302000649号</p>
		</a>
		<nav class="nav-4">
			<a href=""> <img src="img/FOOTER-6.png" />
			</a> <a href=""> <img src="img/FOOTER-7.jpg" />
			</a>
		</nav>
		<nav class="nav-5">
			<div>
				<em class="em-1"></em> <i><span>正品</span>保障</i> <i>正品授权 假一赔十</i>
			</div>
			<div>
				<em class="em-2"></em> <i><span>无理由</span>退换</i> <i>无条件 退换货</i>
			</div>
			<div>
				<em class="em-3"></em> <i><span>免</span>运费</i> <i>全场满 299元</i>
			</div>
			<div>
				<em class="em-4"></em> <i><span>快捷</span>支付</i> <i>快捷支付 有卡便付</i>
			</div>
			<div>
				<em class="em-5"></em> <i><span>实物</span>拍摄</i> <i>实物拍 购买放心</i>
			</div>
			<div>
				<em class="em-6"></em> <i><span>闪电</span>发货</i> <i>闪电发货 快速到家</i>
			</div>
		</nav>
	</div>
	
</body>
</html>
