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

<h4><spring:message code="actor.logged" /><jstl:out value=" ${username}"/></h4>

<form:form modelAttribute="box" action="box/save.do">
	<spring:message code="actor.box.name"/>:
	<form:input path="name" value="${box.name}"/>
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<input type="submit" name = "save" value="<spring:message code="actor.save"/>"/>
</form:form>

<p><a href="actor/mail.do"><spring:message code="actor.cancel"/></a></p>