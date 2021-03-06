<%@ page contentType="text/html;charset=UTF-8" %>
<%@ include file="/webpage/include/taglib.jsp"%>
<html>
<head>
	<title>产品管理</title>
	<meta name="decorator" content="default"/>
	<script type="text/javascript">
		var validateForm;
		function doSubmit(){//回调函数，在编辑和保存动作时，供openDialog调用提交表单。
		  if(validateForm.form()){
			  $("#inputForm").submit();
			  return true;
		  }
	
		  return false;
		}
		$(document).ready(function() {
			validateForm = $("#inputForm").validate({
				submitHandler: function(form){
					loading('正在提交，请稍等...');
					form.submit();
				},
				errorContainer: "#messageBox",
				errorPlacement: function(error, element) {
					$("#messageBox").text("输入有误，请先更正。");
					if (element.is(":checkbox")||element.is(":radio")||element.parent().is(".input-append")){
						error.appendTo(element.parent().parent());
					} else {
						error.insertAfter(element);
					}
				}
			});
			
		});
	</script>
</head>
<body>
		<form:form id="inputForm" modelAttribute="product" action="${ctx}/product/product/save" method="post" class="form-horizontal">
		<form:hidden path="id"/>
		<sys:message content="${message}"/>	
		<table class="table table-bordered  table-condensed dataTables-example dataTable no-footer">
		   <tbody>
				<tr>
					<td class="width-15 active"><label class="pull-right">产品名称：</label></td>
					<td class="width-35">
						<form:input path="name" htmlEscape="false" maxlength="64" class="form-control "/>
					</td>
					<td class="width-15 active"><label class="pull-right">产品负责人：</label></td>
					<td class="width-35">
						<form:input path="proManager" htmlEscape="false" maxlength="64" class="form-control "/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">测试负责人：</label></td>
					<td class="width-35">
						<form:input path="testManager" htmlEscape="false" maxlength="64" class="form-control "/>
					</td>
					<td class="width-15 active"><label class="pull-right">发布负责人：</label></td>
					<td class="width-35">
						<form:input path="issueManager" htmlEscape="false" maxlength="64" class="form-control "/>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">产品状态：</label></td>
					<td class="width-35">
						<form:select path="status" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('pro_status')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
					<td class="width-15 active"><label class="pull-right">产品类型：</label></td>
					<td class="width-35">
						<form:select path="type" class="form-control ">
							<form:option value="" label=""/>
							<form:options items="${fns:getDictList('pro_type')}" itemLabel="label" itemValue="value" htmlEscape="false"/>
						</form:select>
					</td>
				</tr>
				<tr>
					<td class="width-15 active"><label class="pull-right">产品描述：</label></td>
					<td class="width-35">
						<form:input path="describe" htmlEscape="false" maxlength="64" class="form-control "/>
					</td>
					<td class="width-15 active"><label class="pull-right">访问控制：</label></td>
					<td class="width-35">
						<form:radiobuttons path="interview" items="${fns:getDictList('interview')}" itemLabel="label" itemValue="value" htmlEscape="false" class="i-checks "/>
					</td>
				</tr>
		 	</tbody>
		</table>
	</form:form>
</body>
</html>