
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="customer.comment.list" /></p>

<security:authorize access="hasRole('CUSTOMER')">
	<display:table pagesize="5" name="comments" id="row"
	class="displaytag" requestURI="/comment/customer/list.do">
	
		<display:column property="username" titleKey="comments.username" /> 
		
		<display:column property="text" titleKey="comments.text" />	
		
		<display:column property="moment" titleKey="comments.moment" 
						sortable="true" format="{0,date,dd/MM/yyyy HH:mm}" /> 
		 
	</display:table>
	
	<jstl:if test="${application.status=='ACCEPTED'}">
			
		<spring:url var="createCommentUrl" value="http://www.acme.com/comment/customer/edit.do?applicationId={appId}">
				<spring:param name="appId" value="${application.id}"/>
		</spring:url>
	
		<a href="${createCommentUrl}">
				<spring:message code="comments.create" />			
		</a>
	
	</jstl:if>
	

</security:authorize>