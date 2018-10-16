<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="../model/list_header.jsp"%>
<html>
	<head>
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0,maximum-scale=1.0, user-scalable=0">
		<title>订单管理</title>
		<link href="/mobanqianduan/Orderview/AmazeUI-2.4.2/assets/css/admin.css" rel="stylesheet" type="text/css">
		<link href="/mobanqianduan/Orderview/AmazeUI-2.4.2/assets/css/amazeui.css" rel="stylesheet" type="text/css">
		<link href="/mobanqianduan/Orderview/css/personal.css" rel="stylesheet" type="text/css">
		<link href="/mobanqianduan/Orderview/css/orstyle.css" rel="stylesheet" type="text/css">
		<script src="/mobanqianduan/Orderview/AmazeUI-2.4.2/assets/js/jquery.min.js"></script>
		<script src="/mobanqianduan/Orderview/AmazeUI-2.4.2/assets/js/amazeui.js"></script>
<script type="text/javascript">
function deleteorders(id){
  $.post("deleteorders",{id:id},function(json){
	  alert("删除成功！")
	  location.href="Ordersselect";
  },"json");	
}
function buyproduct(id){
	 $.post("buyproduct",{id:id},function(json){
		  alert("支付成功！")
		  location.href="Ordersselect";
	  },"json");	
}
function payattion(id){
	 $.post("payattion",{id:id},function(json){
		 alert("已经提醒")
	  },"json");	
}

