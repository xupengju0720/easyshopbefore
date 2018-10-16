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
				if($(this).find(".chk").prop("checked"))
				{
				var id=$(this).attr("myid");
				ids.push(id);
				};
			});
			location.href="selectCar?ids="+ids; 
		}
		
		function changercount111(id,count) {
			$.ajax({
		        type: "POST",
		        url: "jiesuan",
		        contentType: "application/json; charset=utf-8",
		        data: JSON.stringify(data),
		        dataType: "json",
		        success: function (json) {
		        	if(json.status>0){
						alert(1111);
						location.href="Ordersover/index.jsp";
					}
		        }
		    });   
		}
		
		function changercount(id,count) {
			$.post("changecount",{id:id,count:count},function(json){
				if(json.status>0){
					 alljs();
					alert("增加成功!")
				}
			},"json")
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
				
					<div class="right">
						<ul>
							<li><a href="Ordersselect">我的订单<em></em></a></li>
							<li><a href="GR.jsp">个人中心<em></em>
							    </a>
							</li>
						</ul>
						<div class="clear"></div>
					</div>
				</div>
				<div class="clear"></div>
			</div>
			<div class="header2">
				
				<div class="clear"></div>
			</div>
			<div class="header3">
				<div class="header3-cont">
					<ul>
						<li class="l1">全部商品</li>
						<li class="l2"><a href="index.jsp">首页</a></li>
						
					</ul>
					<div class="clear"></div>
				</div>
			</div>
		</div>
		<!--导航横线-->
		<div class="line"></div>
		<div class="cont-shopping">
			<div class="all">  
				<input type="checkbox" name="" id="" value="" class="chkc" />
				<span>全选</span>&nbsp;&nbsp;&nbsp;<span class="s3">类型</span>
				<span class="s4">单价(元)</span><span class="s5">数量</span><span
					class="s6">小计</span><span class="ss7">操作</span>
			</div>

			<div class="thing">
					<c:forEach items="${requestScope.carlist}" var="rr">
				    <c:forEach items="${requestScope.productlist}" var="r">
						<c:if test="${rr.product_id==r.id}">
							<ul class="down1" myid="${rr.id}" id="${rr.product_id}">
								<li class="l1"><input type="checkbox" class="chk" name=""
									id="" value="" /></li>
								<li class="l2">
								    <c:if test="${r.pic!=null}">
									<img src="${r.pic}" height="125" width="100"">
									</c:if>
									</li>
								<li class="l4">${r.t_name}</li>
								<li class="l5">￥${r.nowprice}</li>
								<li class="l6"><span class="n1">-</span> 
								               <span class="n2">
										${rr.count} </span>
										 <span class="n3">+</span></li>
								<li class="l7">￥${r.nowprice*rr.count}</li>
								<li class="l8">
									<p class="del" onclick="del(${rr.id})">删除</p>
								</li>
							</ul>
						</c:if>
					</c:forEach>
				</c:forEach>

			</div>

			<div class="all2">
					<span class="s6" style="margin-left: 700px">总价(元)：</span>
					<span class="s7" style="position:absolute;">￥0</span><span class="s8" onclick="MYsubmit();" style="margin-left: 150px;">结算</span>
			</div>
		</div>

	</div>
</body>
</html>
