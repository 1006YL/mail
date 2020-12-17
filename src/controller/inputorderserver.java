package controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Set;
import bean.orders;
import bean.good;
import bean.user;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import utill.sqlutill;

public class inputorderserver extends HttpServlet {

	/**
	 * Constructor of the object.
	 */
	public inputorderserver() {
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
		HttpSession session=request.getSession();
		user user=(user)session.getAttribute("user");
		String userid=user.getAccount();
   		HashMap goods = (HashMap)session.getAttribute("goods");	
		Set set = goods.keySet();
		Iterator ite = set.iterator();
		System.out.print(userid);
		while(ite.hasNext()){
			int goodid =(Integer)ite.next();
			System.out.print(goodid);
			good good = (good)goods.get(goodid);
			int shopid=good.getShopid();
			int quantity=good.getQuantity();
			float money=good.getPrice()*quantity;
			 try {
			    	System.out.print("ifin");
			    		Connection conn=sqlutill.getConn();
			            String sql="insert into orders(userid,goodid,shopid,quantity,money) values(?,?,?,?,?)";
			            PreparedStatement ps=(PreparedStatement) conn.prepareStatement(sql);
			            ps.setString(1, userid);
			            ps.setInt(2, goodid);
			            ps.setInt(3, shopid);
			            ps.setInt(4, quantity);
			            ps.setFloat(5,money);
			            int i=ps.executeUpdate();
			            System.out.println("success"+i);
			            ps.close();
			            conn.close();
			        } catch (Exception e) {
			            e.printStackTrace();
			        }
		}	
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
