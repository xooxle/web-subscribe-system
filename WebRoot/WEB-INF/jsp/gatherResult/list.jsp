<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@include file="/WEB-INF/jsp/common/taglib.jsp"%>
<section id="widget-grid" class="">
	<div class="row">
		<article class="col-sm-12 col-md-12 col-lg-12">
			<div class="jarviswidget" id="wid-id-0" 
			data-widget-colorbutton="false" data-widget-editbutton="false" 
			data-widget-deletebutton="false"
			data-widget-custombutton="false">
				<header>
					<span class="widget-icon"> <i class="fa fa-file"></i> </span>
					<h2><spring:message code="funcs.GatherResult.list"></spring:message></h2>
				</header>
				<div>
					<div class="jarviswidget-editbox">
					</div>
					<div class="widget-body no-padding">
						<form:form action="gatherResult/list.do" id="gather-list-form" class="smart-form smart-form-search" onsubmit="return ajaxSearch(this,'${targetPanel}')" commandName="gatherResult">
							<input type="hidden" name="pageNum" value="${pageBean.pageNum}"/>
							<input type="hidden" name="orderField" value="${pageBean.orderField}"/>
							<input type="hidden" name="orderDirection" value="${pageBean.orderDirection}"/>
							<input type="hidden" name="targetPanel" value="${targetPanel}"/>
							<div id="form-search-mobile" class="btn-header transparent pull-left" style="margin-top:-5px;">
								<span> <a href="javascript:void(0)" title="Search"><i class="fa fa-search"></i></a> </span>
							</div>
						    <fieldset>
							<div class="row">
							<%@include file="/WEB-INF/jsp/gatherResult/list-form.jsp" %>
								<section class="col col-2 pull-right">
										<a class="btn btn-primary smart-form-submit-btn pull-right" href="#" style="padding:5px 15px;"><i class="fa fa-search"></i> <spring:message code="base.function.query"/></a>
								</section>
							</div>
							</fieldset>
							<div style="padding:5px;" class="form-menu">
							<%--
								<n:pv url="gatherResult/add.do">
									<a class="btn btn-primary" href="${basePath}gatherResult/add.do" target="dialogTodo" title="<spring:message code="funcs.GatherResult.add"></spring:message>"  id="addBtn"><i class="fa fa-plus"></i> <spring:message code="base.function.add"/></a>
								</n:pv>
							 --%>
								<n:pv url="gatherResult/markAsRead.do">
									<a class="btn btn-primary" href="${basePath}gatherResult/markAsRead.do?manageKeys={manageKeys}" target="ajaxTodo"><i class="fa fa-reply"></i> 标记为已读</a>
								</n:pv>
								<n:pv url="gatherResult/delete.do">
									<a class="btn btn-danger" href="${basePath}gatherResult/delete.do?manageKeys={manageKeys}" target="ajaxTodo" confirm="<spring:message code="dwz.framework.dialog.confirmofdelete"></spring:message>" warn="<spring:message code="dwz.framework.dialog.pleaseselecttodelete"></spring:message>"><i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/></a>
								</n:pv>
								<n:pv url="gatherResult/update.do">
									<a class="btn btn-warning" href="${basePath}gatherResult/update.do?manageKey={manageKeys}"  rel="manageKeys" target="dialogTodo" title="<spring:message code="funcs.GatherResult.update"></spring:message>" data-mustone="true" data-onlyone="true"><i class="fa fa-edit"></i> <spring:message code="base.function.update"/></a>
								</n:pv>
								<%--
								<n:pv url="gatherResult/detail.do">
									<a class="btn btn-primary" href="${basePath}gatherResult/detail.do?manageKey={manageKeys}" rel="manageKeys" target="dialogTodo" title="<spring:message code="base.function.view"></spring:message>" style="padding:5px 15px;" data-mustone="true" data-onlyone="true" id="viewBtn"><i class="fa fa-eye"></i> <spring:message code="base.function.view"/></a>
								</n:pv>
								<n:pv url="gatherResult/history.do">
									<a class="btn btn-primary" href="${basePath}gatherResult/history.do?manageKey={manageKeys}&list=yes" rel="manageKeys"  target="dialogTodo" title="<spring:message code="base.function.history"></spring:message>"  data-mustone="true" data-onlyone="true" id="viewBtn"><i class="fa fa-clock-o"></i> <spring:message code="base.function.history"/></a>
								</n:pv>
								<n:pv url="gatherResult/export.do">
									<a class="btn btn-primary" href="${basePath}gatherResult/export.do" data-model="me.huqiao.wss.chapter.entity.GatherResult"  target="nuiExport" title="<spring:message code="base.function.export"></spring:message>"  data-mustone="true" data-onlyone="true" id="exportBtn"><i class="fa fa-external-link"></i> <spring:message code="base.function.export"/></a>
								</n:pv>
								<n:pv url="gatherResult/import.do">
									<a class="btn btn-primary" href="${basePath}gatherResult/import.do" data-model="me.huqiao.wss.chapter.entity.GatherResult"  target="dialogTodo" title="<spring:message code="base.function.import"></spring:message>"  data-mustone="true" data-onlyone="true" id="importBtn"><i class="fa fa-sign-in"></i> <spring:message code="base.function.import"/></a>
								</n:pv>
								 --%>
								<!--在这里添加其他菜单按钮-->
							</div>
							<div class="dataTables_wrapper" style="border-bottom:1px solid #ddd;"> 
							<table id="dt_basic" class="table table-striped table-bordered table-hover" style="border:1px solid red;">
							<thead>
							<tr>
								<th align="center" width="16px">
										<label class="checkbox">
											<input type="checkbox" name="checkbox" class="smart-form-checkall" data-groupname="manageKeys">
										<i></i></label>
								</th>
								<%@include file="/WEB-INF/jsp/gatherResult/list-head.jsp" %>
							</tr>
							</thead>
							<tbody>
								<c:if test="${empty pageBean.list}">
									<tr>
										<td colspan="7">
											<center>
												<font style="color: gray;"><spring:message code="base.function.table.info.nodata" /> </font>
											</center>
										</td>
									</tr>
								</c:if>
								<c:forEach var="tempBean" items="${pageBean.list}"
									varStatus="stauts">
									<tr target="manageKeys" rel="${tempBean.manageKey}">
										<td align="center"  width="16">
										<label class="checkbox">
											<input name="manageKeys" type="checkbox" value="${tempBean.manageKey}"/><i></i>
										</label>
										</td>
										<%@include file="/WEB-INF/jsp/gatherResult/list-body.jsp" %>
									</tr>
								</c:forEach>
							</tbody>
						</table>
						</div>
						<%@include file="/WEB-INF/jsp/common/pageBar.jsp" %>
						</form:form>
					</div>
				</div>
			</div>
		</article>
	</div>
</section>
<script type="text/javascript">
<!--
$(function(){
	$("table .link").click(function(){
		$(this).removeClass("a-new").addClass("a-old");		
	});
	
	$("#taskSelect").change(function(){
		$("#gather-list-form").submit();
	});
});

function favouriteMark(a,key){
	var fa = $(".fa",$(a));
	var favourite =fa.hasClass("fa-heart") ? 'No' : 'Yes';
	$.get(basePath + 'gatherResult/mark.do?favourite='+ favourite +'&manageKey=' + key,function(r){
		if(r.statusCode=='200'){
			if(fa.hasClass("fa-heart")){
				fa.removeClass("fa-heart").removeClass("red").addClass("fa-heart-o");
			}else{
				fa.removeClass("fa-heart-o").addClass("fa-heart").addClass("red");
			}
		}else{
			alertMsg.error(r.message);
		}
	});
}
//-->
</script>
<%@include file="/WEB-INF/jsp/common/pageSetJS.jsp" %>