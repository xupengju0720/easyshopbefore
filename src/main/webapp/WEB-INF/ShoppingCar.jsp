<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" type="text/css" href="css/header.css" />
<link rel="stylesheet" type="text/css" href="css/shopping.css" />
<link rel="stylesheet" type="text/css" href="css/footer.css" />
<script type="text/javascript" src="js/jquery-3.1.1.min.js"></script>
<script type="text/javascript">
		function MYsubmit(){
			var ids=[];
			$(".down1").each(function(){
				if($(this).find(".chk").prop("checked")){
				var id=$(this).attr("myid");
				ids.push(id);
				};
			});
          location.href="selectCar?ids="+ids;			
		}
	    function changercountkkkkk(id,count) {

			 $.ajax({
			        type: "POST",
			        url: "jiesuan",
			        contentType: "application/json; charset=utf-8",
			        data: JSON.stringify(data),
			        dataType: "json",
			        success: function (json) {
			        	if(json.status>0){
							alert(1);
						}
			        }
			    });    
		}
		
		function changercount(id,count) {
			
		}
		
		function del(id){
			$.post("ShoppingCardel",{id:id},function(json){
				if(json.status>0){
					 alljs();
					alert("删除成功!")
				}
			},"json")
			
		}
		
		$(function(){
			$(".del").on("click",function(){
				$(event.target).parents(".down1").remove();
			});
			   $(".chkc").on("click", function(){
				   if (event.target.checked)
						$(".chk").prop("checked", "checked")
					else
						$(".chk").prop("checked", "")
						 alljs();
			   });
			 $(".chk").on("click",function(){
				 alljs();
			 });
			$(".n1").on("click",function(){
			  var count=parseInt($(event.target).next().text());
			    if(count>1)$(event.target).next().text(""+(--count));
				var parent=$(event.target).parents(".down1");
				var id=parent.attr("myid");
				var price=parent.find(".l5").text();
				price=parseFloat(price.substring(1));
				parent.find(".l7").text("￥"+(count*price).toFixed(2));				
				changercount(id,count);
				alljs();
			});
			$(".n3").on("click",function(){
				var count=	parseInt( $(event.target).prev().text());
				var parent=$(event.target).parents(".down1");
				$(event.target).prev().text(""+(++count));
				var id=parent.attr("myid");
			    var price=parent.find(".l5").text();
					price=parseFloat(price.substring(1));
					parent.find(".l7").text("￥"+(count*price).toFixed(2));				
					changercount(id,count);
					alljs();
				});
		});
		function alljs() {
			var all=0;
			$(".chk").each(function(){
				if($(this).prop("checked")){
				var parent=$(this).parents(".down1");
				var amount=parent.find(".l7").text(); 
				amount =parseFloat(amount.substring(1));
				all+=amount;
				};
			});
			$(".s7").text("￥"+all);
		} 
		</script>

