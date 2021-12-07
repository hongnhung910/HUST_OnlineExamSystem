/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package utils;

import db_objects.Student;
import db_objects.Teacher;
import java.sql.*;
import javax.servlet.*;
import javax.servlet.http.*;


/**
 *
 * @author hongn
 */
public class MyUtils {
    public static final String ATT_NAME_CONNECTION = "ATTRIBUTE_FOR_CONNECTION";

	private static final String ATT_NAME_USER_NAME = "ATTRIBUTE_FOR_STORE_USER_NAME_IN_COOKIE";

	// Store Connection in request attribute.
	// (Information stored only exist during requests)
	public static void storeConnection(ServletRequest request, Connection conn) {
		request.setAttribute(ATT_NAME_CONNECTION, conn);
	}

	// Get the Connection object has been stored in attribute of the request.
	public static Connection getStoredConnection(ServletRequest request) {
		Connection conn = (Connection) request.getAttribute(ATT_NAME_CONNECTION);
		return conn;
	}

	// Store user info in Session.
	public static void storeLoginedUser(HttpSession session, Student loginedUser) {
		// On the JSP can access via ${loginedUser}
		session.setAttribute("loginedUser", loginedUser);
	}
        
        public static void storeLoginedUser(HttpSession session, Teacher loginedUser) {
		// On the JSP can access via ${loginedUser}
		session.setAttribute("loginedUser", loginedUser);
	}

	// Get the user information stored in the session.
	public static Student getLoginedUser(HttpSession session) {
		Student loginedUser = (Student) session.getAttribute("loginedUser");
		return loginedUser;
	}

	// Store info in Cookie
	public static void storeUserCookie(HttpServletResponse response, Student user) {
		System.out.println("Store user cookie");
		Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, user.getStd_email());
		// 1 day (Converted to seconds)
		cookieUserName.setMaxAge(24 * 60 * 60);
		response.addCookie(cookieUserName);
	}

	public static String getUserNameInCookie(HttpServletRequest request) {
		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (ATT_NAME_USER_NAME.equals(cookie.getName())) {
					return cookie.getValue();
				}
			}
		}
		return null;
	}

	// Delete cookie.
	public static void deleteUserCookie(HttpServletResponse response) {
		Cookie cookieUserName = new Cookie(ATT_NAME_USER_NAME, null);
		// 0 seconds (This cookie will expire immediately)
		cookieUserName.setMaxAge(0);
		response.addCookie(cookieUserName);
	}
    
}
