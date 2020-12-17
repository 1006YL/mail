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
import javax.servlet.http.HttpSession;

import java.sql.*;
			public class shoptakerfind extends HttpServlet {
			    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			         try { 
			        	  HttpSession session=req.getSession();
			        	  System.out.print("1111111111");
			        	  Connection conn=sqlutill.getConn();
			        	  ServletContext application=this.getServletContext();
			        	  int shopid=(Integer)session.getAttribute("shopid");
			              String sql="select * from good where shopid="+shopid;
			              System.out.print("2222222");
			              Statement st=(Statement) conn.createStatement();
			              ResultSet resultSet = st.executeQuery(sql);
			              System.out.print("aaaaaaaa");
			              List<good> goods = new ArrayList<good>(); 
			              while(resultSet.next()) {
			            	 good good=new good();
			                  good.setId(resultSet.getInt("id"));
			                  good.setName(resultSet.getString("name"));
			                  good.setQuantity(resultSet.getInt("quantity"));
			                  good.setPrice(resultSet.getFloat("price"));
			                  good.setPath(resultSet.getString("path"));
			                  good.setShopid(shopid);
			                  goods.add(good);
			              }
			              req.setAttribute("goods", goods);
			              resultSet.close();
			              st.close();
			              System.out.print("ccccc");
			              }catch (Exception e) {
			                  e.printStackTrace();
			        }
			         req.getRequestDispatcher("../shoptakershow.jsp").forward(req, resp);
			          }
			    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			        super.doGet(req, resp);
			    }
			}
