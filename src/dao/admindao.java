package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.adminbean;


public class admindao {
	public adminbean ktdn(String tendn, String pass) {
		try {
			CoSodao cs= new CoSodao();
			cs.KetNoi();
			String sql="select * from Admin where TenDangNhap=? and MatKhau=?";
			PreparedStatement cmd= cs.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs= cmd.executeQuery();
			adminbean dn=null;
			if(rs.next()) {//Dang nhap thanh cong
			 String TenDangNhap = rs.getString("TenDangNhap");
			 String MatKhau = rs.getString("MatKhau");
			 dn = new adminbean(TenDangNhap, MatKhau);
			}
			rs.close(); cs.cn.close();
			return dn;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
}
