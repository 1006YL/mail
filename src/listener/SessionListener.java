package listener;

import java.util.HashMap;
import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener{
	public void sessionCreated(HttpSessionEvent event) {
		HttpSession session = event.getSession();
		HashMap goods = new HashMap();
		session.setAttribute("goods",goods);
		session.setAttribute("money",0F);
	}
	public void sessionDestroyed(HttpSessionEvent arg0) {}	
}
