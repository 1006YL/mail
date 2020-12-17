package bean;

public class good {
	private int id;
	private String name;
	private int quantity;
	private float price;
	private String introdution1;
	private String introdution2;
	private String introdution3;
	private String path;
	private int shopid;
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getIntrodution1() {
		return introdution1;
	}
	public void setIntrodution1(String introdution1) {
		this.introdution1 = introdution1;
	}
	public String getIntrodution2() {
		return introdution2;
	}
	public void setIntrodution2(String introdution2) {
		this.introdution2 = introdution2;
	}
	public String getIntrodution3() {
		return introdution3;
	}
	public void setIntrodution3(String introdution3) {
		this.introdution3 = introdution3;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity =quantity;
	}
	public float getPrice() {
		return price;
	}
	public void setPrice(float price) {
		this.price = price;
	}
	@Override
	public String toString() {
		return "good [id=" + id + ", introdution1=" + introdution1
				+ ", introdution2=" + introdution2 + ", introdution3="
				+ introdution3 + ", name=" + name + ", path=" + path
				+ ", price=" + price + ", quantity=" + quantity + ", shopid="
				+ shopid + "]";
	}



}
