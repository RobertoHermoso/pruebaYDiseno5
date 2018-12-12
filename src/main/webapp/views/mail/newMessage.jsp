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

<security:authorize access="isAuthenticated()">

<spring:url var="showActor" value="/actor/authenticated/edit.do"/>

<h4><spring:message code="actor.logged" /><a href="${showActor}"><jstl:out value=" ${username}"/></a></h4>

<form:form modelAttribute="message" action="/message/authenticated/save.do">
	<spring:message code="mail.message.subject"/>:<form:input path="subject" required/>
	
	<spring:message code="mail.message.receiver"/>:
	<form:select path="receiver" required>
		<form:options items="${actors}" itemLabel="name" itemValue="id"/>
	</form:select>
	
	<spring:message code="mail.message"/>:<form:textarea path="body" required/>

	<input type="submit" name = "save" value="<spring:message code="mail.message.send"/>" onclick="return confirm('<spring:message code="mail.send" />')"/>
</form:form>

<spring:url var="mail" value="/box/authenticated/list.do"/>

<p><a href="${mail}"><spring:message code="mail.cancel"/></a></p>

</security:authorize>