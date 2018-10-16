<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<script type=text/javascript src="js/jquery.jqzoom.js"></script>
		<script type=text/javascript src="js/jquery.livequery.js"></script>
		<script type="text/javascript" src="js/XQ.js"></script>
		<script type="text/javascript" src="js/Top.js"></script>
		<liNK rel=stylesheet type=text/css href="css/lanrenzhijia.css">
		<link rel="stylesheet" type="text/css" href="css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="css/XQ.css"/>
		<script type="text/javascript">
		function shoppingcaradd(id){
			if(${sessionScope.sdetail==null}){
				 alert("请先登录");
			}else{
				var count = parseInt($(".buy-num").find(".inptx").val());
		    	$.post("shoppingcaradd",{product_id:id,count:count},function(json){
				if(json.status>0){
					alert("加入成功");
				}
			},"json");
		}
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
		</script>
	</head>
	<body>
		
		<!--顶-->
		<div class="nav-top">
			<ul>
				<li>
					<i>Hi~欢迎来到京东！</i>
					<b>
						<a href="login.jsp">登录</a>
						<em>|</em>
						<a href="register.jsp">免费注册</a>
					</b>
				</li>
				<li>
					<em>
						<i></i>
						<a onclick="ShoppingCar2();">我的订单</a>
					</em>
					<em>
						<i></i>
						<a onclick="ShoppingCar3();">个人中心</a>
					</em>
				 <!--  	<em>
						<i></i>
						<a href="">关注收藏</a>
					</em>
					<em>
						<i></i>
						<a href="">下载App</a>
					</em> -->
				</li>
			</ul>
		</div>
		<!--中-->
		<div class="nav-zhong">
			<a href="index.html" class="logo">
				<i>
				<img src="img/logo555.png" style="width: 100px;height: 100px">
				</i>
				<b>京东</b>
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
				<a href="index.jsp">首页</a>
			</nav>
		</div>
		<!--面包屑导航-->
		<div class="info-nav">
			<a href="index.jsp">
				<b>京东</b>
			</a>
			>
			<a href="#">
				<b>商品详情</b>
			</a>
			>
			<span>${requestScope.plist.fullname}</span>
		</div>
		<!--info-stage-->
		<div class="info-stage">
			<div id="preview">
			
			 
				<div class='jqzoom'>
					<img id='bigImg' src="${requestScope.plist.pic}" width=340 height=340 jqimg="${requestScope.plist.pic}">
				</div>
				<div id='spec' style='width: 800px;'>
					<div id='specList'  style='width: 800px;' >
						<ul class='listImg' style='width: 800px;'>
				  <c:forEach items="${requestScope.plist.piclist}" var="r">
						  <li><img id='smallPicOne' src="${r}" src_H="${r}" src_D="${r}">  </li>
				</c:forEach>
						</ul>
					</div>
					<div id='specRight' class="control specRightT"></div>
				</div>
			</div>
			<div class="right">
				<h2 class="title">${requestScope.plist.fullname}</h2>
				<div class="item-desc">
					<div>类型：${requestScope.plist.t_name}</div>
				</div>
				<div class="c">
					<div class="price">
						价格：
						<span class="spink">
							￥ 
							<span class="j-spink">${requestScope.plist.nowprice}</span>
						</span>
						<del>${requestScope.plist.price}元</del>
					</div>
					<div>
						已售出：
						<span>
							<a href="#">
								<font class="pink">${requestScope.plist.salecount}</font>
							</a>
							&nbsp;件
						</span>
					</div>
					<div>
						促销：
						<span>
							<a href="#">
								<font class="pink">${requestScope.plist.sale}</font>
							</a>
						</span>
					</div>
					<div>
						活动：
						<span>
							<a href="#">
								<font class="pink">${requestScope.plist.activity}</font>
							</a>
						</span>
					</div>
					<div>
						提示：
						<span>
							<a href="#">
								<font class="pink">${requestScope.plist.tip}</font>
							</a>
						</span>
					</div>
				</div>
				<div class="buy">
					<div class="buy-num">
						购买数量：
						<button class="btn btn-1" type="button"></button>
						<input type="text" class="inptx" value="1" maxlength="3"/>
						<button class="btn btn-2"></button>
						(库存
						<span style="color: rgb(238, 42, 123);">充足</span>
						)
					</div>
					<div class="buy-btn">
						<a class="add" title="加入购物车" onclick="shoppingcaradd(${requestScope.plist.id});">
							<i></i>
							<b>加入购物车</b>
						</a>
					</div>
				</div>
				<div class="share">
					<span class="txt">分享：</span>
					<a href="" class="kongjian s1" title="分享到QQ空间">
						<span></span>
					</a>
					<a href="" class="tengxun s1" title="分享到微博">
						<span></span>
					</a>
					<a href="" class="tengxunweibo s1" title="分享到腾讯微博">
						<span></span>
					</a>
					<a href="" class="renren s1" title="分享到人人网">
						<span></span>
					</a>
					<a href="" class="kaixin s1" title="分享到开心网">
						<span></span>
					</a>
				</div>
			</div>
		</div>
		<!--info-main-->
		<div class="info_main">
			<div class="right" style="float: left;margin-left: 10px;">
				<div class="fourm_3 info_recommend">
				<div class="fourm_3">
					<div class="header">
						<a href="">商品详情</a>
					</div>
					<div class="ctn">
					${requestScope.plist.info}
					</div>

				</div>
				<div class="clear"></div>
				<div class="tong-xi-lie">
					
					
				</div>
			</div>
		</div>
		<div class="clear"></div>
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
	</body>
</html>
