package com.main.telephone.action;

import java.io.IOException;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

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
							                        		 
							                        	 
							                        	}
							                        	else
							                        		{
							                        			
							                        			int cellCount=0;
							                        			//Iterator<Cell> rowData.cellIterator();
							                        			
							                        			
							                        			
							                        		}
							                        	 rowCount++;
							                         }
						 
						                     }
					                    	 else
					                    		 throw new InvalidFormattException("The file uploaded is not in xls or xlsx format.!!");
						                     }
					                 }
			} catch (FileUploadException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			catch(InvalidFormattException e){
				
				
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
	class InvalidFormattException extends Exception{
		
		public InvalidFormattException(String message) {
			// TODO Auto-generated constructor stub
		
			super(message);
		}
	}
		
	}
