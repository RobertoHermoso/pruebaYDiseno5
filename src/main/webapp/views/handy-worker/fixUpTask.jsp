<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="handyWorker.fixUpTasks" /></p>		

<security:authorize access="hasRole('HANDYWORKER')">

	<spring:url var="finderUrl" value="http://www.acme.com/workPlan/handyWorker/list.do" />
	
	<a href="${finderUrl}">
		<spring:message code="fixUpTask.filter" />				
	</a>

	<display:table pagesize="5" name="fixUpTasks" id="row" class="displaytag" 
					requestURI="/fixUpTask/handyWorker/list.do">
		
		<display:column>
			<jstl:if test="${row.application.status != 'ACCEPTED'}">
					<!-- Si la fix up task no ha sido aceptada, me permite proponer una aplicación -->
					<spring:url var="createApplicationUrl" value="/application/handyWorker/edit.do?fixUpTaskId={fixId}">
							<spring:param name="fixId" value="${row.id}" />
					</spring:url>
					
					<a href="${createApplicationUrl}">
							<spring:message code="fixUpTask.createApplication" />		
					</a>
			</jstl:if>
		</display:column>
		
		<display:column property="ticker" titleKey="fixUpTask.ticker" />	
		
		<display:column property="momentPublished" titleKey="fixUpTask.momentPublished" format="{0,date,dd/MM/yyyy HH:mm}" />
		
		<display:column property="description" titleKey="fixUpTask.description" /> 
		
		<display:column property="address" titleKey="fixUpTask.address"/>
		
		<display:column property="realizationTime" titleKey="fixUpTask.realizationTime"/> 
		
		<!-- See Warranties -->
		
		<display:column titleKey="fixUpTask.warranties">	
				<jstl:set var="warrantiesSize" value="${row.warranties.size()}" />
				
				<spring:url var="warrantiesUrl" value="/warranty/handyWorker/list.do?fixUpTaskId={fixId}">
						<spring:param name="fixId" value="${row.id}" />
				</spring:url>
				
				<a href="${warrantiesUrl}">
						<spring:message var="seeWarranties" code="fixUpTask.seeWarranties"/> 
						<jstl:out value="${seeWarranties}(${warrantiesSize})" />
				</a>
		</display:column>
		
		<!-- See Categories -->
		<display:column titleKey="fixUpTask.categories">	
				<jstl:set var="categoriesSize" value="${row.categories.size()}" />
				<spring:url var="categoriesUrl" value="http://www.acme.com/category/handyWorker/list.do?fixUpTaskId={fixId}">	<!-- R -->
						<spring:param name="fixId" value="${row.id}" />
				</spring:url>
				
				<a href="${categoriesUrl}">
						<spring:message var="seeCategories" code="fixUpTask.seeCategories"/> 
						<jstl:out value="${seeCategories}(${categoriesSize})" />		<!-- R -->
				</a>
		</display:column>
		
	</display:table>
	
</security:authorize>