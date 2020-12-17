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

import java.sql.*;

	public class revisegoodserver extends HttpServlet {
	    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			SmartUpload smartUpload=new SmartUpload();
			ServletConfig config=this.getServletConfig();
			smartUpload.initialize(config,request,response);
			
			ServletContext application=this.getServletContext();
	    	HttpSession session=request.getSession();
	    	
	    	
	        try {
	        		smartUpload.upload();
	        		SmartFile smartFile=smartUpload.getFiles().getFile(0);
	        		System.out.println(smartFile.getFileName());
	        		System.out.println("输出"+smartUpload.getRequest().getParameter("goodid"));
	        		smartFile.saveAs("E:/workspace/sxgcnew/WebRoot/pictures/"+smartFile.getFileName(),smartUpload.SAVE_AUTO);
	        		int id=Integer.parseInt(smartUpload.getRequest().getParameter("id"));
	        		int goodid= Integer.parseInt(smartUpload.getRequest().getParameter("goodid"));
	    	        String name = smartUpload.getRequest().getParameter("name");
	    	        int shopid=(Integer)session.getAttribute("shopid");
	    	        System.out.println(shopid);
	    	        int quantity = Integer.parseInt(smartUpload.getRequest().getParameter("quantity"));
	    	        System.out.println(quantity);
	    	        float price = Float.parseFloat(smartUpload.getRequest().getParameter("price"));
	    	        System.out.println(price);
	    	        String introdution1 = smartUpload.getRequest().getParameter("introdution1");
	    	        System.out.println(introdution1);
	    	        String introdution2 = smartUpload.getRequest().getParameter("introdution2");
	    	        String introdution3 = smartUpload.getRequest().getParameter("introdution3");
	    	        System.out.println(name);
	    	        System.out.println("rives");
	        		String path="pictures/"+smartFile.getFileName();
	            	Connection conn=sqlutill.getConn();
	                String sql="update good set id=?,name=?,quantity=?,price=?,introdution1=?,introdution2=?,introdution3=?,shopid=?,path=? where id=?";
	                PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
	                ps.setInt(1, goodid);
	                ps.setString(2, name);
	                ps.setInt(3, quantity);
	                ps.setFloat(4, price);
	                ps.setString(5, introdution1);
	                ps.setString(6, introdution2);
	                ps.setString(7, introdution3);
	                ps.setInt(8, shopid);
	                ps.setString(9, path);
	                ps.setInt(10,id);
	                ps.executeUpdate();
	                System.out.println("rivesok");
	                ps.close();
	                conn.close();
	            } catch (Exception e) {
	                e.printStackTrace();
	            }
	        
	        System.out.println("update  success");
	        response.sendRedirect("shoptakerfind");
	    }
	    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	        doPost(request, response);
	    }

	}
