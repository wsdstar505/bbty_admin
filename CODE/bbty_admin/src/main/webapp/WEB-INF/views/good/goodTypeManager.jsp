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
					<table class="table table-striped table-bordered table-hover"
						id="goodTypeTables">
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var tree1;
		var typeCode;
		$(function() {
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/goodType/getGoodTypeTree",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	tree1 = dataRtn.treeList;
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
				data : tree1,
				emptyIcon : "glyphicon glyphicon-book",
				onNodeSelected : function(event, data) {
					typeCode=data.tags;
					//表格初始化
			        $('#goodTypeTables').DataTable({
			        	pagingType:"full_numbers",//设置分页控件的模式
			        	searching: false,//datatales的查询框,true:开启;false:关闭
			        	lengthMenu:[10,20,30],//设置一页展示多少条记录
			        	lengthChange: true,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
			        	responsive: true,//是否需要分页控件,true:需要,false:不需要
			            ajax: {
			                "url": "<%=contextPath%>/goodType/getChildGoodTypesByTypeCode?typeCode="+typeCode
							},
							columns : [ {
								"data" : "typeCode",
								"title" : "类别编码"
							}, {
								"data" : "tyepName",
								"title" : "类别名称"
							},{
								"data" : "status",
								"title" : "状态"
							}
					         ],
							language : {
								loadingRecords : "加载中...",
								processing : "查询中...",
								search : "智能搜索:",
								lengthMenu : "每页显示 _MENU_ 条记录",
								zeroRecords : "没有找到记录",
								info : "当前显示第 _START_ 至 _END_条记录，总共 _TOTAL_ 条记录",
								infoEmpty : "无记录",
								infoFiltered : "(从 _MAX_ 条记录过滤)",
								paginate : {
									first : "首页",
									last : "尾页",
									next : "下页",
									previous : "上页"
								}
							}
						});
				}
			});

			//折叠树节点
			$('#tree').treeview('collapseAll', {
				silent : true
			});

		});
	</script>

</body>