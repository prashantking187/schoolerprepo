package com.main.telephone.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.lang.reflect.Array;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

import com.main.telephone.util.PhoneUtil;

public class TelephoneMain extends HttpServlet  {

	
	private JSONArray markers;
	private int reqCount=0;

    public JSONArray getMarkers() {
		return markers;
	}

	public void setMarkers(JSONArray markers) {
		this.markers = markers;
		
		
	}

	private String _;
	private String init;
	@Resource(name="jdbc/phonedb")
	private DataSource ds;

	public JSONArray fetchMarker(int markerid) throws SQLException{
		
			Connection conn=null;
			PreparedStatement stmt=null;
			ResultSet rs=null;

			conn=ds.getConnection();
			String Query="Select * from cabinet_inf where booth_id=?";
			stmt=conn.prepareStatement(Query);
			stmt.setInt(1,markerid);
			rs= stmt.executeQuery();
			JSONArray objarray=new JSONArray();
	
	 while (rs.next()) {

			 int id  = rs.getInt("booth_id");
	         String boothname  = rs.getString("booth_name");
	         Double lat = rs.getDouble("lat");
	         Double lng = rs.getDouble("lng");
	         String status = rs.getString("status");
	         String smoke_stat = rs.getString("smoke_stat");
	         String flood_stat = rs.getString("flood_stat");
	         String humidity = rs.getString("humidity");
	         String door_status = rs.getString("door_stat");
	         String location_name = rs.getString("location_name");
	         JSONObject objJson=new JSONObject();
	 		
	     	
	 	    objJson.accumulate("boothid", id);
	 	    objJson.accumulate("boothname",boothname);
	 	    objJson.accumulate("lat", lat);
	 	    objJson.accumulate("lng", lng);
	 	    objJson.accumulate("status", status);
	 	    objJson.accumulate("smoke_status", smoke_stat);
	 	    objJson.accumulate("flood_status", flood_stat);
	 	    objJson.accumulate("humidity", humidity);
	 	   objJson.accumulate("door_status", door_status);
	 	  objJson.accumulate("location_name", location_name);
	 	   

	 	    objarray.add(objJson);
		}
		 
		return objarray;
		
		
	}
	
	public void deleteMarker(HttpServletRequest req, HttpServletResponse resp) throws Exception{
		
		Connection conn=null;
		PreparedStatement stmt=null;
		ResultSet rs=null;
		boolean stat=true;
		
if(req.getParameter("markerInfo")!=null && !"".equalsIgnoreCase(req.getParameter("markers"))){
			
			conn=ds.getConnection();
			String[] markers=req.getParameter("markerInfo").split("~");
			PrintWriter outPrintWriter=resp.getWriter();
			for(String marker:markers){
				try{
				String Query="delete from cabinet_inf where booth_id=?";
				stmt=conn.prepareStatement(Query);				
				//markerId=req.getParameter("locationName");
				stmt.setInt(1,new Integer(marker));
				stmt.execute();
				}
				catch(Exception e){				
					stat=false;
				}
			
		}
			if(stat==false){
				
				outPrintWriter.append("204~Oops!!Something went wrong .Please try again!!");
				outPrintWriter.flush();
			}
			else{
			outPrintWriter.append("200~Cabinet(s) deleted successfully!!");
			outPrintWriter.flush();
			}
		}
	}
	public String chkBooths(HttpSession session) throws Exception {
		
		//driver
		Connection conn=null;
		Statement stmt=null;
		ResultSet rs=null;
		// JDBC driver name and database URL
		 /*String JDBC_DRIVER = "com.mysql.jdbc.Driver";  
		 String DB_URL = "jdbc:mysql://localhost:3306/school";
		 Class.forName("com.mysql.jdbc.Driver");
		
		  conn =  DriverManager.getConnection(DB_URL,"sarath","admin");*/
		conn=ds.getConnection();
		  
		  stmt=conn.createStatement();
		  String Query="Select * from cabinet_inf";
		 rs= stmt.executeQuery(Query);
		 JSONArray objarray=new JSONArray();
		 while (rs.next()) {

	         int id  = rs.getInt("booth_id");
	         String boothname  = rs.getString("booth_name");
	         Double lat = rs.getDouble("lat");
	         Double lng = rs.getDouble("lng");
	         String status = rs.getString("status");
	         String smoke_stat = rs.getString("smoke_stat");
	         String flood_stat = rs.getString("flood_stat");
	         String humidity = rs.getString("humidity");
	         String door_status = rs.getString("door_stat");
	         String location_name = rs.getString("location_name");
	         JSONObject objJson=new JSONObject();
	 		
	     	
	 	    objJson.accumulate("boothid", id);
	 	    objJson.accumulate("boothname",boothname);
	 	    objJson.accumulate("lat", lat);
	 	    objJson.accumulate("lng", lng);
	 	    objJson.accumulate("status", status);
	 	    objJson.accumulate("smoke_status", smoke_stat);
	 	    objJson.accumulate("flood_status", flood_stat);
	 	    objJson.accumulate("humidity", humidity);
	 	   objJson.accumulate("door_status", door_status);
	 	  objJson.accumulate("location_name", location_name);
	 	  
	 	 
	 	    
	 	 
	 	    objarray.add(objJson);
		}
		
		
		
		
	/*	SessionFactory sessionFactory = HibernateUtil.getSessionFactory();
    	 Session session=	sessionFactory.getCurrentSession();
		 Transaction tx=session.beginTransaction();
		 
		Query q=session.createQuery("from TelephoneInf").setCacheable(false);
		
		List<TelephoneInf> results=q.list();

		JSONArray objarray=new JSONArray();
		for(TelephoneInf teleinfo:results){
		JSONObject objJson=new JSONObject();
		
	
	    objJson.accumulate("boothid", teleinfo.getBoothId());
	    objJson.accumulate("lat", teleinfo.getLat().toString());
	    objJson.accumulate("lng", teleinfo.getLng().toString());
	    objJson.accumulate("status", teleinfo.getStatus());
	 
	    objarray.add(objJson);
	    
	    

	}
		setMarkers(objarray);
		session.evict(TelephoneInf.class);
		session.flush();
		session.clear();
		session.getTransaction().commit();
*/
		 setMarkers(objarray);
		// session.setAttribute("markerVal", getMarkers());
		 conn.close();
        return "success";
    }
	
