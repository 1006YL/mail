package bean;

public class shoptaker {
	private String account;
	private String password;	
	private String name;
	private String sex;
	private String address;
	private float phone;
	private int shopid;
	private String email;
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getShopid() {
		return shopid;
	}
	public void setShopid(int shopid) {
		this.shopid = shopid;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAccount() {
		return account;
	}
	public void setAccount(String account) {
		this.account = account;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public float getPhone() {
		return phone;
	}
	public void setPhone(float phone) {
		this.phone = phone;
	}
	@Override
	public String toString() {
		return "shoptaker [account=" + account + ", address=" + address
				+ ", email=" + email + ", name=" + name + ", password="
				+ password + ", phone=" + phone + ", sex=" + sex + ", shopid="
				+ shopid + "]";
	}

}
