package dao;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utill.sqlutill;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import bean.good;


			public class searchserver extends HttpServlet {
			    
			   
			    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			        String id1=request.getParameter("id");
			        String name=request.getParameter("name");
			        try { 

			              Connection conn=sqlutill.getConn();
			              String sql="select * from good where id=? or name=? ";
			              PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
			              if(id1!=null)
			              {
			            	  int id=Integer.parseInt(id1);
			            	  ps.setInt(1,id);
			              }
			              ps.setString(1, name);
			              ResultSet resultSet = ps.executeQuery();
			              good good=new good();
			              List<good> selectgoods = new ArrayList<good>(); 
			              while(resultSet.next()) {
			            	  good.setId(resultSet.getInt("id"));
			            	  good.setName(resultSet.getString("name"));
			            	  good.setQuantity(resultSet.getInt("Quantity"));
			            	  good.setPrice(resultSet.getFloat("price"));
			            	  good.setPath(resultSet.getString("path"));
			            	  selectgoods.add(good);
			              }
			              request.setAttribute("selectgoods", selectgoods);
			              
			              resultSet.close();
			              ps.close();
			              conn.close();
			              }catch (Exception e) {
			            // TODO: handle exception
			                  e.printStackTrace();
			        }
			         request.getRequestDispatcher("../update.jsp").forward(request, response);
			         
			    }


			    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			        doPost(request, response);
			    }

			}