	public boolean chkExisting(HttpSession session){
		
		JSONArray markerArray=null;
		JSONArray changedArray=new JSONArray();
		if(session.getAttribute("markerVal")!=null){
			markerArray=(JSONArray)session.getAttribute("markerVal");
				
			int changedCount=0;
			for(Object dataobj:markerArray){
				
			JSONObject jsonobj=	(JSONObject)dataobj;
		
			if(!markers.contains(jsonobj)){
				
				for(Object objdata:markers){
					
					JSONObject jsonobj1=	(JSONObject)objdata;
					
					if(jsonobj1.getInt("boothid")==jsonobj.getInt("boothid")){
				//System.out.println("changed id==============>"+jsonobj.getInt("boothid"));
				changedArray.add(jsonobj1);	
				changedCount++;
					}
				}
			}
		
			
			//System.out.println("asdasd");
				
			}
			
			if(changedCount>0)
				session.setAttribute("markerVal", markers); 	
				setMarkers(changedArray);	
			
		}
		else
			session.setAttribute("markerVal", markers);
			
		
		
		return false;
		
		
		
	}
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method 
		//System.out.println("setting charc encoding1");
		resp.setCharacterEncoding("utf-8");
		resp.setContentType("text/event-stream");
		resp.setHeader("Cache-Control", "no-cache");
		
