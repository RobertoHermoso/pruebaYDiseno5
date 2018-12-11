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

<display:table
	pagesize="10" name="boxes" id="row"
	requestURI="actor/boxes.do" >
	
	<display:column titleKey="mail.box.name">
		<spring:url var="showBox" value="/box/show.do?boxId={boxId}">
			<spring:param name="boxId" value="${row.id}"/>
		</spring:url>
		
		<a href="${showBox}"><jstl:out value="${row.name}"/></a>
	</display:column>
		
	<display:column	titleKey="mail.messages">
		<jstl:out value="${row.messages.size()}" />
	</display:column>	
	
	<jstl:choose>
		<jstl:when test="${row.isSystem}"></jstl:when>
		
		<display:column titleKey="">
		</display:column>
		
		<display:column titleKey="">
		</display:column>
		
		<jstl:otherwise>
		
		<display:column titleKey="">
			<spring:url var="deleteBox" value="/box/delete.do?boxId={boxId}">
				<spring:param name="boxId" value="${row.id}"/>
			</spring:url>
		
			<a href="${deleteBox}"><spring:message code="mail.box.delete"/></a>
		</display:column>
	
		<display:column titleKey="">
			<spring:url var="editBox" value="/box/edit.do?boxId={boxId}">
				<spring:param name="boxId" value="${row.id}"/>
			</spring:url>
		
			<a href="${editBox}"><spring:message code="mail.box.edit"/></a>
		</display:column>	
		
		</jstl:otherwise>
	</jstl:choose>
															
</display:table>

<spring:url var="newBox" value="/box/save.do"/>

<p><a href="${newBox}"><spring:message code="mail.box.new" /></a></p>

</security:authorize>