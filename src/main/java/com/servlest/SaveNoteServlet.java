package com.servlest;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.hibernate.Session;
import org.hibernate.Transaction;

import com.entities.Note;
import com.helper.FactoryHelper;

public class SaveNoteServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SaveNoteServlet() {
		super();
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		try {
			// fetch content and titless
			String title = request.getParameter("title");
			String content = request.getParameter("content");
			Note note = new Note(title, content, new Date());
			Session session = FactoryHelper.getFactory().openSession();
			Transaction tx = session.beginTransaction();
			session.save(note);
			tx.commit();
			session.close();
			response.setContentType("text/html");
			PrintWriter p = response.getWriter();
			p.println("<h1 style='text-align:center;'>NOTE ADDED SUCCESSFULLY</h1>");
			p.println("<h1 style='text-align:center;'><a href='all_notes.jsp'>View all notes</a></h1>");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