		HttpSession session=req.getSession();
		
		
		try {
			chkBooths(session);//retrieving data from the cabinet_inf table
			if(req.getParameter("firstCall")==null)
			chkExisting(session);//comparing the data with session data and updating markers if necessary
	
	
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		if(markers.isEmpty())
			return;
		else{
		String json= 
		getMarkers().toString();
		PrintWriter pw=resp.getWriter();
		if(req.getParameter("firstCall")!=null && !req.getParameter("firstCall").equals("") && req.getParameter("firstCall").equalsIgnoreCase("yes"))
			pw.write(json);
		else
		pw.write("data:"+  json +"\n\n");
		pw.close();
		reqCount++;
		}
	}
public void addMarker(HttpServletRequest req, HttpServletResponse resp) throws SQLException, IOException{
	
	Connection conn=ds.getConnection();
	
	String boothname="";
	
	String lat="";
	
	String lng="";
	
	String status="N";
	
	String locationName="Default";
	if(req.getParameter("markername")!=null && !"".equalsIgnoreCase(req.getParameter("markername")))
		boothname=req.getParameter("markername");
	if(req.getParameter("lat")!=null && !"".equalsIgnoreCase(req.getParameter("lat")))
		lat=req.getParameter("lat");
	if(req.getParameter("lng")!=null && !"".equalsIgnoreCase(req.getParameter("lng")))
		lng=req.getParameter("lng");
	if(req.getParameter("locationName")!=null && !"".equalsIgnoreCase(req.getParameter("locationName")))
		locationName=req.getParameter("locationName");
	
	
	String query="insert into cabinet_inf values(?,?,?,?,?,?,?,?,?,?,?)";
	
	PreparedStatement stmt=conn.prepareStatement(query,Statement.RETURN_GENERATED_KEYS);
	String defaultStat="N";
	stmt.setNull(1,Types.INTEGER);
	stmt.setString(2, boothname);
	stmt.setInt(3, 0);
	stmt.setDouble(4, Double.valueOf(lat));
	stmt.setDouble(5, Double.valueOf(lng));
	stmt.setString(6, status);
	stmt.setString(7, defaultStat);
	stmt.setString(8, defaultStat);
	stmt.setFloat(9, new Float(0.0));
	stmt.setString(10, defaultStat);
	stmt.setString(11, locationName);

	int result=stmt.executeUpdate();
	
	
	
	PrintWriter outPrintWriter=resp.getWriter();
	String parentPage="";
	if(req.getParameter("parentPage")!=null && !"".equalsIgnoreCase(req.getParameter("parentPage")))
		parentPage=req.getParameter("parentPage");
	if(parentPage.equalsIgnoreCase("telephoneTracker"))
	{
		if(result==1)
		{
			
			ResultSet rs=stmt.getGeneratedKeys();
			while(rs.next()){
			int booth_id=rs.getInt(1);
			
			JSONArray objjsonArray=fetchMarker(booth_id);
			outPrintWriter.append(objjsonArray.toString()+"~"+"200~Marker Added Successfully");
			outPrintWriter.flush();
			}
		}
	
		
	}
	else{
	outPrintWriter.append("200~Marker Added Successfully");
	
	outPrintWriter.flush();
	}
	
	conn.close();
}
public void addUser(HttpServletRequest req, HttpServletResponse resp) throws NoSuchAlgorithmException, SQLException, IOException{
	
	String username="";
	
	String password="";
	
	Connection conn=ds.getConnection();
	int role=0;
	
	if(req.getParameter("username")!=null && !"".equalsIgnoreCase(req.getParameter("username")))
			username=req.getParameter("username");
	if(req.getParameter("password")!=null && !"".equalsIgnoreCase(req.getParameter("password")))
		password=req.getParameter("password");
	if(req.getParameter("role")!=null && !"".equalsIgnoreCase(req.getParameter("role")))
		role=Integer.valueOf(req.getParameter("role"));
	
	StringBuffer sb=PhoneUtil.addMD5(password);
	
String query="insert into user_inf values(?,?,?,?)";
	
	PreparedStatement stmt=conn.prepareStatement(query);
	stmt.setNull(1,Types.INTEGER);
	stmt.setString(2, username);
	stmt.setString(3, sb.toString());
	stmt.setInt(4, role);

	stmt.execute();
	

	PrintWriter outPrintWriter=resp.getWriter();
	outPrintWriter.append("200~User Added Successfully");
	outPrintWriter.flush();

	conn.close();
}
@Override
protected void doGet(HttpServletRequest req, HttpServletResponse resp)
		throws ServletException, IOException {
	// TODO Auto-generated method stub
	if(req.getParameter("method")!=null)
	{
		try {
		if(req.getParameter("method").equals("addMarker"))
				addMarker(req,resp);
		if(req.getParameter("method").equals("delMarker"))
			deleteMarker(req,resp);
		
		else if(req.getParameter("method").equals("addUser"))
				addUser(req,resp);
		else if(req.getParameter("method").equals("logoff"))
				{
				req.getSession().invalidate();
				req.setAttribute("userAlert", "1~Successfully logged off!!");
				RequestDispatcher dispatch=req.getRequestDispatcher("/Login.jsp");
				dispatch.forward(req, resp);
			
				}
			} catch (Exception e) {
				// TODO Auto-generated catch block
				PrintWriter outPrintWriter=resp.getWriter();
				outPrintWriter.append("204~Oops!!Something went wrong .Please try again!!");
				outPrintWriter.flush();
				e.printStackTrace();
			} 
		return;
	}
		
	doPost(req,resp);
}
public String get_() {
	return _;
}

public void set_(String _) {
	this._ = _;
}

public String getInit() {
	return init;
}

public void setInit(String init) {
	this.init = init;
}

public int getReqCount() {
	return reqCount;
}

public void setReqCount(int reqCount) {
	this.reqCount = reqCount;
}

}