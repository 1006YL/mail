package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.HashMap;
import utill.sqlutill;
import bean.good;

public class gooddao {
	private Connection conn = null;
	public HashMap getAllgood() throws Exception{		
		HashMap hm = new HashMap();
		Connection conn=sqlutill.getConn();
		Statement stat = conn.createStatement();
		System.out.print("1111");
		String sql = 
			"SELECT * FROM good";
		ResultSet rs = stat.executeQuery(sql);
		while(rs.next()){
			good good = new good();
			good.setId(new Integer(rs.getInt("id")));
			good.setName(rs.getString("name"));
			good.setPrice(rs.getFloat("price"));
			good.setShopid(rs.getInt("shopid"));
			good.setIntrodution1(rs.getString("Introdution1"));
			good.setIntrodution2(rs.getString("Introdution2"));
			good.setIntrodution3(rs.getString("Introdution3"));
			good.setPath(rs.getString("path"));
			hm.put(good.getId(),good);
			System.out.print(good.toString());
		}
		rs.close();
		stat.close();
		conn.close();
		return hm;		
	}	
	
}
