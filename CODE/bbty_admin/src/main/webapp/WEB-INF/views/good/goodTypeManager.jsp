<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@ include file="/common/common.jsp"%>

<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

</head>

<body>

	<div class="row">

		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">商品类别</div>
				<div class="panel-body">
					<div id="tree"></div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">商品类别列表</div>
				<div class="panel-body">
					<div id="tree"></div>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
	var goodTypeTree;
		$(function() {
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/goodType/getGoodTypeTree",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	goodTypeTree = dataRtn.treeList;
	            }
	        });
			/* var tree = [ {
				text : "Parent 1",
				nodes : [ {
					text : "Child 1",
					nodes : [ {
						text : "Grandchild 1"
					}, {
						text : "Grandchild 2"
					} ]
				}, {
					text : "Child 2"
				} ]
			}, {
				text : "Parent 2"
			}

			]; */

			$('#tree').treeview({
				data : goodTypeTree,
				emptyIcon : "glyphicon glyphicon-book",
				onNodeSelected : function(event, data) {
					console.debug(data);
				}
			});

			//折叠树节点
			$('#tree').treeview('collapseAll', {
				silent : true
			});

		});
	</script>

</body>