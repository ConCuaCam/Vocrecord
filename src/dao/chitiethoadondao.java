package dao;

import java.sql.PreparedStatement;

public class chitiethoadondao {
	public int Them (String macd, long soluongmua, long MaHoaDon) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into ChiTietHoaDon(macd,SoLuongMua,MaHoaDon,damua) values (?,?,?,?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, macd);
			cmd.setLong(2, soluongmua);
			cmd.setLong(3, MaHoaDon);
			cmd.setBoolean(4, false);
			int kq=cmd.executeUpdate();
			cs.cn.close();
			return kq;
		} catch(Exception e) {
			e.printStackTrace();
			return 0;
		}
	}
}
