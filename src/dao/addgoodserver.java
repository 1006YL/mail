package dao;

import java.io.IOException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.jspsmart.upload.SmartFile;
import com.jspsmart.upload.SmartUpload;

import utill.sqlutill;
import java.sql.*;


public class addgoodserver extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    			this.doPost(request,response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		SmartUpload smartUpload=new SmartUpload();
		ServletConfig config=this.getServletConfig();
		smartUpload.initialize(config,request,response);
		ServletContext application=this.getServletContext();
    	HttpSession session=request.getSession();
      
    try {
    		smartUpload.upload();
        	System.out.print("11111");
        	String id1=smartUpload.getRequest().getParameter("goodid");
        	System.out.print(id1);
            String name = smartUpload.getRequest().getParameter("name");
            System.out.print(name);
            int quantity = Integer.parseInt((String)smartUpload.getRequest().getParameter("quantity"));
            System.out.print(quantity);
            float price = Float.parseFloat((String)smartUpload.getRequest().getParameter("price"));
            String introdution1 = smartUpload.getRequest().getParameter("introdution1");
            String introdution2 = smartUpload.getRequest().getParameter("introdution2");
            String introdution3 = smartUpload.getRequest().getParameter("introdution3");
            int shopid =(Integer)session.getAttribute("shopid");
            int id=Integer.valueOf(id1);
            System.out.println(name);
            System.out.println("2222222");
    		SmartFile smartFile=smartUpload.getFiles().getFile(0);
    		System.out.println(smartFile.getFileName());
    		smartFile.saveAs("E:/workspace/sxgcnew/WebRoot/pictures/"+smartFile.getFileName(),smartUpload.SAVE_AUTO);
    		String path="pictures/"+smartFile.getFileName();
    		System.out.println("33333");
    		Connection conn=sqlutill.getConn();
            String sql="insert into good(id,name,quantity,price,introdution1,introdution2,introdution3,path,shopid) values(?,?,?,?,?,?,?,?,?)";
            PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.setString(2, name);
            ps.setInt(3, quantity);
            ps.setFloat(4, price);
            ps.setString(5, introdution1);
            ps.setString(6, introdution2);
            ps.setString(7, introdution3);
            ps.setString(8, path);
            ps.setInt(9, shopid);
            int i=ps.executeUpdate();
            System.out.println("success"+i);
            ps.close();
            conn.close();
            System.out.println("44444");
        } catch (Exception e) {
            e.printStackTrace();
        }
    
    response.sendRedirect("../servlet/shoptakerfind");
}
    }
