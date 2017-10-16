<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="/struts-tags"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>

<head>
<meta charset="UTF-8">
<title>图书借记管理系统</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/common.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath }/css/main.css" />
<script type="text/javascript" src="${pageContext.request.contextPath }/js/libs/modernizr.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath }/bootstrap/js/jquery-3.2.0.min.js"></script>
<script language=javascript>
	// 提交分页的查询的表单
	function to_page(page) {
		if (page) {
			$("#page").val(page);
		}
		document.customerForm.submit();
	}
	
	/*function delete(id) {
		if(confirm("您确定要删除这条记录？")) {
			window.location="${pageContext.request.contextPath }/booklist_delete.action?id="+id;
		}
	}
	*/
</script>

<meta content="MSHTML 6.00.2900.3492" name=GENERATOR>
</head>
<body>
	<div class="topbar-wrap white">
		<div class="topbar-inner clearfix">
			<div class="topbar-logo-wrap clearfix">

				<ul class="navbar-list clearfix">
					<li><a class="on" href="index.jsp">首页</a></li>

				</ul>
			</div>
			<div class="top-info-wrap">
				<ul class="top-info-list clearfix">
					<li>欢迎您，<s:property value="#session.admin.username" />！</a></li>
					<li><a href="${pageContext.request.contextPath }/admin/password.jsp">修改密码</a></li>
					<li><a
						href="javascript:if(confirm('确实要退出登录吗?'))location='login.jsp'">退出</a></li>
				</ul>
			</div>
		</div>
	</div>
	<div class="container clearfix">
		<div class="sidebar-wrap">
			<div class="sidebar-title">
				<h1>菜单</h1>
			</div>
			<div class="sidebar-content">
				<ul class="sidebar-list">
					<li><a ><i class="icon-font">&#xe003;</i>图书管理</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/booklist_btlist.action"><i class="icon-font">&#xe008;</i>添加图书</a></li>
							<li><a href="${pageContext.request.contextPath }/booklist_findByPage.action"><i class="icon-font">&#xe005;</i>图书列表</a></li>

						</ul></li>
					<li><a ><i class="icon-font">&#xe018;</i>借记管理</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/borrow_findByPage.action"><i class="icon-font">&#xe017;</i>在借列表</a></li>
							<li><a href="${pageContext.request.contextPath }/back_findByPage.action"><i class="icon-font">&#xe037;</i>已归还列表</a></li>

						</ul></li>
					<li><a ><i class="icon-font">&#xe018;</i>黑名单管理</a>
						<ul class="sub-menu">
							<li><a href="${pageContext.request.contextPath }/black_findByPage.action"><i class="icon-font">&#xe017;</i>黑名单列表</a></li>


						</ul></li>
				</ul>
			</div>
		</div>
		<!--/sidebar-->
		<div class="main-wrap">

			<div class="crumb-wrap">
				<div class="crumb-list">
					<i class="icon-font"></i><a href="../index.jsp">首页</a><span
						class="crumb-step">&gt;</span><a class="crumb-name" >黑名单管理</a><span
						class="crumb-step">&gt;</span><span>黑名单列表</span>
				</div>
			</div>
			<div class="search-wrap">
            <div class="search-content">
                <form action="${pageContext.request.contextPath }/black_findByPage.action" method="post">
                    <table class="search-tab">
                        <tr>
                            
                            
                            <th width="70">学号:</th>
                            <td><input class="common-text" placeholder="学号" name="stu_id" value="${model.stu_id }"  type="text"></td>
                            <td><input class="btn btn-primary btn2" name="sub" value="查询" type="submit"></td>
                        </tr>
                    </table>
                </form>
            </div>
        </div>
			  
			
			<div class="result-wrap">
				
					<form id="customerForm" name="customerForm"
						action="${pageContext.request.contextPath }/black_findByPage.action"
						method=post >
						 <div class="result-title">
                    <div class="result-list">
                        <a href="${pageContext.request.contextPath }/blacklist/blackadd.jsp"><i class="icon-font"></i>新增</a>
                        
                    </div>
                </div>

					<div class="result-content">
						<table id=grid
							class="result-tab" width="100%">
							<tbody>
								<tr
									style="FONT-WEIGHT: bold; FONT-STYLE: normal; BACKGROUND-COLOR: #eeeeee; TEXT-DECORATION: none">
									<td>学号</td>
									<td>姓名</td>
									<td>操作</td>
								</tr>
								<c:forEach items="${page.beanList}" var="Black">
									<tr
										style="FONT-WEIGHT: normal; FONT-STYLE: normal; BACKGROUND-COLOR: white; TEXT-DECORATION: none">
										<td>${Black.stu_id }</td>

										<td>${Black.stu_name}</td>
										

										<td><a class="link-update"
											href="${pageContext.request.contextPath }/black_initUpdate.action?id=${Black.id}">修改</a>
											&nbsp;&nbsp; 
											<a class="link-del"
											 href="${pageContext.request.contextPath}/black_delete.action?id=${Black.id}"
											onclick="return window.confirm('确定删除吗？')">删除</a></td>
									</tr>

								</c:forEach>

							</tbody>
						</table>
						</td>
						</tr>

						<tr>
						<tr>
							<span id=pagelink>
								<div style="LINE-HEIGHT: 20px; HEIGHT: 20px; TEXT-ALIGN: right">
									共[<B>${page.totalCount}</B>]条记录，共[<B>${page.totalPage}</B>]页
									,每页显示 <select name="pageSize">
										<option value="2"
											<c:if test="${page.pageSize==2 }">selected</c:if>>2</option>
										<option value="3"
											<c:if test="${page.pageSize==3 }">selected</c:if>>3</option>
									</select> 条

									<c:if test="${ page.pageCode > 1 }">
													[<A href="javascript:to_page(${page.pageCode-1})">前一页</A>]
												</c:if>

									<B>${page.pageCode}</B>

									<c:if test="${ page.pageCode < page.totalPage }">
													[<A href="javascript:to_page(${page.pageCode+1})">后一页</A>] 
												</c:if>

									到 <input type="text" size="3" id="page" name="pageCode" /> 页 <input
										type="button" value="Go" onclick="to_page()" />
								</div>
							</span>
							</td>
						</tr>
						</tbody>
						</table>
						</td>

						</tr>
						</tbody>
						</table>

					</form>
				</div>
			</div>

		</div>
		<!--/main-->
	</div>
</body>
</html>
