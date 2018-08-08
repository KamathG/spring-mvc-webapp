<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>List Customers</title>

<link type="text/css"
		rel="stylesheet"
		href="${pageContext.request.contextPath}/resources/css/style.css"/>
</head>


<body>


<div id="wrapper">
	<div id="header">
	
	<h2>CRM - Customer Relationship Manager</h2>
	</div>

	<div id="container">
	
	<h3> Save Customer </h3>	
	
	<form:form action="saveCustomer" modelAttribute="customer" method="POST">
	
	</form:form>
	
	</div>



</div>
	<div id="wrapper">
		<div id="container">
			<div id="content">
			
	<!-- Add new customer button -->
	
	<input type="button" value="Add Customer"
			onClick="window.location.href='showFormForAdd'; return false;"/>
			
			<form:form action="search" method="POST">
                Search customer: <input type="text" name="theSearchName" />
                
                <input type="submit" value="Search" class="add-button" />
            </form:form>
				
					<!-- Add html table here -->
					<table>
						<tr>
							<th>First Name</th>
							<th>Last Name</th>
							<th>Email</th>
							<th>Action</th>
						</tr>
		
		
<!-- Loop over and print out customers -->

		<c:forEach var = "tempCustomer" items= "${customers}" >
		
		<c:url var="updateLink" value="/customer/showFormForUpdate">
			<c:param name="customerId" value="${tempCustomer.id}"></c:param>
		</c:url>
		
		<c:url var="deleteLink" value="/customer/delete">
			<c:param name="customerId" value="${tempCustomer.id}"></c:param>
		</c:url>
		
				<tr>
						<td>${tempCustomer.firstName}</td>
						<td>${tempCustomer.lastName}</td>
						<td>${tempCustomer.email}</td>
						
						<td> 
						<a href="${updateLink}">Update</a>
						
						 <a href="${deleteLink}" 
						onClick="if(!(confirm('Are you sure you want to Delete this customer?'))) return false">Delete</a>
						</td>
				
				</tr>
			
		</c:forEach>		
					
					</table>
			
			</div>
		
		</div>
	
	</div>
</body>

</html>