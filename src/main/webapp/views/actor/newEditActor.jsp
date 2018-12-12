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

<jstl:choose>
	<!-- Editing -->
	<jstl:when test = "${actor.id>0}">
	
	
		<form:form modelAttribute="actor" action="/actor/authenticated/edit.do">
			<h2><spring:message code="actor.userAccount"/></h2>
		
			<spring:message code="actor.username"/>:<form:input path="username" value="${actor.userAccount.username}" required/>
			
			<spring:message code="actor.password"/>:<form:password path="password" value="${actor.userAccount.password}" required/>
			
			<h2><spring:message code="actor.personalInformation"/></h2>
		
			<spring:message code="actor.name"/>:<form:input path="name" value="${actor.name}" required/> 
			
			<spring:message code="actor.middleName"/>:<form:input path="middleName" value="${actor.middleName}"/>
			
			<spring:message code="actor.surname"/>:<form:input path="surname" value="${actor.surname}" required/>
			
			<!-- HandyWorker -->
			<security:authorize access = "hasRole('HANDYWORKER')">
				<spring:message code="handyworker.make"/>:<form:input path="make" value="${actor.make}"/>
			</security:authorize>
			<!--  -->
			
			<spring:message code="actor.photo"/>:<form:input path="photo" value="${actor.photo}"/>
			
			<spring:message code="actor.email"/>:<form:input path="email" value="${actor.email}" required/>
			
			<spring:message code="actor.phoneNumber"/>:<form:input path="phoneNumber" value="${actor.phoneNumber}"/>
			
			<spring:message code="actor.address"/>:<form:input path="address" value="${actor.address}"/>
			
			<input type="submit" name = "save" value="<spring:message code="actor.save"/>" onclick="return confirm('<spring:message code="actor.save" />')"/>
		</form:form>
	
	
	</jstl:when>
	<!-- Creating -->
	<jstl:otherwise>
		<!-- Anonymous -->
		<security:authorize access = "isAnonymous()">
		
		
		<form:form modelAttribute="actor" action="/actor/anonymous/create.do">
			<h2><spring:message code="actor.userAccount"/></h2>
		
			<spring:message code="actor.username"/>:<form:input path="username" required/>
			
			<spring:message code="actor.password"/>:<form:password path="password" required/>
			
			<spring:message code="actor.type"/>:
			<form:select path="type" required>
				<form:option label="<spring:message code="actor.customer"/>" value="0" />
				<form:option label="<spring:message code="actor.sponsor"/>" value="1" />
				<form:option label="<spring:message code="actor.handyworker"/>" value="2" />
			</form:select>
			
			<h2><spring:message code="actor.personalInformation"/></h2>
		
			<spring:message code="actor.name"/>:<form:input path="name" required/> 
			
			<spring:message code="actor.middleName"/>:<form:input path="middleName"/>
			
			<spring:message code="actor.surname"/>:<form:input path="surname" required/>
			
			<spring:message code="actor.photo"/>:<form:input path="photo"/>
			
			<spring:message code="actor.email"/>:<form:input path="email" required/>
			
			<spring:message code="actor.phoneNumber"/>:<form:input path="phoneNumber"/>
			
			<spring:message code="actor.address"/>:<form:input path="address"/>
			
			<input type="submit" name = "save" value="<spring:message code="actor.save"/>"/>
		</form:form>
		
		
		</security:authorize>
		<!-- Admin -->
		<security:authorize access = "hasRole('ADMIN')">
		
		
		<form:form modelAttribute="actor" action="/actor/admin/create.do">
			<h2><spring:message code="actor.userAccount"/></h2>
		
			<spring:message code="actor.username"/>:<form:input path="username" required/>
			
			<spring:message code="actor.password"/>:<form:password path="password" required/>
			
			<spring:message code="actor.type"/>:
			<form:select path="type" required>
				<form:option label="<spring:message code="actor.referee"/>" value="0" />
				<form:option label="<spring:message code="actor.admin"/>" value="1" />
			</form:select>
			
			<h2><spring:message code="actor.personalInformation"/></h2>
		
			<spring:message code="actor.name"/>:<form:input path="name" required/> 
			
			<spring:message code="actor.middleName"/>:<form:input path="middleName"/>
			
			<spring:message code="actor.surname"/>:<form:input path="surname" required/>
			
			<spring:message code="actor.photo"/>:<form:input path="photo"/>
			
			<spring:message code="actor.email"/>:<form:input path="email" required/>
			
			<spring:message code="actor.phoneNumber"/>:<form:input path="phoneNumber"/>
			
			<spring:message code="actor.address"/>:<form:input path="address"/>
			
			<input type="submit" name = "save" value="<spring:message code="actor.save"/>"/>
		</form:form>
		
		
		</security:authorize>
	</jstl:otherwise>
</jstl:choose>