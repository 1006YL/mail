package controller;

import java.io.IOException;

import utill.sqlutill;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletContext;
import java.sql.*;
import java.util.ArrayList;

import bean.user;
import bean.shoptaker;
import bean.manager;
	public class loginservlet extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    	
	    	HttpSession session=request.getSession();
	    	ServletContext application=this.getServletContext();
	        String account = request.getParameter("account");
	        String password = request.getParameter("password");
	        System.out.print(account);
	        try {
	            	Connection conn=sqlutill.getConn();
	                String sql1="select * from user where account=? and password=?";
	                String sql2="select * from shoptaker where account=? and password=?";
	                String sql3="select account from manager where account=? and password=?";
	                user user=new user();
	                shoptaker shoptaker=new shoptaker();
	                manager manager=new manager();
	                System.out.print("22222");
	                PreparedStatement ps1=(PreparedStatement) conn.prepareStatement(sql1);
	                PreparedStatement ps2=(PreparedStatement) conn.prepareStatement(sql2);
	                PreparedStatement ps3=(PreparedStatement) conn.prepareStatement(sql3);
	                ps1.setString(1,account);
	                ps1.setString(2, password);
	                ps2.setString(1,account);
	                ps2.setString(2, password);
	                ps3.setString(1,account);
	                ps3.setString(2,password);
	                ResultSet resultSet1 = ps1.executeQuery();
	                ResultSet resultSet2 = ps2.executeQuery();
	                ResultSet resultSet3 = ps3.executeQuery();
	                System.out.print(account);
	                if(resultSet1.next())
	                {
	                	System.out.print("555");
	                	if(resultSet1.getInt("account")!=0)
	                	{
	                	
	                	System.out.print("3333333333");
	                	session.setAttribute("account",account);
	                	user.setAccount(account);
	                	user.setName(resultSet1.getString("name"));
	                	user.setSex(resultSet1.getString("sex"));
	                	user.setAddress(resultSet1.getString("address"));
	                	user.setPhone(resultSet1.getFloat("phone"));
	                	user.setEmail(resultSet1.getString("email"));
	                	user.setPassword(password);
	                	session.setAttribute("user",user);
	                	System.out.print("44444444");
	                	ArrayList users=(ArrayList)application.getAttribute("users");
	                	ArrayList msgs=(ArrayList)application.getAttribute("msgs");
	                	if(users==null){
	                		users=new ArrayList();
	                		msgs=new ArrayList();
	                	}
               		 	users.add(user);
               		 	msgs.add(user.getAccount()+user.getName()+"上线啦");
               		 	application.setAttribute("msgs",msgs);
               		 	application.setAttribute("users",users);
               		 	System.out.print(msgs.get(0));
               		 	request.getRequestDispatcher("../logined.jsp").forward(request, response);
		            	}
	                }
		            else if(resultSet2.next())
		            {
		            	
	                	System.out.print("3333333333");
	                	session.setAttribute("account",account);
	                	shoptaker.setAccount(account);
	                	shoptaker.setName(resultSet2.getString("name"));
	                	shoptaker.setPassword(password);
	                	shoptaker.setSex(resultSet2.getString("sex"));
	                	shoptaker.setAddress(resultSet2.getString("address"));
	                	shoptaker.setPhone(resultSet2.getFloat("phone"));
	                	shoptaker.setEmail(resultSet2.getString("email"));
	                	shoptaker.setShopid(resultSet2.getInt("shopid"));
	                	
	                	session.setAttribute("shoptaker",shoptaker);
	                	
	                	session.setAttribute("shopid",resultSet2.getInt("shopid"));
	                	System.out.print("44444444");
	                	ArrayList shoptakers=(ArrayList)application.getAttribute("shoptakers");
	                	ArrayList msgs=(ArrayList)application.getAttribute("msgs");
	                	if(shoptakers==null){
	                		shoptakers=new ArrayList();
	                		msgs=new ArrayList();
	                	}
	                	shoptakers.add(shoptaker);
               		 	msgs.add(shoptaker.getAccount()+shoptaker.getName()+"上线啦");
               		 	application.setAttribute("msgs",msgs);
               		 	application.setAttribute("shoptakers",shoptakers);
               
               		 	System.out.print(msgs.get(0));
               		 	request.getRequestDispatcher("../logined.jsp").forward(request, response);
	            		
		            	
		           }
		            else if(resultSet3.next())
		            {
		               	System.out.print("m3333333333");
	                	session.setAttribute("account",account);
	                	manager.setAccount(account);
	                	manager.setPassword(password);
	                	session.setAttribute("manager",manager);
	                	System.out.print("m44444444");
               		 	request.getRequestDispatcher("managerfindserver").forward(request, response);
		            }
		            else{
		            	request.getRequestDispatcher("../index.jsp").forward(request, response);
		            }
	                ps1.close();
	                ps2.close();
	                conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }

	    }
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        this.doPost(request, response);
	    }

	}
