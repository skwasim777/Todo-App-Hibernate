<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add Notes</title>
<%@include file="all_css_jsp.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1>Please fill your notes details</h1>
		<!--this add form  -->
		<form action="SaveNoteServlet" method="post">
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input name="title" required="required"
					type="text" class="form-control" id="title" placeholder="Enter title here" />
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea name="content" required="required" id="content" placeholder="Enter your content here" class="form-control" style="height:200px"></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-primary">Add</button>
			</div>
		</form>
	</div>
</body>
</html>