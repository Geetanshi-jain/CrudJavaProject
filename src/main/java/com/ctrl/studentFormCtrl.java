package com.ctrl;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.RequestDispatcher;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.model.Query;

@WebServlet("/studentData")
public class studentFormCtrl  extends HttpServlet{

	public void doPost(HttpServletRequest request, HttpServletResponse response) {
	response.setContentType("text/html");
	
	int roll = Integer.parseInt(request.getParameter("enrol"));
	String name = request.getParameter("name");
	String[] nm = name.split(" ");
	String fname = nm[0];
	String lname = nm[1];
	String fullName = fname.concat("_"+lname);
	
	int math = Integer.parseInt(request.getParameter("math"));
	int py = Integer.parseInt(request.getParameter("phy"));
	int chem = Integer.parseInt(request.getParameter("chem"));

	
	
	try {		
		PrintWriter out = response.getWriter();
		
		if(roll<0 || "".equals(name) || math<0 || py<0 || chem<0){
			boolean rs = Query.insert(roll, name, math,py,chem);
			
			out.println("<h2 style='color:red;'>Opps!! you are inserting illegal data</h2>");
			RequestDispatcher rq = request.getRequestDispatcher("form.jsp");
			rq.include(request, response);
		}
		else{
			Query.insert(roll, fullName,math,py,chem);
			RequestDispatcher rq = request.getRequestDispatcher("dashboard.jsp");
			rq.forward(request, response);
		
		}
		
		
		
		//out.print(roll + " "+ name +" " + math +" "+ py+" "+ chem);
	
	}catch(Exception e){e.printStackTrace();}
	
	
	}
}