function takegoods(id){
  $.post("takegoods",{id:id},function(json){
	  alert("已经收货")
	  location.href="Ordersselect";
  },"json");	
}
function  orderscancel(id){
	show("orderscancel?id="+id,400,500);
}
function fresh() {
	location.href = "Ordersselect";
}
function ShoppingCar(){
		var userid=parseInt("${sessionScope.sdetail.id}");
		location.href="ShoppingCarindex?id="+userid;
}
function payorders(id){
	location.href="payorders?id="+id; 
}
</script>
<style>
.order-left{
border: white solid 1px;
}
.am-avg-sm-5>ul>li{
float: left;
}
</style>
	</head>
	<body>
		<!--头 -->
		<header>
			<article>
				<div class="mt-logo">
					<!--顶部导航条 -->
					<div class="am-container header">
						
						<ul class="message-r">
							<div class="topMessage home">
								<div class="menu-hd"><a href="index.jsp" target="_top" class="h">商城首页</a></div>
							</div>
							<div class="topMessage my-shangcheng">
								<div class="menu-hd MyShangcheng"><a href="GR.jsp" target="_top"><i class="am-icon-user am-icon-fw"></i>个人中心</a></div>
							</div>
							<div class="topMessage mini-cart">
								<div class="menu-hd"><a id="mc-menu-hd" onclick="ShoppingCar();" target="_top"><i class="am-icon-shopping-cart  am-icon-fw"></i><span>购物车</span><strong id="J_MiniCartNum" class="h"></strong></a></div>
							</div>
							<div class="topMessage favorite">
							<div class="menu-hd"><a href="#" target="_top"><i class="am-icon-heart am-icon-fw"></i><span>收藏夹</span></a></div>
						         </div>
						</ul>
						</div>

						<!--悬浮搜索框-->
						<div class="clear"></div>
					</div>
				</div>
			</article>
		</header>
            
			<b class="line"></b>
		<div class="center">
			<div class="col-main">
				<div class="main-wrap">

					<div class="user-order" style="margin-left: 50px">

						<!--标题 -->
						<div class="am-cf am-padding">
							<div class="am-fl am-cf"><strong class="am-text-danger am-text-lg">订单管理</strong>/<small>Order</small></div>
						</div>
						<hr/>

						<div class="am-tabs am-tabs-d2 am-margin" data-am-tabs>

							<ul class="am-avg-sm-6 am-tabs-nav am-nav am-nav-tabs">
								<li class="am-active" ><a href="#tab1">所有订单</a></li>
								<li ><a href="#tab6">未付款</a></li>
								<li ><a href="#tab3">待发货</a></li>
								<li ><a href="#tab4">待收货</a></li>
								<li ><a href="#tab5">可退货</a></li>
								<li><a href="#tab2">退货成功</a></li>
							</ul>

							<div class="am-tabs-bd">
								<div class="am-tab-panel am-fade am-in am-active" id="tab1">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
									
										<div class="order-list">	
									
												<!-- 代付款 -->
									<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==0}">
											<div class="order-status" >
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
													</c:if>
											</c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change" >
																<div   class="am-btn am-btn-danger anniu" onclick="payorders(${rr.id})">
																	一键支付</div>
															</li>
														</div>
													</div>
												</div>
											
											</div>
											</c:if>
											</c:forEach>
									
									
											 
												<!--待发货-->
											<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										   <c:if test="${rr.status==1}">
											<div class="order-status">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
														</c:if>
										          	</c:forEach>
														<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
															<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																	
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu" onclick="payattion(${rr.id});">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
										
											</div>
											</c:if>
											</c:forEach>
																
											
                                                           <!--  待收货  --> 
											<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==2}">
											<div class="order-status">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
														</c:if>
											   </c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
													<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu"  onclick="takegoods(${rr.id})">
																	确认收货</div>
															</li>
														</div>
													</div>
												</div>
										
											</div>
											</c:if>
											</c:forEach>
											<!-- 可退货 -->
											<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										   <c:if test="${rr.status==3}">
											<div class="order-status">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
													
														</c:if>
											     </c:forEach>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
													
											           <div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change">
															<div class="am-btn am-btn-danger anniu"  onclick="orderscancel(${rr.id})">
																	退货</div>
															</li>
														</div>
													</div>
												</div>
										
											</div>
											</c:if>
											</c:forEach>
												<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==5}">
											<div class="order-status" >
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
													</c:if>
											</c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change" >
																<div   class="am-btn am-btn-danger anniu" onclick="deleteorders(${rr.id})">
																	删除订单</div>
															</li>
														</div>
													</div>
												</div>
											
											</div>
											</c:if>
											</c:forEach>
											
											
										</div>
									</div>

								</div>
								<div class="am-tab-panel am-fade" id="tab6">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==0}">
											<div class="order-status" >
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
													</c:if>
											</c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change" >
																<div   class="am-btn am-btn-danger anniu" onclick="payorders(${rr.id})">
																	一键支付</div>
															</li>
														</div>
													</div>
												</div>
											
											</div>
											</c:if>
											</c:forEach>
										</div>

									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab2">

									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==5}">
											<div class="order-status" >
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
													</c:if>
											</c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
														<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change" >
																<div   class="am-btn am-btn-danger anniu" onclick="deleteorders(${rr.id})">
																	删除订单</div>
															</li>
														</div>
													</div>
												</div>
											
											</div>
											</c:if>
											</c:forEach>
										</div>

									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab3">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
										<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==1}">
											<div class="order-status">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
														</c:if>
											</c:forEach>
													
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
															<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">买家已付款</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu" onclick="payattion(${rr.id});">
																	提醒发货</div>
															</li>
														</div>
													</div>
												</div>
										
											</div>
											</c:if>
											</c:forEach>
																										</div>
									</div>
								</div>
								<div class="am-tab-panel am-fade" id="tab4">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
												<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										<c:if test="${rr.status==2}">
											<div class="order-status">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
												
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
														</c:if>
											</c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
													<div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">卖家已发货</p>
																</div>
															</li>
															<li class="td td-change">
																<div class="am-btn am-btn-danger anniu"  onclick="takegoods(${rr.id})">
																	确认收货</div>
															</li>
														</div>
													</div>
												</div>
										
											</div>
											</c:if>
											</c:forEach>
											
										</div>
									</div>
								</div>

								<div class="am-tab-panel am-fade" id="tab5">
									<div class="order-top">
										<div class="th th-item">
											<td class="td-inner">商品</td>
										</div>
										<div class="th th-price">
											<td class="td-inner">单价</td>
										</div>
										<div class="th th-number">
											<td class="td-inner">数量</td>
										</div>
										<div class="th th-operation">
											<td class="td-inner">&nbsp</td>
										</div>
										<div class="th th-amount">
											<td class="td-inner">合计</td>
										</div>
										<div class="th th-status">
											<td class="td-inner">交易状态</td>
										</div>
										<div class="th th-change">
											<td class="td-inner">交易操作</td>
										</div>
									</div>

									<div class="order-main">
										<div class="order-list">
											<!--不同状态的订单	-->
													<c:forEach items="${requestScope.orderslistsimple}" var="rr">
										   <c:if test="${rr.status==3}">
											<div class="order-status">
												<div class="order-title">
													<div class="dd-num">订单编号：<a href="javascript:;">${rr.code}</a></div>
													<span>成交时间：${rr.date}</span>
													<!--    <em>店铺：小桔灯</em>-->
												</div>
												
												
												<div class="order-content">
										    <c:forEach items="${requestScope.orderslistdetail}" var="r">
											<c:if test="${rr.id==r.orders_id}">
													<div class="order-left">
														<ul class="item-list">
															<li class="td td-item">
																<div class="item-pic">
																	<a href="#" class="J_MakePoint">
																		<img src="${r.pic}" height="125" width="100" class="itempic J_ItemImg">
																	</a>
																</div>
																<div class="item-info">
																	<div class="item-basic-info">
																		<a href="#">
																			<p>${r.product_fullname}</p>
																			<p class="info-little">颜色：12#川南玛瑙
																				<br/>包装：裸装 </p>
																		</a>
																	</div>
																</div>
															</li>
															<li class="td td-price">
																<div class="item-price">
																	${r.simpleprice}
																</div>
															</li>
															<li class="td td-number">
																<div class="item-number">
																	<span>×${r.count}</span>
																</div>
															</li>
															<li class="td td-operation">
																<div class="item-operation">
																</div>
															</li>
														</ul>
													</div>
														</c:if>
											</c:forEach>
													<div class="order-right">
														<li class="td td-amount">
															<div class="item-amount">
																${rr.nowamount}
																<p>含运费：<span>10.00</span></p>
															</div>
														</li>
													
											           <div class="move-right">
															<li class="td td-status">
																<div class="item-status">
																	<p class="Mystatus">交易成功</p>
																</div>
															</li>
															<li class="td td-change">
															<div class="am-btn am-btn-danger anniu"  onclick="orderscancel(${rr.id})">
																	退货</div>
															</li>
														</div>
													</div>
												</div>
										
											</div>
											</c:if>
											</c:forEach>
											
										</div>

									</div>

								</div>
							</div>

						</div>
					</div>
				</div>
			</div>
			
		</div>

	</body>

</html>