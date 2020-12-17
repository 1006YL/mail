package filter;

import java.io.IOException;
import javax.servlet.*;


public class encodefiler implements Filter{
	public void init(FilterConfig config) throws ServletException{
		System.out.print("ok");
	}
	public void destroy(){}
	public void doFilter(ServletRequest request,ServletResponse response,
		FilterChain chain) throws ServletException,IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		chain.doFilter(request,response);
		
	}

}
