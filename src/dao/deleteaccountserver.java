package dao;

import java.io.IOException;

			import utill.sqlutill;	
			import javax.servlet.ServletException;
			import javax.servlet.http.HttpServlet;
			import javax.servlet.http.HttpServletRequest;
			import javax.servlet.http.HttpServletResponse;
			import java.sql.*;			

			public class deleteaccountserver extends HttpServlet {
			    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			    	doPost(request,response);
			    }
			    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			    	 String account=request.getParameter("account");
			    	 String isshoptaker=request.getParameter("isshoptaker");
			    	 String isgood=request.getParameter("isgood");
			    	 System.out.print("delet");
			    	 if(isshoptaker==null&&isgood==null)
			    	 {
			        try {
			        	System.out.print("456");
			            Connection conn=sqlutill.getConn();
			            String sql="delete from user where account=? ";
			            PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
			            st.setString(1,account);
			            st.execute();
			            st.close();
			            conn.close();
			            }
			            catch (SQLException e) {
			               
			                e.printStackTrace();
			            } 
			    	 }
			    	  if(isgood!=null&&isgood!="")
			    	 {
						  int id=Integer.parseInt(request.getParameter("goodid"));
			    		  try {
				        	System.out.print("456");
				            Connection conn=sqlutill.getConn();
				            String sql="delete from good where id=? ";
				            PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
				            st.setInt(1,id);
				            st.execute();
				            st.close();
				            conn.close();
			    		  }
				            catch (SQLException e) {
					               
				                e.printStackTrace();
				            } 
			    	 }
			    	if(isshoptaker!=null||isshoptaker!="")
			    	 {
					        try {
					        	System.out.print("789");
					            Connection conn=sqlutill.getConn();
					            String sql="delete from shoptaker where account=? ";
					            PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
					            st.setString(1,account);
					            st.execute();
					            st.close();
					            conn.close();
					            }
					            catch (SQLException e) {
					               
					                e.printStackTrace();
					            } 
					    	 
			    	 }
			        response.sendRedirect("managerfindserver");
			    }

			}

