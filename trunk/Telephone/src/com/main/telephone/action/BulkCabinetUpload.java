package com.main.telephone.action;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Types;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

public class BulkCabinetUpload extends HttpServlet  {
	
	public static final String DEFAULT_HEADERS="CabinetID,LocationName,Lat,Lng";
	private static int cellCount;
	@Resource(name="jdbc/phonedb")
	private static DataSource ds;
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
	
		if(ServletFileUpload.isMultipartContent(req))
		{
		
			 List<FileItem> multiparts = null;
			try {
				multiparts = new ServletFileUpload(new DiskFileItemFactory()).parseRequest(req);
				 
					                
					 
					                 for(FileItem item : multiparts){
					 
					                     if(!item.isFormField()){
					 
					                    	 if(item.getName().endsWith(".xls") || item.getName().endsWith(".xlsx"))
					                    		{
						                         XSSFWorkbook objxssfWorkbook=new XSSFWorkbook(item.getInputStream());
						                         XSSFSheet objxssfsheet=  objxssfWorkbook.getSheetAt(0);
						                         Iterator<Row> rowIterator= objxssfsheet.iterator();
						                       
							                      int rowCount=0;
							                         while(rowIterator.hasNext())
							                         {
							                        	 
							                        	 Row rowData=rowIterator.next();
							                        	if(rowCount==0){
							                        		 if(!validateHeaderFormat(rowData))
							                        			 throw new InvalidFormattException("The file uploaded is not in valid format.!!");
							                        	
							                        			} else
															try {
																insertRowAsCabinet(rowData);
															} catch (SQLException e) {
																// TODO Auto-generated catch block
																
																req.setAttribute("userAlertBulk", "204~Error occured while inserting cabinets.Check data and try again.!!");
																RequestDispatcher dispatch=req.getRequestDispatcher("/CreateUser.jsp");
																dispatch.forward(req, resp);
															}
							                        			
							                        		
							                        	 rowCount++;
							                         }
							                         req.setAttribute("userAlertBulk", "200~Successfully uploaded all cabinets.");
							                         RequestDispatcher dispatch=req.getRequestDispatcher("/CreateUser.jsp");
							                         dispatch.forward(req, resp);
						 
						                     }
					                    	 else{
					                    		 req.setAttribute("userAlertBulk", "204~File Uploaded is not in valid format.");
						                         RequestDispatcher dispatch=req.getRequestDispatcher("/CreateUser.jsp");
						                         dispatch.forward(req, resp);
					                    	 }
						                     }
					                 }
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				 req.setAttribute("userAlertBulk", "204~Error occured while inserting cabinets.Check data and try again.!!");
                 RequestDispatcher dispatch=req.getRequestDispatcher("/CreateUser.jsp");
                 dispatch.forward(req, resp);
			}
			
				

		}
		
	}
	public static boolean validateHeaderFormat(Row rowData){
		
		boolean stat=true;
		Iterator<Cell> cellIterator= rowData.cellIterator();
    	while(cellIterator.hasNext()){
		    	Cell cell=cellIterator.next();
		    	String cellvalue=cell.getStringCellValue();
		    	String[] listHeader=DEFAULT_HEADERS.split(",");
		    	List<String> headerList=Arrays.asList(listHeader);
		    	if(!headerList.contains(cellvalue))
		    		stat=false;
	    	}
		return	stat;
	}
	public static boolean insertRowAsCabinet(Row rowData) throws SQLException{
		
		int cellCount=0;
		
		Iterator<Cell> celldata=rowData.cellIterator();
		String[] markerinfo=new String[4];
		while(celldata.hasNext()){
			
			Cell cell=celldata.next();
			
			switch (cellCount) {
			case 0:
				markerinfo[0]=Double.toString(cell.getNumericCellValue());	
				cellCount++;
				break;
			case 1:
				markerinfo[1]=cell.getStringCellValue();
				cellCount++;
				break;
			case 2:
				markerinfo[2]=Double.toString(cell.getNumericCellValue());	
				cellCount++;
				break;
			case 3:
				markerinfo[3]=Double.toString(cell.getNumericCellValue());	
				cellCount++;
				break;

			default:
				break;
			}
		}
		
		addMarker(markerinfo);
		return false;
	}
	public static void addMarker(String[] markerinfo) throws SQLException{
		Connection conn=ds.getConnection();
			
			String boothname=markerinfo[0];
			
			String lat=markerinfo[2];
			
			String lng=markerinfo[3];
			
			String status="N";
			
			String locationName=markerinfo[1];
			
			
			String query="insert into cabinet_inf values(?,?,?,?,?,?,?,?,?,?,?)";
			
			PreparedStatement stmt=conn.prepareStatement(query);
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
			conn.close();
			
			
		}
	class InvalidFormattException extends Exception{
		
		public InvalidFormattException(String message) {
			// TODO Auto-generated constructor stub
		
			super(message);
		}
	}
		
	}
