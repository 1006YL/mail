package dao;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
			import java.sql.ResultSet;
			import java.util.ArrayList;
			import java.util.List;
			import utill.sqlutill;
			import bean.orders;
			import bean.shoptaker;
			
import javax.servlet.ServletContext;
			import javax.servlet.ServletException;
			import javax.servlet.http.HttpServlet;
			import javax.servlet.http.HttpSession;
			import javax.servlet.http.HttpServletRequest;
			import javax.servlet.http.HttpServletResponse;
import java.sql.*;
			public class findserver extends HttpServlet {
			    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			         try { 
			        	 System.out.print("1111111111");
			        	 	Connection conn=sqlutill.getConn();
			        	 	ServletContext application=this.getServletContext();
			        	 	HttpSession session=req.getSession();
			        	 	shoptaker shoptaker=(shoptaker)session.getAttribute("shoptaker");
			        	 	int shopid=shoptaker.getShopid();
			        	 	System.out.print(shopid);
			              String sql="select * from orders where shopid="+shopid;
			              Statement st=(Statement) conn.createStatement();
			              ResultSet resultSet = st.executeQuery(sql);
			              System.out.print("aaaaaaaa");
			              List<orders> orderes = new ArrayList<orders>(); 
			              while(resultSet.next()) {
			            	  orders orders=new orders();
			            	  orders.setUserid(resultSet.getString("userid"));
			            	  orders.setGoodid(resultSet.getInt("goodid"));
			            	  orders.setShopid(resultSet.getInt("Shopid"));
			            	  orders.setQuantity(resultSet.getInt("quantity"));
			            	  orders.setMoney(resultSet.getFloat("money"));
			            	  orderes.add(orders);
			            	  System.out.print(orders.toString());
			              }
			              session.setAttribute("orderes", orderes);
			              resultSet.close();
			              st.close();
			              System.out.print("ccccc");
			              }catch (Exception e) {
			                  e.printStackTrace();
			        }
			         req.getRequestDispatcher("../ordersshow.jsp").forward(req, resp);
			          }
			    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			        super.doGet(req, resp);
			    }
			}
