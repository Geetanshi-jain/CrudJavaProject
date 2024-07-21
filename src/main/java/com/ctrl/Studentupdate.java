package com.ctrl;

import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.model.Query;

@WebServlet("/updateStudent")
public class Studentupdate extends HttpServlet {

	
	public void doPost(HttpServletRequest request, HttpServletResponse response) {
		
		response.setContentType("text/html");
		int roll = Integer.parseInt(request.getParameter("enrol"));
		String name = request.getParameter("name");
		String[] nm = name.split(" ");
		String fname = nm[0];
		String lname = nm[1];
		String fullName = fname.concat(" "+lname);
		
		int math = Integer.parseInt(request.getParameter("math"));
		int py = Integer.parseInt(request.getParameter("phy"));
		int chem = Integer.parseInt(request.getParameter("chem"));

		try {
			PrintWriter out = response.getWriter();
			boolean rs = Query.update(roll,fullName,math,py,chem);
			 
			 if(!rs){
				//HttpSession hs = request.getSession();
				//hs.setAttribute("succes", "Deleted.......");
				RequestDispatcher rq = request.getRequestDispatcher("dashboard.jsp");
				rq.forward(request, response);
				
			 }
			 else{
				out.println("<h1 style='color:red; text-align:center;'>Opps! Error in updating data...</h1>");
				RequestDispatcher rq = request.getRequestDispatcher("studentUpdateForm.jsp");
				rq.include(request, response);	
				//HttpSession hs = request.getSession();
				//hs.setAttribute("sucess", "Not Deleted.......");
				
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		 
	}

}
