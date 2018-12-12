
<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="customer.applications" /></p>

<security:authorize access="hasRole('CUSTOMER')">
	
	<display:table pagesize="5" name="applications" id="row" class="displaytag" 
					requestURI="/application/customer/list.do">
		
		<jstl:choose>
			<jstl:when test="${row.status=='ACCEPTED'}">
				<jstl:set var="color" value="green" />
			</jstl:when>
			
			<jstl:when test="${row.status=='REJECTED'}">
				<jstl:set var="color" value="red" />
			</jstl:when>
			
			<jstl:when test="${row.fixUpTask.realizationTime.compareTo(new Date())>1}">
				<jstl:set var="color" value="grey" />
			</jstl:when>
			
			<jstl:otherwise>
				<jstl:set var="color" value="black" />
			</jstl:otherwise>
		</jstl:choose>
		

		<display:column titleKey="application.changeStatus">
			<!-- Solo deja cambiar el status si no está aceptado -->	
			<jstl:if test="${row.status!='ACCEPTED'}">
					<spring:url var="statusUrl" value="/application/customer/edit.do?applicationId={appId}">
							<spring:param name="appId" value="${row.id}"/>
					</spring:url>
			
					<a href="${statusUrl}">
							<spring:message code="application.changeStatus" />
					</a>
			</jstl:if>	
		</display:column>
		
		<div style=<jstl:out value="${color}"/>>
		<display:column property="moment" titleKey="application.moment"	
						format="{0,date,dd/MM/yyyy HH:mm}" />
		</div>
		
		<div style=<jstl:out value="${color}"/>>
		<display:column property="status" titleKey="application.status" />	
		</div>
		
		<div style=<jstl:out value="${color}"/>>
		<display:column property="offeredPrice" titleKey="application.offeredPrice" />	
		</div>
		
		<div style=<jstl:out value="${color}"/>>
		<display:column titleKey="application.comments">
				<jstl:set var="commentsSize" value="${row.comments.size()}" />
				<spring:url var="commentsUrl" value="/comment/customer/list.do?applicationId={appId}">
							<spring:param name="appId" value="${row.id}"/>
				</spring:url>
				<a href="${commentsUrl}">
							<spring:message var ="viewComments1" code="application.viewComments" />
							<jstl:out value="${viewComments1}(${commentsSize})" />		
				</a>
		</display:column>
		</div>
		
		<div style=<jstl:out value="${color}"/>>
		<display:column titleKey="application.make">		
				<jstl:out value="${row.handyWorker.make}"/>
		</display:column>
		</div>
		
		<div style=<jstl:out value="${color}"/>>
		<display:column titleKey="application.score">		
				<jstl:out value="${row.handyWorker.score}" />
		</display:column>
		</div>
	</display:table>

</security:authorize>
