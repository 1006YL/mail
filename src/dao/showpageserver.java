package dao;

import java.io.IOException;
import java.io.PrintWriter;

import java.sql.Connection;
import java.sql.DriverManager;
			import java.sql.ResultSet;
			import java.util.ArrayList;
			import java.util.List;
			import utill.sqlutill;
			import bean.good;
			
import javax.servlet.ServletContext;
			import javax.servlet.ServletException;
			import javax.servlet.http.HttpServlet;
			import javax.servlet.http.HttpServletRequest;
			import javax.servlet.http.HttpServletResponse;
import java.sql.*;
			public class showpageserver extends HttpServlet {
			    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			         try { 
			        	 System.out.print("1111111111");
			        	 Connection conn=sqlutill.getConn();
			        	 ServletContext application=this.getServletContext();
			        	  int id=Integer.parseInt(req.getParameter("id"));
			              String sql="select * from good where id="+id;
			              Statement st=(Statement) conn.createStatement();
			              ResultSet resultSet = st.executeQuery(sql);
			              System.out.print("aaaaaaaa");
			              good good=new good();
			              while(resultSet.next()) {
			                  good.setId(resultSet.getInt("id"));
			                  good.setName(resultSet.getString("name"));
			                  good.setIntrodution1(resultSet.getString("introdution1"));
			                  good.setIntrodution2(resultSet.getString("introdution2"));
			                  good.setIntrodution3(resultSet.getString("introdution3"));
			                  good.setPath(resultSet.getString("path"));
			              }
			              System.out.print(good.toString());
			              req.setAttribute("good",good);
			              resultSet.close();
			              st.close();
			              }catch (Exception e) {
			                  e.printStackTrace();
			        }
			              req.getRequestDispatcher("../showpage.jsp").forward(req, resp);
			          }
			    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			        super.doGet(req, resp);
			    }
			}
