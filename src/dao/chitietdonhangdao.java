package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.chitietdonhangbean;

public class chitietdonhangdao {
	public ArrayList<chitietdonhangbean> getctdonhang(long makh, long MaHoaDon) {
    	try {
 		   CoSodao cs=new CoSodao();
 		   cs.KetNoi();
 		  ArrayList<chitietdonhangbean> ds= new ArrayList<chitietdonhangbean>();
 		   String sql="select * from VChiTietDonHang where makh = ? and MaHoaDon = ?";
 		   PreparedStatement cmd= cs.cn.prepareStatement(sql);
 		  cmd.setLong(1, makh);
 		  cmd.setLong(2, MaHoaDon);
 		   ResultSet rs=cmd.executeQuery();
 		   while(rs.next()) {
 			  String madia=rs.getString("macd");
 			  String tendia=rs.getString("tencd");
 			  Date ngayMua=rs.getDate("NgayMua");
 			  String anh=rs.getString("anh");
 			  long soLuongMua=rs.getLong("SoLuongMua");
 			  long gia=rs.getLong("gia");
 			  long thanhTien=rs.getLong("ThanhTien");
 			  boolean damua=rs.getBoolean("damua");
 			  ds.add(new chitietdonhangbean(madia, tendia, ngayMua, soLuongMua, gia, thanhTien, damua, makh, MaHoaDon, anh));
 		   }
 		   rs.close();cs.cn.close();
 		   return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
    }
}
