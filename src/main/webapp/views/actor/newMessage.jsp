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

<form:form modelAttribute="message" action="message/new.do">
	<spring:message code="actor.message.title"/>:
	<form:input path="subject"/>
	<spring:message code="actor.name"/>:
	<form:select path="receiver">
		<form:options items="${actors}" itemLabel="name" itemValue="id"/>
	</form:select>
	<spring:message code="actor.message"/>:
	<form:textarea path="body"/>
	<form:hidden path="id"/>
	<form:hidden path="version"/>
	<input type="submit" name = "save" value="<spring:message code="actor.send"/>"/>
</form:form>

<p><a href="actor/mail.do"><spring:message code="actor.back"/></a></p>