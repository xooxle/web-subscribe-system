<%@page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
	<td width="50">${tempBean.id}</td>
	<td width="20px" style="text-align:center;">
	
	<a href="javascript:void(0);" onclick="favouriteMark(this,'${tempBean.manageKey}')">
	<i class="fa ${tempBean.favourite eq 'Yes' ? 'fa-heart red' : 'fa-heart-o' }"></i>
	</a>
	</td>
		<td>
		<span class="label label-success hspan">
		${tempBean.task.name}
		</span>
		<a href="${basePath}gatherResult/view.do?manageKey=${tempBean.manageKey}"  target="_blank" class="link ${tempBean.status eq 'InUse' ? 'a-new' :'a-old'}" style="">
		${tempBean.title}
		</a>
		<br/>
		<fmt:formatDate value="${tempBean.createTime}" pattern="MM-dd HH:mm"/>
		|
		<a href="${basePath}gatherResult/fanyi.do?manageKey=${tempBean.manageKey}" target="ajaxTodo" title="翻译">翻译</a>
		
		&nbsp; 
		<c:forEach items="${tempBean.tags }" var="tag">
			<code style="border:1px solid #ddd;padding:2px;">${tag.name}</code>
		</c:forEach>
		
		</td>
		

