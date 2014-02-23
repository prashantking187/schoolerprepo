package com.main.telephone.util;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Properties;

public class PhoneUtil {


	
	public static StringBuffer addMD5( String x) throws NoSuchAlgorithmException  {
		
		
		 MessageDigest md;
		 
			
				md = MessageDigest.getInstance("MD5");
			
		    md.update(x.getBytes());

		    byte byteData[] = md.digest();

		    StringBuffer sb = new StringBuffer();
		    for (int i = 0; i < byteData.length; i++)
		        sb.append(Integer.toString((byteData[i] & 0xff) + 0x100, 16).substring(1));

		    return sb;
	}
}
