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

<security:authorize access="sAuthenticated()">

<spring:url var="showActor" value="/actor/show.do?actorId={actorId}">
	<spring:param name="actorId" value="${actorId}"/>
</spring:url>

<h4><spring:message code="actor.logged" /><a href="${showActor}"><jstl:out value=" ${username}"/></a></h4>

<spring:url var="boxSave" value="/box/save.do"/>
<form:form modelAttribute="box" action="${boxSave}">
	<spring:message code="mail.box.name"/>:<form:input path="name" value="${box.name}"/>
	
	<jstl:if test="${box.name.lenght()>0}">
		<form:hidden path="id"/>
		<form:hidden path="version"/>
	</jstl:if>
	
	<input type="submit" name = "save" value="<spring:message code="mail.save"/>"/>
</form:form>

<spring:url var="mail" value="/actor/mail.do"/>

<p><a href="${mail}"><spring:message code="mail.cancel"/></a></p>

</security:authorize>