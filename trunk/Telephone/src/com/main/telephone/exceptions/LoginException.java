package com.main.telephone.exceptions;

public class LoginException extends Exception {

	public LoginException( Exception e) {
		// TODO Auto-generated constructor stub
		super(e.getMessage());
	}
}
