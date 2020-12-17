package bean;

public class orders {
	private String userid;
	private int goodid;
	private int shopid;
	private int quantity;
	private float money;

	
	@Override
	public String toString() {
		return "orders [goodid=" + goodid + ", money=" + money + ", quantity="
				+ quantity + ", shopid=" + shopid + ", userid=" + userid + "]";
	}
	public float getMoney() {
		return money;
	}
	public void setMoney(float money) {
		this.money = money;
	}
	public String getUserid() {
		return userid;
	}
	public void setUserid(String userid) {
		this.userid = userid;
	}
	public int getGoodid() {
		return goodid;
	}
	public void setGoodid(int goodid) {
		this.goodid = goodid;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public int getQuantity() {
		return quantity;
	}
	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}
}
