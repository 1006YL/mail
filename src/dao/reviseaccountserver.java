package dao;

import java.io.IOException;
import utill.sqlutill;
import java.io.File;
import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import com.jspsmart.upload.*;

import bean.shoptaker;
import bean.user;
import java.sql.*;

	public class reviseaccountserver extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			ServletConfig config=this.getServletConfig();
			ServletContext application=this.getServletContext();
	    	HttpSession session=request.getSession();
	    	System.out.println("tetok");
	    	String account=request.getParameter("account");
	    	String password=request.getParameter("password");
	    	String address=request.getParameter("address");
	        String name = request.getParameter("name");
	        float phone = Float.parseFloat(request.getParameter("phone"));
	        String email = request.getParameter("email");
	        System.out.println(email);
	        System.out.println(name);
	        if(session.getAttribute("shopid")!=null)
	        {	int strshopid=(Integer)session.getAttribute("shopid");
	        	String account1=(String)session.getAttribute("account");
	        	System.out.println(account1);
	        	int shopid=strshopid;
	        	try {
	        		System.out.println("shopok");
	            	Connection conn=sqlutill.getConn();
	                String sql="update shoptaker set account=?,name=?,password=?,address=?,phone=?,email=?,shopid=? where account=?";
	                PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
	                ps.setString(1, account);
	                ps.setString(2, name);
	                ps.setString(3, address);
	                ps.setString(4, password);
	                ps.setFloat(5, phone);
	                ps.setString(6, email);
	                ps.setInt(7, shopid);
	                ps.setString(8, account1);
	                ps.executeUpdate();
	                ps.close();
	                conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        	}
	        else
	        {
		        try {
		        	String account1=(String)session.getAttribute("account");
		        	System.out.println(account1);
		        	System.out.println("userok");
	            	Connection conn=sqlutill.getConn();
	                String sql="update user set account=?,name=?,address=?,password=?,phone=?,email=? where account=?";
	                PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
	                ps.setString(1,account);
	                ps.setString(2,name);
	                ps.setString(3,address);
	                ps.setString(4,password);
	                ps.setFloat(5,phone);
	                ps.setString(6,email);
	                ps.setString(7,account1);
	                System.out.println(ps);
	                ps.executeUpdate();
	                ps.close();
	                conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        }
	        
	        System.out.println("update  success");
	        if(session.getAttribute("manager")==null||session.getAttribute("manager")=="")
	        {
	        		response.sendRedirect("../mainpage.jsp");
	        	
	        }
	        else
	        {
	        	response.sendRedirect("managerfindserver");
	        }
	    }
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doPost(request, response);
	    }

	}
