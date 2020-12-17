package dao;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.ServletConfig;
import com.jspsmart.upload.*;
import utill.sqlutill;
import java.sql.*;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;


public class UploadServlet extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public UploadServlet() {
		super();
	}

	/**
	 * Destruction of the servlet. <br>
	 */
	public void destroy() {
		super.destroy(); // Just puts "destroy" string in log
		// Put your code here
	}

	/**
	 * The doGet method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to get.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	/**
	 * The doPost method of the servlet. <br>
	 *
	 * This method is called when a form has its tag value method equals to post.
	 * 
	 * @param request the request send by the client to the server
	 * @param response the response send by the server to the client
	 * @throws ServletException if an error occurred
	 * @throws IOException if an error occurred
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		SmartUpload smartUpload=new SmartUpload();
		ServletConfig config=this.getServletConfig();
		smartUpload.initialize(config,request,response);
		ServletContext application=this.getServletContext();
		System.out.println("11111111111");
		
		try{
			smartUpload.upload();
			SmartFile smartFile=smartUpload.getFiles().getFile(0);
			System.out.println(smartFile.getFileName());
			smartFile.saveAs("E:/workspace/sxgcnew/WebRoot/pictures/"+smartFile.getFileName(),smartUpload.SAVE_AUTO);
			System.out.print("3333333333");
			String ids = smartUpload.getRequest().getParameter("id");
			String name= smartUpload.getRequest().getParameter("name");
			String introdution1= smartUpload.getRequest().getParameter("introdution1");
			String introdution2 = smartUpload.getRequest().getParameter("introdution2");
			String introdution3 = smartUpload.getRequest().getParameter("introdution3");
			int id=Integer.parseInt(ids);
			String path="E:/workspace/sxgcnew/WebRoot/pictures/"+smartFile.getFileName();
         	Connection conn=sqlutill.getConn();
         	System.out.print("444444");
             String sql="update good set path=?,name=?,introdution1=?,introdution2=?,introdution3=? where id=?";
             PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
             ps.setString(1,path);
             ps.setString(2,name);
             ps.setString(3,introdution1);
             ps.setString(4,introdution2);
             ps.setString(5,introdution3);
             ps.setInt(6,id);
             ps.executeUpdate();
             System.out.print(path);
             ps.close();
             conn.close();
             HttpSession session=request.getSession();
             session.setAttribute("message","<script>alert(\"上传文件"+smartFile.getFileName()+"成功\");</script>");
             System.out.println(path);
         } catch (Exception e) {
             e.printStackTrace();
         }
     
     System.out.println("update  success");
    response.sendRedirect("findserver");

	//	request.getRequestDispatcher("/file.jsp").forward(request, response);
	}

	/**
	 * Initialization of the servlet. <br>
	 *
	 * @throws ServletException if an error occurs
	 */
	public void init() throws ServletException {
		// Put your code here
	}

}
