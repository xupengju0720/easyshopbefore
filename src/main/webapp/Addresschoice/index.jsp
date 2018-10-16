<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="/mobanqianduan/css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="/mobanqianduan/css/login.css"/>
		<link rel="stylesheet" type="text/css" href="/mobanqianduan/css/reg.css"/>
		<script type="text/javascript" src="/mobanqianduan/js/jquery.min.js"></script>
		<script type="text/javascript" src="/mobanqianduan/js/login.js"></script>
		<script type="text/javascript">
		
            $(function(){
            	$(".chk").click(function(){
            		$(".chk").prop("checked", "")
					$(this).prop("checked", "checked")
            		
          	});
            })		
            function sendid(){
            	var ids=[];
    			$(".downdown").each(function(){
    				var idp=$(this).attr("id");
    				ids.push(idp);
    			});
    			var orders_id=0;
            	$(".chk").each(function(){
            		if($(this).prop("checked")) {
    			    	 var id=$(this).attr("myid");
    			    	  orders_id=${requestScope.orders_id};
    			    	 location.href="fukuan?addressid="+id+"&ids="+ids+"&ordersid="+orders_id;
            		}
            	});
            };	
		</script>
		<style type="text/css">
		
		  ul{
            display:inline;
            white-space: nowrap;
      
            }
         ul li{
            padding: 10px 40px;
            display: inline-block;
            white-space:nowrap;
        }
        
        .down1{
              border-top: solid #006EA3 1px;
        }
		</style>
	</head>
	<body>
		<div class="nav-zhong">
			<div class="left">
				<a href="index.html" class="logo">
					<i > <img src="img/logo555.png" style="width: 100px;height: 100px" /> 
		         </i>
				</a>
				<p>添加订单</p>
			</div>
			
		</div>
		<div class="zhong" style="border: white;">
			<div>
			<table id="" role="grid" >
					<thead>
						<tr>
							<th width="25px"></th>
							<th>省市</th>
							<th>城区</th>
							<th>电话</th>
							<th>收货人</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.addlist}" var="r">
							<tr>
								<td><label><input type="checkbox" class="chk"  
										myid="${r.id}"></label></td>
								<td>${r.zone}</td>
								<td>${r.addr}</td>
								<td>${r.tel}</td>
								<td>${r.name}</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				</div>
				
				<div>
				<button onclick="sendid();">确定</button>
				
				</div>
				<c:if test="${requestScope.choicelist!=null}">
				<font color="#98490C" size="4" style="margin-left:350px ">所选商品与数量</font>
				    <c:forEach items="${requestScope.choicelist}" var="r">
				  <div class="down1">
							<ul class="downdown"  id="${r.id}" >
								<li >
								    <c:if test="${r.pic!=null}">
									<img src="${r.pic}" height="125" width="100"">
									</c:if>
								</li>
								<li >商品全名：${r.product_fullname}</li>
								<li >商品数量：${r.count}</li>
							</ul>
				</div>
			</c:forEach>
				</c:if>
		</div>
	</body>
</html>
