package com.wipro.oide.servlet;


import java.io.*;
import java.util.Scanner;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/IdeServlet")
public class IdeServlet extends HttpServlet {

	Ide ide=new Ide();

	protected  void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
response.setContentType("text/plain");
	PrintWriter out=response.getWriter();
	String programfile=request.getParameter("code");
	System.out.println(programfile);
	String inputfile=request.getParameter("cusinput");
	String langselect=request.getParameter("template");
	String command=request.getParameter("cmd");
	String programs="";
	String inputs="";
	
	String a[]=programfile.split("\\n");
	String a2[]=inputfile.split("\\n");
		for(int i=0;i<a.length;i++)
{
			programs+=a[i]+"\n";
}
		
		for(int i=0;i<a2.length;i++)
		{
					inputs+=a2[i]+"\n";
		}
System.out.println(programfile+"\n"+langselect);
		System.out.println(command);	
		int sel=0;
		if(langselect.equals("C"))
			sel=1;
		else if(langselect.equals("C++"))
			sel=2;
			else if(langselect.equals("JAVA 7"))
				
				sel=3;	
				
			else if(langselect.equals("JAVA 8"))
				sel=4;	
			
				
			else if(langselect.equals("JAVA 9"))
		
				sel=5;	
				
			else if(langselect.equals("PYTHON 2.7.14"))
					sel=6;			
				else if(langselect.equals("PYTHON 3.6.3"))
					sel=7;			
				else if(langselect.equals("RUBY 2.2.3"))
					sel=8;			
				else if(langselect.equals("PERL"))
					sel=9;			
				
		
	//	RequestDispatcher dispatcher=request.getRequestDispatcher("IdeJsp.jsp");
String output=ide.compilerOperation(programs,sel,inputs,command);
System.out.println();
//request.setAttribute("program",programs.trim());
//request.setAttribute("output",output);
//System.out.println(programs.trim());
//request.setAttribute("input",inputfile);
//request.setAttribute("langselect",langselect);
//dispatcher.forward(request,response);	
//response.sendRedirect("/demo/IdeJsp.jsp");
response.getWriter().write(output);
	}
	}
