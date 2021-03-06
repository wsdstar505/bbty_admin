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

	<!-- 成功提示框 -->
	<div class="modal fade bs-example-modal-sm" id="successAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-success btn-circle">
						<i class="fa fa-check"></i>
					</button>
					&nbsp;&nbsp;&nbsp;操作成功！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-success" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 失败提示框 -->
	<div class="modal fade bs-example-modal-sm" id="dangerAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-danger btn-circle">
						<i class="fa fa-times"></i>
					</button>
					&nbsp;&nbsp;&nbsp;操作失败，出现异常！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>

	<!-- 没选择一条警告提示框 -->
	<div class="modal fade bs-example-modal-sm" id="oneRowAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;请选择一条记录！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 未选择警告提示框 -->
	<div class="modal fade bs-example-modal-sm" id="noRowAlert"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-sm">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;请选择记录！
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-warning" data-dismiss="modal">确定</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 删除商品信息确认提示框 -->
	<div class="modal fade bs-example-modal-lg" id="confirmDelModal"
		tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel"
		aria-hidden="true">
		<div class="modal-dialog modal-lg">
			<div class="modal-content">
				<div class="modal-body">
					<button type="button" class="btn btn-warning btn-circle">
						<i class="fa fa-exclamation"></i>
					</button>
					&nbsp;&nbsp;&nbsp;确定要删除选中的库存信息吗？
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-danger"
						onclick="deleteReps();">确定</button>
					<button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 新增库存信息 -->
	<div class="modal fade" id="repAddModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(1);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">新增库存信息</h4>
				</div>
				<div class="modal-body">
					<form id="repAddForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodRep/saveGoodRep" method="post">
						<input type="hidden" id="infoIdAdd" name="infoIdAdd"/>
						<div class="form-group">
							<label for="pici" class="col-sm-2 control-label">批次:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pici">
							</div>
						</div>
						<div class="form-group">
							<label for="cbp" class="col-sm-2 control-label">成本价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cbp">
							</div>
						</div>
						<div class="form-group">
							<label for="pfp" class="col-sm-2 control-label">批发价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pfp">
							</div>
						</div>
						<div class="form-group">
							<label for="sczdp" class="col-sm-2 control-label">市场指导价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input class="form-control" name="sczdp">
							</div>
						</div>
						<div class="form-group">
							<label for="xsp" class="col-sm-2 control-label">销售价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="xsp">
							</div>
						</div>
						<div class="form-group">
							<label for="meterId" class="col-sm-2 control-label">计量单位:<font color='red'>*</font></label>
							<div class="col-sm-6">
								<select id="meterId" name="meterId" style="width: 460px">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="repNum" class="col-sm-2 control-label">数量:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="repNum">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="saveRep();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(1);">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<!-- 修改库存信息 -->
	<div class="modal fade" id="repUptModal" tabindex="-1" role="dialog">
		<div class="modal-dialog">
			<div class="modal-content">
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal" onclick="closeModal(2);">
						<span aria-hidden="true">&times;</span><span class="sr-only">Close</span>
					</button>
					<h4 class="modal-title">修改库存信息</h4>
				</div>
				<div class="modal-body">
					<form id="repUptForm" class="form-horizontal" role="form"
						action="<%=contextPath%>/goodRep/uptGoodRep" method="post">
						<input type="hidden" id="repId" name="repId"/>
						<input type="hidden" id="infoId" name="infoId"/>
						<div class="form-group">
							<label for="pici" class="col-sm-2 control-label">批次:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pici" id="pici" readonly="readonly">
							</div>
						</div>
						<div class="form-group">
							<label for="cbp" class="col-sm-2 control-label">成本价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="cbp" id="cbp">
							</div>
						</div>
						<div class="form-group">
							<label for="pfp" class="col-sm-2 control-label">批发价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="pfp" id="pfp">
							</div>
						</div>
						<div class="form-group">
							<label for="sczdp" class="col-sm-2 control-label">市场指导价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input class="form-control" name="sczdp" id="sczdp">
							</div>
						</div>
						<div class="form-group">
							<label for="xsp" class="col-sm-2 control-label">销售价格:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="xsp" id="xsp">
							</div>
						</div>
						<div class="form-group">
							<label for="meterId" class="col-sm-2 control-label">计量单位:<font color='red'>*</font></label>
							<div class="col-sm-6">
								<select id="uptMeterId" name="meterId" style="width: 460px">
								</select>
							</div>
						</div>
						<div class="form-group">
							<label for="repNum" class="col-sm-2 control-label">数量:<font color='red'>*</font></label>
							<div class="col-sm-10">
								<input type="text" class="form-control" name="repNum" id="repNum">
							</div>
						</div>
						<div class="modal-footer">
							<button type="button" class="btn btn-primary"
								onclick="uptRep();">保存</button>
							<button type="button" class="btn btn-default"
								onclick="closeModal(2);">关闭</button>
						</div>
					</form>
				</div>
			</div>
		</div>
	</div>
	
	<div class="row">
		<div class="col-lg-4">
			<div class="panel panel-default">
				<div class="panel-heading">商品信息</div>
				<div class="panel-body">
					<div id="tree"></div>
				</div>
			</div>
		</div>

		<div class="col-lg-8">
			<div class="panel panel-default">
				<div class="panel-heading">库存信息列表</div>
				<div class="panel-body" id="repMenuDiv">
					<button type="button" class="btn btn-primary"
						onclick="toAddRep();">新增库存</button>
					<button type="button" class="btn btn-warning"
						onclick="toUptRep();">修改库存</button>
					<button type="button" class="btn btn-danger" onclick="toDeleteReps();">批量删除库存</button>
				</div>
				<input type="hidden" id="infoIdStr" />
				<div class="panel-body" id="repTableDiv">
					<table class="table table-striped table-bordered table-hover" id="goodRepTables">
					</table>
				</div>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		var goodTypeTree;
		var infoIdStr;
		$(function() {
			$("#repMenuDiv").hide();
			
			$.ajax({
	            type : "post",
	            url : "<%=contextPath%>/goodInfo/getGoodInfoTree",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	goodTypeTree = dataRtn.treeList;
	            	
	        		$('#tree').treeview({
	    				data : goodTypeTree,
	    				emptyIcon : "glyphicon glyphicon-book",
	    				onNodeSelected : function(event, data) {
	    					
	    					infoIdStr=data.tags;
	    					var type = data.type;
	    					
	    					if(infoIdStr != "1" && type =="0"){
	    						$("#infoIdStr").val(infoIdStr);
		    					
		    					var nodes = data.nodes;
		    					var isLeaf = data.isLeaf;
		    					
		    						if(nodes == null && isLeaf=="0"){
		    							$("#repMenuDiv").show();
			    						$("#repTableDiv").show();
			    						
			    						
			    						//表格初始化
				    			        $('#goodRepTables').DataTable({
				    			        	destroy:true,	    			        	
				    			        	pagingType:"full_numbers",//设置分页控件的模式
				    			        	searching: false,//datatales的查询框,true:开启;false:关闭
				    			        	lengthMenu:[10,20,30],//设置一页展示多少条记录
				    			        	lengthChange: false,//tables的一页展示多少条记录的下拉列表,true:开启;false:关闭
				    			        	responsive: true,//是否需要分页控件,true:需要,false:不需要
				    			            ajax: {
				    			                "url": "<%=contextPath%>/goodRep/getRepsByGoodInfo?infoIdStr="+infoIdStr
				    							},
				    							columns : [ 
				    							{
				    								"data":"repId",
				    								render:function(data,type,full,meta){
				    									return '<input type="checkbox" class="checkchild" value="'+data+'" />';
				    								},
				    								"sortable":false
				    							},	
				    							{
				    								"data" : "pici",
				    								"title" : "批次"
				    							},{
				    								"data" : "meterName",
				    								"title" : "计量单位"
				    							},{
				    								"data" : "repNum",
				    								"title" : "库存数量"
				    							}, {
				    								"data" : "cbp",
				    								"title" : "成本价格"
				    							},{
				    								"data" : "pfp",
				    								"title" : "批发价格"
				    							},{
				    								"data" : "sczdp",
				    								"title" : "市场指导价格"
				    							},{
				    								"data" : "xsp",
				    								"title" : "销售价格"
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
		    						}else{
		    							$("#repMenuDiv").hide();
			    						$("#repTableDiv").hide();
		    						}
		    					
		    						
	    					}else{
	    						$("#repMenuDiv").hide();
	    						$("#repTableDiv").hide();
	    					}
	    				}
	    			});
	        		
	        		//折叠树节点
	        		 $('#tree').treeview('collapseAll', {
	     				silent : true
	     			});
	            }
	        });
			
			
			
			//新增库存信息表单校验
	    	$('#repAddForm').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	pici: {/*键名username和input name值对应*/
		                    message: '批次无效',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '批次不能为空'
		                        },
		                        numeric:{
		                        	message: '批次只能输入数字'
		                        },
		                        remote: {
		                        	url: '<%=contextPath%>/goodRep/checkAddPici',
		                            message: '该商品的批次已存在',//提示消息
		                            type: 'post',//请求方式
		                            data: function(validator) {
			                               return {
			                            	   infoIdStr: $("#infoIdStr").val()
			                               };
			                            }
		                        }
		                    }
	                       
		                },
		                cbp: {
		                    message:'成本价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '成本价格不能为空'
		                        },
		                        numeric:{
		                        	message: '成本价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                pfp: {
		                    message:'批发价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '批发价格不能为空'
		                        },
		                        numeric:{
		                        	message: '批发价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                sczdp: {
		                    message:'市场指导价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '市场指导价格不能为空'
		                        },
		                        numeric:{
		                        	message: '市场指导价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                xsp: {
		                    message:'销售价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '销售价格不能为空'
		                        },
		                        numeric:{
		                        	message: '销售价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                meterId: {
		                    message:'计量单位无效',
		                    validators: {
		                        notEmpty: {
		                            message: '计量单位不能为空'
		                        }
		                    }
		                },
		                repNum: {
		                    message:'数量无效',
		                    validators: {
		                        notEmpty: {
		                            message: '数量不能为空'
		                        },
		                        numeric:{
		                        	message: '数量只能输入数字'
		                        }
		                       
		                    }
		                }
		            }
		        });
			
			
	    	//修改库存信息表单校验
	    	$('#repUptForm').bootstrapValidator({
		            message: 'This value is not valid',
		            feedbackIcons: {/*输入框不同状态，显示图片的样式*/
		                valid: 'glyphicon glyphicon-ok',
		                invalid: 'glyphicon glyphicon-remove',
		                validating: 'glyphicon glyphicon-refresh'
		            },
		            fields: {/*验证*/
		            	pici: {/*键名username和input name值对应*/
		                    message: '批次无效',
		                    validators: {
		                        notEmpty: {/*非空提示*/
		                            message: '批次不能为空'
		                        },
		                        numeric:{
		                        	message: '批次只能输入数字'
		                        }
		                    }
	                       
		                },
		                cbp: {
		                    message:'成本价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '成本价格不能为空'
		                        },
		                        numeric:{
		                        	message: '成本价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                pfp: {
		                    message:'批发价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '批发价格不能为空'
		                        },
		                        numeric:{
		                        	message: '批发价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                sczdp: {
		                    message:'市场指导价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '市场指导价格不能为空'
		                        },
		                        numeric:{
		                        	message: '市场指导价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                xsp: {
		                    message:'销售价格无效',
		                    validators: {
		                        notEmpty: {
		                            message: '销售价格不能为空'
		                        },
		                        numeric:{
		                        	message: '销售价格只能输入数字'
		                        }
		                       
		                    }
		                },
		                meterId: {
		                    message:'计量单位无效',
		                    validators: {
		                        notEmpty: {
		                            message: '计量单位不能为空'
		                        }
		                    }
		                },
		                repNum: {
		                    message:'数量无效',
		                    validators: {
		                        notEmpty: {
		                            message: '数量不能为空'
		                        },
		                        numeric:{
		                        	message: '数量只能输入数字'
		                        }
		                       
		                    }
		                }
		            }
		        });
			
	    	//初始化新增的select控件
	        $("#meterId").select2({
	        	 placeholder: "请选择计量单位",
	        	 allowClear: true,
	        	 closeOnSelect: true,
	        	 minimumResultsForSearch:-1,
	        	 separator: ",",  
	        	 ajax: {
	        		 url: "<%=contextPath%>/meter/getMeterJson",
	        		 dataType: 'json',
	        		 delay: 250,
	        		 processResults: function (data, params) {
	        		      return {
	        		        results: data.selectJsons,
	        		      };
	        		 },
	        		 cache: true
	        	 }
	        });
	
		});
		
		 
		function successAlert() {
			$("#successAlert").modal('show');
			//setTimeout('$("#successAlert").hide()',3000);
		}

		function dangerAlert() {
			$("#dangerAlert").modal('show');
		}

		function oneRowAlert() {
			$("#oneRowAlert").modal('show');
		}

		function noRowAlert() {
			$("#noRowAlert").modal('show');
		}

		function reloadTable() {
			var goodRepTables = $('#goodRepTables').DataTable();
			goodRepTables.ajax.reload();
		}

		//关闭商品类型窗口
		function closeModal(par) {
			if (par == "1") {
				//清空表单验证
				$('#repAddForm').data('bootstrapValidator').resetForm();
				//清空表单内容
				$('#repAddForm').resetForm();
				$("#repAddModal").modal('hide');
			} else if (par == "2") {
				//清空表单验证
				$('#repUptForm').data('bootstrapValidator').resetForm();
				//清空表单内容
				$('#repUptForm').resetForm();

				$("#repUptModal").modal('hide');
			} else {
				$("#confirmDelModal").modal('hide');
			}

		}

		//跳转到新增库存信息
		function toAddRep() {
			$('#repAddModal').modal('show');
		}

		//保存新增库存信息
		function saveRep() {
			var infoIdStr = $("#infoIdStr").val();
			$("#infoIdAdd").val(infoIdStr);
			var repAddForm = $('#repAddForm');
			//验证表单
			var validator = $('#repAddForm').data('bootstrapValidator');

			if (validator) {
				// 修复记忆的组件不验证
				validator.validate();
				if (!validator.isValid()) {
					return false;
				}
			}

			$.ajax({
				type : "post",
				url : repAddForm.attr("action"),
				data : repAddForm.serializeArray(),
				dataType : "json",
				cache : false,
				success : function(dataRtn) {
					var rtnStr = dataRtn.rtn;
					//清空表单验证
					$('#repAddForm').data('bootstrapValidator').resetForm();
					//清空表单内容
					$('#repAddForm').resetForm();

					if (rtnStr == "success") {
						//关闭窗口
						closeModal(1);
						//成功提示
						successAlert();

					} else {
						//关闭窗口
						closeModal(1);
						//成功提示
						dangerAlert();
					}

					//列表刷新
					reloadTable();
				}
			});

		}

		//跳转到删除库存信息
		function toDeleteReps() {
			if ($(".checkchild:checked").length == 0) {
				noRowAlert();
			} else {
				$("#confirmDelModal").modal('show');
			}
		}

		//删除库存信息
		function deleteReps() {
			//var goodInfoTables = $('#goodInfoTables').DataTable();
			//var rows = goodInfoTables.rows('.selected').data();
			//var length = goodInfoTables.rows('.selected').data().length;
			var rowIdArray = [];
			var length = $(".checkchild:checked").length;
			$(".checkchild:checked").each(function() {
				rowIdArray.push($(this).val());
			});

			$.ajax({
				type : "post",
				url : "<%=contextPath%>/goodRep/delGoodRep",
	            data : JSON.stringify(rowIdArray),
	            contentType:"application/json",
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	
	            	if(rtnStr == "success"){
	            		//关闭窗口
	                	closeModal(3);
	            		//成功提示
	                	successAlert();
	            	}else{
	            		//关闭窗口
	                	closeModal(3);
	            		//错误提示
	                	dangerAlert();
	            	}
	            	
	            	//列表刷新
	            	reloadTable();
	            }
	        }); 
		}
	    
		//跳转到修改库存信息
		function toUptRep(){
			//var goodInfoTables = $('#goodInfoTables').DataTable();
	    	//var length = goodInfoTables.rows('.selected').data().length;
	    	if($(".checkchild:checked").length == 0 || $(".checkchild:checked").length >1){
	    			oneRowAlert();
	    	}else{
	    		//var row = goodInfoTables.rows('.selected').data();
	    		//var infoCode = row[0].infoCode;
	    		var repId = $(".checkchild:checked").val();
	    		var rep = {repId:repId};
	    		$.ajax({
	    			type : "post",
	                url : "<%=contextPath%>/goodRep/getGoodRep",
						data : rep,
						dataType : "json",
						success : function(dataRtn) {
							var rtnStr = dataRtn.rtn;
							if (rtnStr == "success") {
								$("#repId").val(dataRtn.goodRep.repId);
								$("#infoId").val(dataRtn.goodRep.infoId);
								$("#pici").val(dataRtn.goodRep.pici);
								$("#cbp").val(dataRtn.goodRep.cbp);
								$("#pfp").val(dataRtn.goodRep.pfp);
								$("#sczdp").val(dataRtn.goodRep.sczdp);
								$("#xsp").val(dataRtn.goodRep.xsp);
								
								$("#repNum").val(dataRtn.goodRep.repNum);
								
								$("#uptMeterId").select2({
						        	 placeholder: "请选择计量单位",
						        	 allowClear: true,
						        	 closeOnSelect: true,
						        	 minimumResultsForSearch:-1,
						        	 separator: ",",  
						        	 ajax: {
						        		 url: "<%=contextPath%>/meter/getMeterJson",
						        		 dataType: 'json',
						        		 delay: 250,
						        		 processResults: function (data, params) {
						        		      return {
						        		        results: data.selectJsons,
						        		      };
						        		 },
						        		 cache: true
						        	 }
						        });
								
								var selectJson = dataRtn.selectJson;
								var ht = $("#uptMeterId").html();
									if(ht == ""){
										$("#uptMeterId").html('<option value='+selectJson.id+'>'+selectJson.text+'</option>');
									}else{
										ht=ht+'<option value='+selectJson.id+'>'+selectJson.text+'</option>';
										$("#uptMeterId").html(ht);
									}
								var	meterId =selectJson.id;
							
								$("#uptMeterId").val(meterId).trigger("change");
								
								$('#repUptModal').modal('show');
							} else {
								dangerAlert();
							}
						}
					});
				}
		}
	    
		   //保存修改库存信息
	    function uptRep(){
	    	
	    	var repUptForm = $('#repUptForm');
	    	//验证表单
	    	 var validator = $('#repUptForm').data('bootstrapValidator');
	        
	    	if (validator) {
	        // 修复记忆的组件不验证
	            validator.validate();
	            if (!validator.isValid()) {
	                return false;
	            }
	        }
	        
	        $.ajax({
	            type : "post",
	            url : repUptForm.attr("action"),
	            data : repUptForm.serializeArray(),
	            dataType : "json",
	            cache : false,
	            success : function (dataRtn){
	            	var rtnStr = dataRtn.rtn;
	            	
	            	//清空表单验证
	        		$('#repUptForm').data('bootstrapValidator').resetForm(); 
	        		//清空表单内容
	        		$('#repUptForm').resetForm();
	        		
	            	if(rtnStr == "success"){
	            		
	            		//关闭窗口
	                	closeModal(2);
	            		//成功提示
	                	successAlert();
	            		
	            	}else{
	            		
	            		//关闭窗口
	                	closeModal(2);
	            		//错误提示
	                	dangerAlert();
	            	}
	            	
	            	//列表刷新
	            	reloadTable();
	            }
	        });

	    }
		
	</script>

</body>