package com.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Query;

@WebServlet("/deleteServlet")
public class DeleteCtrl extends HttpServlet {

	
	public void doGet(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html");
		int id = Integer.parseInt(request.getParameter("id"));
		
		try {
			PrintWriter out = response.getWriter();
			boolean rs = Query.delete(id);
			 
			 if(!rs){
				HttpSession hs = request.getSession();
				hs.setAttribute("succes", "Deleted.......");
				RequestDispatcher rq = request.getRequestDispatcher("dashboard.jsp");
				rq.forward(request, response);
				
			 }
			 else{
				RequestDispatcher rq = request.getRequestDispatcher("dashboard.jsp");
				rq.include(request, response);	
				HttpSession hs = request.getSession();
				hs.setAttribute("sucess", "Not Deleted.......");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}
}
