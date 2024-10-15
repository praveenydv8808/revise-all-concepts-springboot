<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<html>
<head>
<title>Add User</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f4f4;
	margin: 0;
	padding: 0;
}

.container {
	width: 40%;
	margin: auto;
	overflow: hidden;
	background-color: #fff;
	padding: 20px;
	border-radius: 5px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

label {
	display: block;
	margin: 15px 0 5px;
	font-weight: bold;
	color: #333;
}

input[type="text"], input[type="email"], input[type="tel"] {
	width: 100%;
	padding: 10px;
	margin: 5px 0 10px;
	border-radius: 5px;
	border: 1px solid #ccc;
	box-sizing: border-box;
}

input[type="submit"] {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

input[type="submit"]:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>
	<div class="container">
		<h2>Add User</h2>
		
		<c:if test="${not empty userAlreadyExistError}">
			<p class="error" style="color: red;">${userAlreadyExistError}</p>
			<!-- Display error message in red -->
		</c:if>
		
		<c:if test="${not empty errors}">
			<ul>
				<c:forEach var="error" items="${errors}">
					<li style="color: red;">${error.defaultMessage}</li>
					<!-- Display error message -->
				</c:forEach>
			</ul>
		</c:if>
		<form:form method="post" modelAttribute="user">


			<form:input type="hidden" path="id" />

			<fieldset class="mb-3">
				<form:label path="name">Name:</form:label>
				<form:input type="text" path="name" required="required" />
				<form:errors path="name" cssClass="text-warning" />
			</fieldset>

			<fieldset class="mb-3">
				<form:label path="mobile">Mobile No:</form:label>
				<form:input type="text" path="mobile" required="required" />
				<form:errors path="mobile" cssClass="text-warning" />
			</fieldset>

			<fieldset class="mb-3">
				<form:label path="email">Email:</form:label>
				<form:input type="text" path="email" required="required" />
				<form:errors path="email" cssClass="text-warning" />
			</fieldset>

			<input type="submit" class="btn btn-success" value="Add User" />

		</form:form>
	</div>
</body>
</html>

