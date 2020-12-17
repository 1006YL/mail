package controller;

import java.io.IOException;
import java.util.HashMap;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.gooddao;

public class InitServlet extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		gooddao gdao = new gooddao();
		System.out.print("2222");
		HashMap allgood = null;
		try {
			allgood = gdao.getAllgood();
			System.out.print(allgood);
		} catch (Exception e) {
			e.printStackTrace();
		}
		request.getSession().setAttribute("allgood", allgood);
		System.out.print("3333");
		response.sendRedirect("../shopallshow.jsp");
	}
}
