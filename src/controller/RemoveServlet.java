package controller;

import java.io.IOException;
import java.util.HashMap;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.good;

public class RemoveServlet extends HttpServlet {
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		String strgoodid = request.getParameter("goodid");	
		int goodid=Integer.parseInt(strgoodid);
		HttpSession session = request.getSession();
		HashMap goods = (HashMap)session.getAttribute("goods");
		good good = (good)goods.get(goodid);
		float money = (Float)session.getAttribute("money");
		money = money - good.getQuantity()*good.getPrice();
		session.setAttribute("money", money);	
		goods.remove(goodid);		
		response.sendRedirect("../showCart.jsp");
	}
}
