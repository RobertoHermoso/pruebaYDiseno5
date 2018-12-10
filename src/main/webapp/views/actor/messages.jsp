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
	pagesize="5" name="messages" id="row"
	requestURI="actor/messages.do" >
	
	<display:column	property ="moment"
					titleKey="actor.message.moment"/>
					
	<display:column	titleKey="actor.message.subject">
	
		<spring:url var="showMessage" value="/message/show.do?messageId={rowId}">
			<spring:param name="rowId" value="${row.id}"/>
		</spring:url>
	
		<a href="${showMessage}"><jstl:out value="${row.subject}" /></a>
	</display:column>	
							
	<display:column	titleKey="actor.name">
		<jstl:out value="${row.sender.name}" />
	</display:column>	
					
	<display:column titleKey="">
		<spring:url var="replyMessage" value="/message/new.do?messageId={rowId}">
			<spring:param name="rowId" value="${row.id}"/>
		</spring:url>
	
		<a href="${replyMessage}"><jstl:out value="actor.message.reply" /></a>
	</display:column>
	
	<display:column titleKey="">
		<spring:url var="deleteMessage" value="/message/delete.do?messageId={rowId}">
			<spring:param name="rowId" value="${row.id}"/>
		</spring:url>
	
		<a href="${deleteMessage}"><jstl:out value="actor.message.delete" /></a>
	</display:column>	
															
</display:table>

<spring:url var="newMessage" value="/message/new.do"/>

<p><a href="${newMessage}"><spring:message code="actor.message.new" /></a></p>

</security:authorize>