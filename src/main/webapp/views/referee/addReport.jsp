<%@page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>

<%@taglib prefix="jstl"	uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="security" uri="http://www.springframework.org/security/tags"%>
<%@taglib prefix="display" uri="http://displaytag.sf.net"%>

<p><spring:message code="complaint.report.add" /></p>	

<security:authorize access="hasRole('REFEREE')">

<form:form action="/complaint/customer/edit.do" modelAttribute="complaint">


		<!-- Hidden Attributes -->
		<form:hidden path="id"/>
		<form:hidden path="moment" />
		<form:hidden path="attachment" />
		<form:hidden path="notes" />
		
				
		<!-- Description -->
		<form:label path="description">	<!-- Tiles -->
			<spring:message code="report.description" />	
		</form:label>
		<form:textarea path="description"/>
		<form:errors cssClass="error" path="description" />
		
		
		<!--  Final Mode -->
		<form:select path="finalMode">
              <form:options
                  itemLabel=<spring:message code="report.true" />
                  itemValue="true"
              />
              <form:options
                  itemLabel=<spring:message code="report.false" />
                  itemValue="false"
              />
      </form:select>
      
      	
		<input type="submit" name="create" value="<spring:message code="note.create.button"/>" />	
			
		
		<input type="submit" name="cancel" value="<spring:message code="note.cancel.button"/>" />
		
		


</form:form>


</security:authorize>
