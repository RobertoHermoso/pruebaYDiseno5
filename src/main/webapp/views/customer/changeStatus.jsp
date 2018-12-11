<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="customer.application.edit" /></p>	
 
<security:authorize access="hasRole('CUSTOMER')">
	<form:form action="application/customer/edit.do" modelAttribute="application">
		<form:hidden path="id"/>
		<form:hidden path="version" /> 
		<form:hidden path="moment" />
		<form:hidden path="offeredPrice" />
		<form:hidden path="comments" />
		<form:hidden path="fixUpTask" />
		<form:hidden path="handyWorker" /> 
		
		 
		 <form:label path="status">
			<spring:message code="customer.application.status" />		
		</form:label>
		
		<form:select path="status">
			<form:options
				itemLabel=<spring:message code="customer.application.accepted" />			
				itemValue="ACCEPTED" />									
			<form:options	
				itemLabel=<spring:message code="customer.application.pending" />
				itemValue="PENDING" />	
			<form:options
				itemLabel=<spring:message code="customer.application.rejected" />
				itemValue="REJECTED" />
		</form:select>

		<form:errors cssClass="error" path="status" />
		<br />
		
		<input type="submit" name="create" value="<spring:message code="application.create"/>" />		
	
		<input type="submit" name="cancel" value="<spring:message code="application.cancel"/>" />	

	</form:form>
</security:authorize>