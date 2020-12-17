package dao;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
			import java.sql.ResultSet;
			import java.util.ArrayList;
			import java.util.List;
			import utill.sqlutill;
			import bean.user;
			import bean.shoptaker;
			import bean.good;
			import javax.servlet.ServletException;
			import javax.servlet.http.HttpServlet;
			import javax.servlet.http.HttpServletRequest;
			import javax.servlet.http.HttpServletResponse;
import java.sql.*;
	
			public class managerfindserver extends HttpServlet {
			    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			         try { 

			        	  Connection conn=sqlutill.getConn();
			              String sql1="select * from user";
			              String sql2="select * from shoptaker";
			              String sql3="select * from good";
			              Statement st1=(Statement) conn.createStatement();
			              Statement st2=(Statement) conn.createStatement();
			              Statement st3=(Statement) conn.createStatement();
			              ResultSet resultSet1 = st1.executeQuery(sql1);
			              ResultSet resultSet2 = st2.executeQuery(sql2);
			              ResultSet resultSet3 = st3.executeQuery(sql3);
			              List<user> list1 = new ArrayList<user>(); 
			              List<shoptaker> list2 = new ArrayList<shoptaker>(); 
			              List<good> list3 = new ArrayList<good>(); 
			              while(resultSet1.next()) {
			            	 
			            	  user user=new user();
			            	  user.setAccount(resultSet1.getString("account"));
			            	  user.setName(resultSet1.getString("name"));
			            	  user.setSex(resultSet1.getString("sex"));
			            	  user.setAddress(resultSet1.getString("address"));
			            	  user.setPhone(resultSet1.getInt("phone"));
			            	  user.setEmail(resultSet1.getString("email"));
			                  
			                  list1.add(user);
			              }
			              while(resultSet2.next()) {
			            	  System.out.print("lo2");
			            	  shoptaker shoptaker=new shoptaker();
			            	  shoptaker.setAccount(resultSet2.getString("account"));
			            	  shoptaker.setName(resultSet2.getString("name"));
			            	  shoptaker.setSex(resultSet2.getString("sex"));
			            	  shoptaker.setAddress(resultSet2.getString("address"));
			            	  shoptaker.setPhone(resultSet2.getInt("phone"));
			            	  shoptaker.setEmail(resultSet2.getString("email"));
			            	  shoptaker.setShopid(resultSet2.getInt("shopid"));
			            	  
			                  
			                  list2.add(shoptaker);
			              }
			              while(resultSet3.next()) {
			            	  System.out.print("lo3");
			            	  good good=new good();
			            	  good.setId(resultSet3.getInt("id"));
			            	  good.setName(resultSet3.getString("name"));
			            	  good.setQuantity(resultSet3.getInt("quantity"));
			            	  good.setPrice(resultSet3.getFloat("price"));
			            	  good.setIntrodution1(resultSet3.getString("introdution1"));
			            	  good.setPath(resultSet3.getString("path"));
			            	  good.setShopid(resultSet3.getInt("shopid"));
			            	  
			            	  System.out.print("lo3ok");
			                  list3.add(good);
			              }
			              req.setAttribute("list1", list1);
			              req.setAttribute("list2", list2);
			              req.setAttribute("list3", list3);
			              resultSet3.close();
			              resultSet2.close();
			              resultSet1.close();
			              st1.close();
			              st2.close();
			              st3.close();
			              }catch (Exception e) {
			                  e.printStackTrace();
			        }
			         req.getRequestDispatcher("../diagram.jsp").forward(req, resp);
			          }
			    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			        super.doGet(req, resp);
			    }
			}
