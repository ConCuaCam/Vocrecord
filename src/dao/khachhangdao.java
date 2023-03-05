package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;

import bean.khachhangbean;

public class khachhangdao {
	public khachhangbean DangNhap(String tendn, String pass) {
		try {
			CoSodao cs= new CoSodao();
			cs.KetNoi();
			String sql="select * from KhachHang where tendn Collate Latin1_General_CS_AS = ? and pass Collate Latin1_General_CS_AS =?";
			PreparedStatement cmd= cs.cn.prepareStatement(sql);
			cmd.setString(1, tendn);
			cmd.setString(2, pass);
			ResultSet rs= cmd.executeQuery();
			khachhangbean kh=null;
			if(rs.next()) { 
				long makh=rs.getLong("makh");
				String hoten=rs.getString("hoten");
				String diachi=rs.getString("diachi");
				String sodt=rs.getString("sodt");
				String email=rs.getString("email");
				kh = new khachhangbean(makh, hoten, diachi, sodt,email, tendn, pass);
			}
			rs.close(); cs.cn.close();
			return kh;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public khachhangbean CheckTaiKhoan(String tendn) {
		try {
			CoSodao cs = new CoSodao();
			   cs.KetNoi();
			   String sql = "select * from KhachHang\n"
						+ "where tendn = ?";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   cmd.setString(1, tendn);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
				   	long makh=rs.getLong("makh");
					String hoten=rs.getString("hoten");
					String diachi=rs.getString("diachi");
					String sodt=rs.getString("sodt");
					String pass=rs.getString("pass");
					String email=rs.getString("email");
					return new khachhangbean(makh, hoten, diachi, sodt,email, tendn, pass);
			   }
		   } catch (Exception e) {
			   
		   } 
		return null;
	}
	
	public void DangKy(String tendn, String pass) {
		try {
			CoSodao cs = new CoSodao();
			   cs.KetNoi();
			   String sql = "insert into KhachHang(tendn,pass)\n"
						+ "values(?,?)";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   cmd.setString(1, tendn);
		       cmd.setString(2, pass);
			   cmd.executeUpdate();
		   } catch (Exception e) {
			   
		   } 
	}
	public khachhangbean getKhachHang(long makh) {
		try {
			CoSodao cs = new CoSodao();
			   cs.KetNoi();
			   String sql = "select * from KhachHang\n"
						+ "where makh = ?";
			   PreparedStatement cmd = cs.cn.prepareStatement(sql);
			   cmd.setLong(1, makh);
			   ResultSet rs = cmd.executeQuery();
			   while(rs.next()) {
					String hoten=rs.getString("hoten");
					String diachi=rs.getString("diachi");
					String sodt=rs.getString("sodt");
					String pass=rs.getString("pass");
					String tendn=rs.getString("tendn");
					String email=rs.getString("email");
					return new khachhangbean(makh, hoten, diachi, sodt,email, tendn, pass);
			   }
		   } catch (Exception e) {
			   
		   } 
		return null;
	}
	public void UpdateTTKH(String hoten, String sodt, String email, String diachi, String tendn) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update KhachHang\r\n"
					+ "set hoten = ?, sodt = ?, email = ?, diachi = ?\r\n"
					+ "where tendn = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, hoten);
			cmd.setString(2, sodt);
			cmd.setString(3, email);
			cmd.setString(4, diachi);
			cmd.setString(5, tendn);
			cmd.executeUpdate();
		} catch (Exception e) {

		}
	}
}
