package dao;

import java.io.IOException;

			import utill.sqlutill;	
			import javax.servlet.ServletException;
			import javax.servlet.http.HttpServlet;
			import javax.servlet.http.HttpServletRequest;
			import javax.servlet.http.HttpServletResponse;
			import java.sql.*;			

			public class deletegoodserver extends HttpServlet {
			    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			    	doPost(request,response);
			    }
			    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

			    	 String ids=request.getParameter("id");
			    	 System.out.print(ids);
			            int id=Integer.parseInt(ids);
			        try {

			            Connection conn=sqlutill.getConn();
			            String sql="delete from good where id=?";
			            PreparedStatement st=(PreparedStatement) conn.prepareStatement(sql);
			            st.setInt(1, id);
			            System.out.print(st);
			            st.execute();
			            System.out.print("ture");
			            st.close();
			            conn.close();
			            }
			            catch (SQLException e) {
			               
			                e.printStackTrace();
			            }   
			        response.sendRedirect("shoptakerfind");
			    }

			}