</head>
<body>
	<div class="box">
		<!--头部-->
		<div class="header">
			<div class="header1">
				<div class="header1-cont">
					<div class="left">
						欢迎您来到鲜生购,&nbsp;<span><a href="">徐晓良良良</a></span>
					</div>
					<div class="right">
						<ul>
							<li>我的订单<em></em></li>
							<li><a href="shopping.html">购物车<em></em></a></li>
							<li>收藏夹<em></em></li>
							<li><a href="The member center.html">会员中心<em></em></li>
							</a>
							<li>客户服务<em></em></li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header2">
				<div class="header2-cont">

					<div class="sousuo">
						<div class="sousuo-up">
							<input type="text" name="" id="" value="" placeholder="泰国榴莲" />
							<em></em>
							<p>搜索</p>
						</div>
						<div class="sousuo-down">
							<ul>
								<li><a class="red" href="">热门：</a></li>
								<li><a class="red" href="">牛油果</a></li>
								<li><a href="">草莓</a></li>
								<li><a a class="red" href="">草莓</a></li>
								<li><a href="">三文鱼</a></li>
								<li><a a class="red" href="">有机菠菜</a></li>
								<li><a href="">蓝莓</a></li>
								<li><a class="red" href="">百香果</a></li>
								<li><a href="">牛肉</a></li>
							</ul>
							<div class="clear"></div>
						</div>
					</div>
					<div class="gouwuche">
						<em></em><span>购物车</span>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header3">
				<div class="header3-cont">
					<ul>
						<li class="l1">全部分类</li>
						<li class="l2"><a href="index.jsp">首页</a></li>
						<li class="l2">主厨先生</li>
						<li class="l2">每日推荐</li>
						<li class="l2">会员专享</li>
						<li class="l2">品质保障</li>
					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!--导航横线-->
		<div class="line"></div>
		<div class="cont-shopping">
			<div class="all">  
				<input type="checkbox" name="" id="" value="" class="chkc" /><span
					class="s1">全选</span>&nbsp;&nbsp;&nbsp;&nbsp;<span class="s3">规格</span>
				<span class="s4">单价(元)</span><span class="s5">数量</span><span
					class="s6">小计</span><span class="ss7">操作</span>
			</div>

			<div class="thing">
					<c:forEach items="${requestScope.carlist}" var="rr">
				    <c:forEach items="${requestScope.productlist}" var="r">
						<c:if test="${rr.product_id==r.id}">
							<ul class="down1" myid="${rr.id}">
								<li class="l1"><input type="checkbox" class="chk" name=""
									id="" value="" /></li>
								<li class="l2"><c:if test="${r.pic!=null}">
										<img src="${r.pic}" height="125" width="100"">
									</c:if></li>
								<li class="l4">260g*盒</li>
								<li class="l5">￥${r.nowprice}</li>
								<li class="l6"><span class="n1">-</span> <span class="n2">
										${rr.count} </span> <span class="n3">+</span></li>
								<li class="l7">￥${r.nowprice*rr.count}</li>
								<li class="l8">
									<p>移入收藏夹</p>
									<p class="del" onclick="del(${rr.id})">删除</p>
									<p>查找相似</p>
								</li>
							</ul>
						</c:if>
					</c:forEach>
				</c:forEach>

			</div>

			<div class="all2">
				<input type="checkbox" name="" id="" value="" /><span class="s1">全选</span><span
					class="s2">删除选中商品</span><span class="s3">已选中商品</span> <span
					class="s4">3</span><span class="s5">件</span><span class="s6">总价(元)：</span><span
					class="s7">￥0</span><span class="s8" onclick="MYsubmit();">结算</span>
			</div>
		</div>

		<!--footer-->
		<footer>
			<div class="up">
				<ul class="cont">
					<li class="l1"><a href=""><span class="s1"></span><i
							class="i1">顺丰包邮</i></a></li>
					<li class="l1"><a href=""><span class="s2"></span><i
							class="i1">同城次日到达</i></a></li>
					<li class="l1"><a href=""><span class="s3"></span><i
							class="i1">7天无理由退换货</i></a></li>
					<li class="l1"><a href=""><span class="s4"></span><i
							class="i1">线下体验店</i></a></li>
					<li class="l2">
						<p class="p1">24小时全国服务热线</p>
						<p class="p2">400-888-8888</p>
						<p class="p3">
							<a href=""><span class="s5"></span><i class="i2">联系客服</i></a>
						</p>
					</li>

				</ul>
				<div class="clear"></div>
			</div>
			<div class="two"></div>
			<div class="three">
				<span>网络文化经营许可证：19333520156</span> <span>鲁公网安备：25854651152</span> <span>违法和不良信息举报电话：110</span>
				<span>消费者维权电话：12305</span>
				<p>Copyright&nbsp;©&nbsp;2010-2020&nbsp;xianshenggou.com&nbsp;版权所有</p>
			</div>

		</footer>
	</div>
</body>
</html>
