package dao;

import java.io.IOException;

			import utill.sqlutill;	
			import javax.servlet.ServletException;
			import javax.servlet.http.HttpServlet;
			import javax.servlet.http.HttpServletRequest;
			import javax.servlet.http.HttpServletResponse;
			import java.sql.*;	

			public class processordersserver extends HttpServlet {
			    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			    	doPost(request,response);
			    }
			    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			    	 int goodid=Integer.parseInt(request.getParameter("goodid"));
			    	 int userid=Integer.parseInt(request.getParameter("userid"));
			        try {
			        	System.out.print("456");
			            Connection conn=sqlutill.getConn();
			            String sql="delete from orders where goodid=? and userid=?";
			            PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
			            st.setInt(1,goodid);
			            st.setInt(2,userid);
			            st.execute();
			            st.close();
			            conn.close();
			            }
			            catch (SQLException e) {
			                e.printStackTrace();
			            } 
			          response.getWriter().print("<script> alert(\"订单交付\"); </script>");
			        response.sendRedirect("findserver");
			    }

			}

