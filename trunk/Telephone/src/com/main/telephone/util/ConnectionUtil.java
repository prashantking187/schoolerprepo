package com.main.telephone.util;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.Properties;

import javax.naming.InitialContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.sun.org.glassfish.external.statistics.annotations.Reset;

/**
 * Servlet implementation class ConnectionUtil
 */
@WebServlet("/ConnectionUtil")
public class ConnectionUtil extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ConnectionUtil() {
        super();
        // TODO Auto-generated constructor stub
    }

    @Override
    public void init() throws ServletException {
    	// TODO Auto-generated method stub
    //	super.init();
    	try{
    	Properties prop=new Properties();
    	prop.load(new FileInputStream("config.properties"));
    	InitialContext contxt=new InitialContext();
    	/*@Resour
    	DataSource ds=new  
    	contxt.bind(name, obj);*/
    	}
    	catch(Exception e){
    		
    		e.printStackTrace();
    	}
    }
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

}
