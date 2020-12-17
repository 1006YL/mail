package controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import bean.good;

public class AddServlet extends HttpServlet {

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		HttpSession session = request.getSession();
		System.out.print("11111");
		HashMap goods = (HashMap)session.getAttribute("goods");
		String strgoodid = request.getParameter("goodid");
		String goodname = request.getParameter("goodname");
		String strgoodprice = request.getParameter("goodprice");
		String strgoodnumber = request.getParameter("quantity");
		String strshopid = request.getParameter("shopid");
		int shopid=Integer.parseInt(strshopid);
		System.out.print("222222");
		good good = new good();
		System.out.print(goodname);
		System.out.print(strgoodnumber);
		Integer goodid = Integer.parseInt(strgoodid);
		good.setId(goodid);
		good.setName(goodname);
		float goodprice = Float.parseFloat(strgoodprice);
		System.out.print(strgoodprice+"oT");
		good.setPrice(goodprice);
		System.out.print(strgoodprice+"oF");
		int goodnumber = Integer.parseInt(strgoodnumber);
		System.out.print(goodnumber);
		good.setQuantity(goodnumber);
		good.setShopid(shopid);
		System.out.print(good.toString());
		System.out.print(goods);
		goods.put(goodid,good);
		float money = (Float) session.getAttribute("money");
		System.out.print(money);
		System.out.print(goodnumber);
		money = money + goodprice * goodnumber;
		session.setAttribute("money", money);
		System.out.print("44444444");
		response.sendRedirect("../showCart.jsp");
	}

}
