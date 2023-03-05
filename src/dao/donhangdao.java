package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.donhangbean;

public class donhangdao {
	public ArrayList<donhangbean> getdonhang(long makh) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			ArrayList<donhangbean> ds = new ArrayList<donhangbean>();
			String sql = "select * from VDonHang where makh = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, makh);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				Date ngayMua = rs.getDate("NgayMua");
				long thanhTien = rs.getLong("ThanhTien");
				boolean damua = rs.getBoolean("damua");
				long maHoaDon = rs.getLong("MaHoaDon");
				ds.add(new donhangbean(maHoaDon, ngayMua, thanhTien, damua, makh));
			}
			rs.close();
			cs.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public ArrayList<donhangbean> getdonhangAdmin() {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			ArrayList<donhangbean> ds = new ArrayList<donhangbean>();
			String sql = "select * from VDonHang where damua = 0";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				long makh = rs.getLong("makh");
				Date ngayMua = rs.getDate("NgayMua");
				long thanhTien = rs.getLong("ThanhTien");
				boolean damua = rs.getBoolean("damua");
				long maHoaDon = rs.getLong("MaHoaDon");
				ds.add(new donhangbean(maHoaDon, ngayMua, thanhTien, damua, makh));
			}
			rs.close();
			cs.cn.close();
			return ds;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}
	public long totalHoaDon() {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select Count(MaHoaDon) AS total from VDonHang\r\n"
					+ "where NgayMua = CAST(GETDATE() AS Date)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			long kq = 0;
			if(rs.next()) {
				kq=rs.getLong("total");
			}
			rs.close();
			cs.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
	public long totalDoanhThu() {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select SUM(ThanhTien) AS total from VDonHang\r\n"
					+ "where NgayMua = CAST(GETDATE() AS Date) and damua = 1 ";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			long kq = 0;
			if(rs.next()) {
				kq=rs.getLong("total");
			}
			rs.close();
			cs.cn.close();
			return kq;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
