package filter;

	import java.io.IOException;
	import javax.servlet.*;
	import javax.servlet.http.*;
	import java.io.PrintWriter;
	
	public class checklogint implements Filter{
		
		public void init(FilterConfig config) throws ServletException{
			
			System.out.print("ok");
		}
		public void destroy(){}
		public void doFilter(ServletRequest request,ServletResponse response,
			FilterChain chain) throws ServletException,IOException{
			HttpServletRequest httpRequest = (HttpServletRequest)request;	
			HttpServletResponse httpResponse = (HttpServletResponse)response;
			PrintWriter out = httpResponse.getWriter();
			
			HttpSession session = httpRequest.getSession();
			if(session.getAttribute("user")!=null||session.getAttribute("shoptaker")!=null){
			chain.doFilter(request,response);
			}
			else{
				out.print("<script>alert(\"请登陆\");</script>");
				httpResponse.sendRedirect("../mainpage.jsp");
				}
		}

	}

