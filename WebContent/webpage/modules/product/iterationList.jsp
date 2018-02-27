<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>迭代管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		$(document).ready(function() {
		
		});
	</script>
</head>
<body class="gray-bg">
	<div class="wrapper wrapper-content">
	<div class="ibox">
	<div class="ibox-title">
		<h5>迭代列表 </h5>
		<div class="ibox-tools">
			<a class="collapse-link">
				<i class="fa fa-chevron-up"></i>
			</a>
			<a class="dropdown-toggle" data-toggle="dropdown" href="#">
				<i class="fa fa-wrench"></i>
			</a>
			<ul class="dropdown-menu dropdown-user">
				<li><a href="#">选项1</a>
				</li>
				<li><a href="#">选项2</a>
				</li>
			</ul>
			<a class="close-link">
				<i class="fa fa-times"></i>
			</a>
		</div>
	</div>
    
    <div class="ibox-content">
	<sys:message content="${message}"/>
	
	<!--查询条件-->
	<div class="row">
	<div class="col-sm-12">
	<form:form id="searchForm" modelAttribute="iteration" action="${ctx}/iteration/iteration/" method="post" class="form-inline">
		<input id="pageNo" name="pageNo" type="hidden" value="${page.pageNo}"/>
		<input id="pageSize" name="pageSize" type="hidden" value="${page.pageSize}"/>
		<table:sortColumn id="orderBy" name="orderBy" value="${page.orderBy}" callback="sortOrRefresh();"/><!-- 支持排序 -->
		<div class="form-group">
		 </div>	
	</form:form>
	<br/>
	</div>
	</div>
	
	<!-- 工具栏 -->
	<div class="row">
	<div class="col-sm-12">
		<div class="pull-left">
			<shiro:hasPermission name="iteration:iteration:add">
				<table:addRow url="${ctx}/iteration/iteration/form" title="迭代"></table:addRow><!-- 增加按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="iteration:iteration:edit">
			    <table:editRow url="${ctx}/iteration/iteration/form" title="迭代" id="contentTable"></table:editRow><!-- 编辑按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="iteration:iteration:del">
				<table:delRow url="${ctx}/iteration/iteration/deleteAll" id="contentTable"></table:delRow><!-- 删除按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="iteration:iteration:import">
				<table:importExcel url="${ctx}/iteration/iteration/import"></table:importExcel><!-- 导入按钮 -->
			</shiro:hasPermission>
			<shiro:hasPermission name="iteration:iteration:export">
	       		<table:exportExcel url="${ctx}/iteration/iteration/export"></table:exportExcel><!-- 导出按钮 -->
	       	</shiro:hasPermission>
	       <button class="btn btn-white btn-sm " data-toggle="tooltip" data-placement="left" onclick="sortOrRefresh()" title="刷新"><i class="glyphicon glyphicon-repeat"></i> 刷新</button>
		
			</div>
		<div class="pull-right">
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="search()" ><i class="fa fa-search"></i> 查询</button>
			<button  class="btn btn-primary btn-rounded btn-outline btn-sm " onclick="reset()" ><i class="fa fa-refresh"></i> 重置</button>
		</div>
	</div>
	</div>
	
	<!-- 表格 -->
	<table id="contentTable" class="table table-striped table-bordered table-hover table-condensed dataTables-example dataTable">
		<thead>
			<tr>
				<th> <input type="checkbox" class="i-checks"></th>
				<th  class="sort-column name">迭代名称</th>
				<th  class="sort-column beginTime">起始日期</th>
				<th  class="sort-column endTime">起始日期</th>
				<th  class="sort-column times">可用时间</th>
				<th  class="sort-column type">迭代类型</th>
				<th  class="sort-column product">关联产品</th>
				<th  class="sort-column describe">迭代描述</th>
				<th  class="sort-column teamMan">团队成员</th>
				<th>操作</th>
			</tr>
		</thead>
		<tbody>
		<c:forEach items="${page.list}" var="iteration">
			<tr>
				<td> <input type="checkbox" id="${iteration.id}" class="i-checks"></td>
				<td ><a  href="#" onclick="openDialogView('查看迭代', '${ctx}/iteration/iteration/form?id=${iteration.id}','800px', '500px')">
					${iteration.name}
				</a></td>
				<td >
					${iteration.beginTime}
				</td>
				<td >
					${iteration.endTime}
				</td>
				<td >
					${iteration.times}
				</td>
				<td >
					${fns:getDictLabel(iteration.type, 'iter_type', '')}
				</td>
				<td >
					${iteration.product}
				</td>
				<td >
					${iteration.describe}
				</td>
				<td >
					${fns:getDictLabel(iteration.teamMan, '', '')}
				</td>
				<td>
					<shiro:hasPermission name="iteration:iteration:view">
						<a href="#" onclick="openDialogView('查看迭代', '${ctx}/iteration/iteration/form?id=${iteration.id}','800px', '500px')" class="btn btn-info btn-xs" ><i class="fa fa-search-plus"></i> 查看</a>
					</shiro:hasPermission>
					<shiro:hasPermission name="iteration:iteration:edit">
    					<a href="#" onclick="openDialog('修改迭代', '${ctx}/iteration/iteration/form?id=${iteration.id}','800px', '500px')" class="btn btn-success btn-xs" ><i class="fa fa-edit"></i> 修改</a>
    				</shiro:hasPermission>
    				<shiro:hasPermission name="iteration:iteration:del">
						<a href="${ctx}/iteration/iteration/delete?id=${iteration.id}" onclick="return confirmx('确认要删除该迭代吗？', this.href)"   class="btn btn-danger btn-xs"><i class="fa fa-trash"></i> 删除</a>
					</shiro:hasPermission>
				</td>
			</tr>
		</c:forEach>
		</tbody>
	</table>
	
		<!-- 分页代码 -->
	<table:page page="${page}"></table:page>
	<br/>
	<br/>
	</div>
	</div>
</div>
</body>
</html>