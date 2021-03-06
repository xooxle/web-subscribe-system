<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
				<!-- 标签  tags:many to many prop tab start -->
				<div class="tab-pane fade" id="tags">
					<div class="dataTables_wrapper select-list" id="tagsSelectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="tag/selectList.do"
						 data-groupname="tagsKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
						 data-initvalues="${nfn:serialKyes(tempBean.tags,'manageKey')}"
						 >
					</div>
					<div style="padding:5px">
						<input id="tagsSelect2" class="object-select" style="width:50%;" 
							   data-queryurl="tag/select2Query.do"
							   data-querydelay="250"
							   data-multiple="false"
							   data-querymethod="POST"
							   data-initurl=""
							   data-minlength="0"
							   data-renderdata="name"
							   data-echodata="name"
							   data-customcallback="selectListSelection"
							   data-selectlist="tagsSelectList"
							   placeholder="<spring:message code="base.function.add"/>"
							   />
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="tagsSelectList">
							<i class="fa fa-trash-o"></i><spring:message code="base.function.delete"/>
						</a>
					</div>
				</div>
				<!-- 标签 tags:!-- many to many prop tab end -->
			<div class="tab-pane fade" id="covers">
					<div style="padding:5px">
						<a class="btn btn-primary attachement-dialog-add-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" 
						   data-selectlist="coverSelectList" 
						   data-targetpanel="${targetPanel}"
						   data-maxfilesize="100"
						   data-acceptedfiles="${file_format_picture}"
						   >
							<i class="fa fa-plus"></i> <spring:message code="base.function.add"/>
						</a>
						<a class="btn btn-danger select-list-delete-btn"
						   href="javascript:void(0)" style="padding:5px 15px;" data-selectlist="coverSelectList">
							<i class="fa fa-trash-o"></i> <spring:message code="base.function.delete"/>
						</a>
					</div>
				<div class="dataTables_wrapper select-list" id="coverSelectList" style="border-bottom:1px solid #ddd;" 
						 data-dataurl="filee/selectList.do"
					 	 data-groupname="coverKeys"
						 data-entityidname="manageKey"
						 data-method="POST"
					 	 data-initvalues="${tempBean.cover.manageKey }"
						 >
					</div>
				</div>