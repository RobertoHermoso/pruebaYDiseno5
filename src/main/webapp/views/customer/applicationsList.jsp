<%--
 * action-1.jsp
 *
 * Copyright (C) 2018 Universidad de Sevilla
 * 
 * The use of this project is hereby constrained to the conditions of the 
 * TDG Licence, a copy of which you may download from 
 * http://www.tdg-seville.info/License.html
 --%>

<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="customer.action.1" /></p>

<display:table
	pagesize="5" name="applications" id="row"
	requestURI="customer/applications.do" >
	
	<display:column title="Editar">
	
	<a href="customer/application/edit.do"><spring:message code="master.page.customer.action.2" /></a>
		
	</display:column>
	<display:column	property ="date" titleKey="customer.date" />
	<display:column property="status"
					titleKey="customer.status" />				
	<display:column property="offeredPrice"
					titleKey="customer.offeredPrice" />
					
	<display:column title="Comments" >

	<a href="customer/application/comments.do"><spring:message code="master.page.customer.action.3" /></a>
	
	</display:column>	
					
	<display:column	titleKey="customer.handyWorkerMake">
	<jstl:out value="${row.handyWorker.make}" />
	</display:column>
	
		<display:column	titleKey="customer.handyWorkerScore">
	<jstl:out value="${row.handyWorker.score}" />
	</display:column>
	
	<display:column	titleKey="customer.fixUpTaskDescription">
	<jstl:out value="${row.fixUpTaks.description}" />
	</display:column>
	
		<display:column	title="customer.fixUpTaskMaxPrice">
	<jstl:out value="${row.fixUpTaks.maxPrice}" />
	</display:column>														
</display:table>

