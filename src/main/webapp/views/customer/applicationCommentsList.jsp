<%--
 * action-3.jsp
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

<p><spring:message code="customer.action.3" /></p>

<display:table
	pagesize="5" name="comments" id="row"
	requestURI="customer/applications/comments.do" >
	
	<display:column titlekey="customer.author">
		<jstl:out value="${row.author}" />
	</display:column>
	<display:column titlekey="customer.text">
		<jstl:out value="${row.text}" />
	</display:column>	
	<display:column titlekey="customer.date">
		<jstl:out value="${row.date}" />
	</display:column>									
</display:table>
</br>
<a href="customer/application/comments/edit.do"><spring:message code="master.page.customer.action.4" /></a>