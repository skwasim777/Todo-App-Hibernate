<%@page import="com.entities.Note"%>
<%@page import="com.helper.FactoryHelper"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Edit note</title>
<%@include file="all_css_jsp.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<h1>This is edit page</h1>
		<%
		int noteId = Integer.parseInt(request.getParameter("note_id").trim());
		Session s = FactoryHelper.getFactory().openSession();
		Note note = s.get(Note.class, noteId);
		%>
		<form action="UpdateServlvet" method="post">
		<input  value="<%=note.getId() %>" name=noteId type="hidden"/>
			<div class="mb-3">
				<label for="title" class="form-label">Title</label> <input
					name="title" required="required" type="text" class="form-control"
					id="title" placeholder="Enter title here"
					value="<%=note.getTitle()%>" />
			</div>
			<div class="mb-3">
				<label for="exampleInputPassword1" class="form-label">Content</label>
				<textarea name="content" required="required" id="content"
					placeholder="Enter your content here" class="form-control"
					style="height: 200px"><%=note.getContent() %></textarea>
			</div>
			<div class="container text-center">
				<button type="submit" class="btn btn-success">Save Note</button>
			</div>
		</form>
	</div>
</body>
</html>