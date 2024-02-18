<%@page import="com.entities.Note"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.helper.FactoryHelper"%>
<%@page import="org.hibernate.Session"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>All notes</title>
<%@include file="all_css_jsp.jsp"%>
</head>
<body>
	<div class="container">
		<%@include file="navbar.jsp"%>
		<br>
		<h1 class="text-uppercase">all notes:</h1>
		<div class="row">
			<div class="col-12">
				<%
				Session s = FactoryHelper.getFactory().openSession();
				Query q = s.createQuery("from Note");
				List<Note> noteList = q.list();

				for (Note note : noteList) {
				%>
				<div class="card mt-2">
					<img class="card-img-top m-1" style="max-width: 40px;"
						src="img/notes.png" alt="Card image cap">
					<div class="card-body">
						<h5 class="card-title">
							<%=note.getTitle()%>
						</h5>
						<p class="card-text"><%=note.getContent()%></p>
						<div class="container mt-2"></div>
						<a href="DeleteServlet?note_id=<%=note.getId()%>"
							class="btn btn-danger">Delete</a> <a
							href="edit.jsp?note_id=<%=note.getId()%>" class="btn btn-primary">Update</a>
					</div>
				</div>
				<%
				}

				s.close();
				%>
			</div>
		</div>

	</div>

</body>
</html>