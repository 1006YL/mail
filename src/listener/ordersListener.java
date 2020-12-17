package listener;

import javax.servlet.http.HttpSessionBindingEvent;
import javax.servlet.http.HttpSessionBindingListener;

	public class ordersListener implements HttpSessionBindingListener{
	    private String id;
	    private String name;
	    public String getId() {
	        return id;
	    }
	    public void setId(String id) {
	        this.id = id;
	    }
	    public String getName() {
	        return name;
	    }
	    public void setName(String name) {
	        this.name = name;
	    }
	    @Override
	    //绑定
	    public void valueBound(HttpSessionBindingEvent event) {
	        System.out.println("ordersListener被绑定了");
	        ordersListener per = (ordersListener)event.getValue();
	        System.out.println(per.getName());
	    }
	    @Override
	    //解除绑定
	    public void valueUnbound(HttpSessionBindingEvent event) {

	        System.out.println("ordersListener被解绑了");

	    }
	}

