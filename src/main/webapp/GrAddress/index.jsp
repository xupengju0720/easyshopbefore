<%@ page language="java" contentType="text/html; charset=utf-8"
	isELIgnored="false" pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
 <%@ include file="../model/list_header.jsp"%>
<html>
	<head>
		<meta charset="UTF-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="../css/XW-1-HandF.css"/>
		<link rel="stylesheet" type="text/css" href="../css/login.css"/>
		<link rel="stylesheet" type="text/css" href="../css/reg.css"/>
		<script type="text/javascript" src="../js/jquery.min.js"></script>
		<script type="text/javascript" src="../js/login.js"></script>
	<style type="text/css">
	th,td{
	border: black solid 1px;
	}
	table{
	margin-left: 200px;
	}
	
	</style>
	<script type="text/javascript">
	function addressdelete(id){
		location.href="addressdelete?id="+id;
	}
	function addressadd(){
		location.href="addressdelete?id="+id;
	}
	function addressadd(){
		show("addressadd",300,250);
	}
	
	
	</script>
	</head>
	
	<body>
				<a>地址管理</a>
		
		<div class="zhong">
         <table>
					<thead>
					   <a style="margin-left: 200px;">全选</a>
					   <button onclick="addressadd();">新增</button>
						<tr>
				           	<th><label><input type="checkbox" class="chkc" ></label></th>
							<th style="width: 120px">省市</th>
							<th style="width: 120px">区</th>
							<th style="width: 120px">名字</th>
							<th style="width: 120px">电话</th>
						    <th style="width: 120px">操作</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.address}" var="r">
							<tr>
							<td><label><input type="checkbox" class="chk"  
										myid="${r.id}"></label></td>
								<td style="width: 120px">${r.zone}</td>
								<td style="width: 120px">${r.addr}</td>
								<td style="width: 120px">${r.name}</td>
								<td style="width: 120px">${r.tel}</td>
								<td style="width: 120px">
								<button onclick="addresschange(${r.id});">修改</button>
								<button onclick="addressdelete(${r.id});">删除</button>
								</td>
						    </tr>
						</c:forEach>
					</tbody>
				</table>
				
		</div>
	</body>
</html>
