package dao;

import java.io.IOException;
import java.math.BigInteger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import utill.sqlutill;
import java.sql.*;


public class addaccountserver extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	this.doPost(request, response);
    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	System.out.print("add1111111111111");
    	String account=request.getParameter("account");
        String name = request.getParameter("name");
        int password = Integer.parseInt(request.getParameter("password"));
        String sex = request.getParameter("sex");
        String address = request.getParameter("address");
        System.out.print("add1");
        BigInteger phone1 = new BigInteger(request.getParameter("phone").trim());
        float phone =phone1.floatValue();
        String email = request.getParameter("email");
        System.out.print(request.getParameter("shopid"));
        if(request.getParameter("shopid")==null||request.getParameter("shopid")=="")
        {
    try {
    	System.out.print("ifin");
    		Connection conn=sqlutill.getConn();
            String sql="insert into user(account,password,name,sex,address,phone,email) values(?,?,?,?,?,?,?)";
            PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
            ps.setString(1, account);
            ps.setInt(2, password);
            ps.setString(3, name);
            ps.setString(4, sex);
            ps.setString(5, address);
            ps.setFloat(6,phone);
            ps.setString(7, email);
            int i=ps.executeUpdate();
            System.out.print("add2");
            System.out.println("success"+i);
            ps.close();
            conn.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        }
        else
        {
        	   try {
       	       int shopid = Integer.parseInt(request.getParameter("shopid"));
           		   Connection conn=sqlutill.getConn();
                   String sql="insert into shoptaker(account,password,name,sex,address,phone,email,shopid) values(?,?,?,?,?,?,?,?)";
                   PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
                   ps.setString(1, account);
                   ps.setInt(2, password);
                   ps.setString(3, name);
                   ps.setString(4, sex);
                   ps.setString(5, address);
                   ps.setFloat(6,phone);
                   ps.setString(7, email);
                   ps.setInt(8,shopid);
                 int i=ps.executeUpdate();
                   System.out.print("add3");
                   System.out.println("success"+i);
                   ps.close();
                   conn.close();
               } catch (Exception e) {
                   e.printStackTrace();
               }
        }
    response.sendRedirect("managerfindserver");
}
    }
