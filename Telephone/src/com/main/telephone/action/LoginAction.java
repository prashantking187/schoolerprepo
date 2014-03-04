package com.main.telephone.action;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import com.main.telephone.DTO.UserInfoBean;
import com.main.telephone.util.PhoneUtil;
import java.sql.Timestamp;

import java.sql.PreparedStatement;

public class LoginAction extends HttpServlet{

	
	@Resource(name="jdbc/phonedb")
	private static DataSource ds;
	private String userAlert="";
	

	public String getUserAlert() {
		return userAlert;
	}


	public void setUserAlert(String userAlert) {
		this.userAlert = userAlert;
	}


	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		Statement st=null;
		String userName=req.getParameter("username");
		String password=req.getParameter("password");
		   int count=0;
		   boolean LOGIN_SUCCESS=false;
		   RequestDispatcher dispatch=null;
		   String forwardString="/";
		//hashin the password and comparing 


		 
			try {
			
				StringBuffer sb=PhoneUtil.addMD5(password);

		    //System.out.println("Digest(in hex format):: " + sb.toString());
		    
				Connection conn=ds.getConnection();
				String query="select * from user_inf where username =?";
				PreparedStatement  st1=conn.prepareStatement(query);
				st1.setString(1, userName);
			    ResultSet rs= st1.executeQuery();
			    

				
		    while (rs.next()){
		    	count++;
		    String  ex_pass=	rs.getString("password");
		    if(ex_pass.equalsIgnoreCase(sb.toString())){
		    	LOGIN_SUCCESS=true;
		    	UserInfoBean objUserInfoBean=new UserInfoBean();
		    	objUserInfoBean.setUser_id(rs.getInt("user_id"));
		    	objUserInfoBean.setUsername(rs.getString("username"));
		    	
		    	int role=rs.getInt("role");
		    	objUserInfoBean.setRole(role);
		    	
		    	req.getSession().setAttribute("userInfo", objUserInfoBean);
		    	saveUserInfo(req, resp ,objUserInfoBean);
		    	if(role == 0)
		    		forwardString="/Login.jsp";
		    	else if(role ==1)
		    		forwardString ="/CreateUser.jsp";
		    	else if (role ==2)
		    		forwardString ="/TelephoneTrack.jsp";
		    	
		    }
		    else{
		    	forwardString ="/Login.jsp";
		    	setUserAlert("3~Invalid UserName/Password!!!");
		    }
		    
		    }
		    
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			 catch (SQLException e) {
					// TODO Auto-generated catch block
				 setUserAlert("1~Oops!!Something has gone wrong.Please try again!!");
				 forwardString ="/Login.jsp";
					e.printStackTrace();
				}
			
				if(!getUserAlert().isEmpty())
				 req.setAttribute("userAlert", getUserAlert());
				 dispatch=getServletContext().getRequestDispatcher(forwardString);
				 dispatch.forward(req, resp);
	}
	
	public static void saveUserInfo(HttpServletRequest req, HttpServletResponse resp,UserInfoBean objUserInfoBean) throws SQLException{
		
		Connection conn=ds.getConnection();
		String query="insert into login_info values(?,?)";
		PreparedStatement  st1=conn.prepareStatement(query);
		st1.setInt(1, objUserInfoBean.getUser_id());
		java.util.Date date= new java.util.Date();
		st1.setTimestamp(2,new Timestamp(date.getTime()));
		st1.execute();
		conn.close();
	}
	
}
