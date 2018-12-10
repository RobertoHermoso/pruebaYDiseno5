<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="comment.addComment" /></p>			

<security:authorize access="hasRole('CUSTOMER')">

<form:form action="comment/customer/edit.do" modelAttribute="comment" >
	<form:hidden path="id"/>
	<form:hidden path="version" />
	<form:hidden path="moment" />
	<form:hiddem path="writtenBy" />
	
	<form:label path="text">
			<spring:message code="comment.text" />		
	</form:label>
	<form:textarea path="text" placeholder="${comment.writeComment}" />		
	<form:errors cssClass="error" path="text" />
	<br />
	
	<input type="submit" name="create" value="<spring:message code="comment.create"/>" />	
	
	<input type="submit" name="cancel" value="<spring:message code="customer.cancel" />"
		onClick="javascript: relativeRedir('customer/application/comment.do');" />
</form:form>

</security:authorize>