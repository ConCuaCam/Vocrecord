package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;

import bean.CDbean;

public class CDdao {
	public ArrayList<CDbean> getcd() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from cd";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				String quocgia = rs.getString("quocgia");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, quocgia, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> getpcd() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where phobien = 1";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public long maxDia() {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select count(*) from CD";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				return rs.getLong(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

	public ArrayList<CDbean> getdiathan(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "order by macd\r\n" + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				String quocgia = rs.getString("quocgia");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, quocgia, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> TimMa(String maloai) {
		ArrayList<CDbean> tam = new ArrayList<CDbean>();
		ArrayList<CDbean> ds = getcd();
		for (CDbean s : ds)
			if (s.getMaloai().contains(maloai))
				tam.add(s);
		return tam;
	}

	public ArrayList<CDbean> Tim(String key) {
		ArrayList<CDbean> tam = new ArrayList<CDbean>();
		ArrayList<CDbean> ds = getcd();
		for (CDbean s : ds)
			if (s.getTendia().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getMaloai().toLowerCase().trim().contains(key.toLowerCase().trim())
					|| s.getNghesi().toLowerCase().trim().contains(key.toLowerCase().trim()))
				tam.add(s);
		return tam;
	}

	public ArrayList<CDbean> Timconhang() {
		ArrayList<CDbean> tam = new ArrayList<CDbean>();
		ArrayList<CDbean> ds = getcd();
		for (CDbean s : ds)
			if (s.getSoluong() > 0)
				tam.add(s);
		return tam;
	}

	public ArrayList<CDbean> Timhethang() {
		ArrayList<CDbean> tam = new ArrayList<CDbean>();
		ArrayList<CDbean> ds = getcd();
		for (CDbean s : ds)
			if (s.getSoluong() == 0)
				tam.add(s);
		return tam;
	}

	public ArrayList<CDbean> getctcd(String madia) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where macd = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, madia);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				String quocgia = rs.getString("quocgia");
				dssach.add(new CDbean(madia, tencd, soluong, gia, maloai, namphathanh, quocgia, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> getthongtin(long index, String tt) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "where (nghesi LIKE ?) or (tencd LIKE ?) or (maloai LIKE ?)  \r\n"
					+ "ORDER BY namphathanh\r\n" + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, "%" + tt + "%");
			cmd.setString(2, "%" + tt + "%");
			cmd.setString(3, "%" + tt + "%");
			cmd.setLong(4, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> giatang(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "ORDER BY gia\r\n" + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> giagiam(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "ORDER BY gia DESC\r\n" + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> namgiam(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "ORDER BY namphathanh DESC\r\n"
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> namtang(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "ORDER BY namphathanh \r\n" + "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> conhang(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "where soluong > 0\r\n" + "ORDER BY macd\r\n"
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> hethang(long index) {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD\r\n" + "where soluong = 0\r\n" + "ORDER BY macd\r\n"
					+ "OFFSET ? ROWS FETCH NEXT 12 ROWS ONLY";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setLong(1, (index - 1) * 12);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}
			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> get50s() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where namphathanh between '1950-01-01' and '1959-12-31'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> get60s() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where namphathanh between '1960-01-01' and '1969-12-31'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> get70s() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where namphathanh between '1970-01-01' and '1979-12-31'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> get80s() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where namphathanh between '1980-01-01' and '1989-12-31'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> get90s() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where namphathanh between '1990-01-01' and '1999-12-31'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public ArrayList<CDbean> get00s() {
		try {
			ArrayList<CDbean> dssach = new ArrayList<CDbean>();
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where namphathanh between '2000-01-01' and '2009-12-31'";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String macd = rs.getString("macd");
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				dssach.add(new CDbean(macd, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien));
			}

			rs.close();
			cs.cn.close();
			return dssach;
		} catch (Exception e) {
			e.printStackTrace();
			return null;

		}
	}

	public CDbean checkCD(String madia) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from CD where macd  = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, madia);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String tencd = rs.getString("tencd");
				String nghesi = rs.getString("nghesi");
				long soluong = rs.getLong("soluong");
				long gia = rs.getLong("gia");
				String anh = rs.getString("anh");
				String maloai = rs.getString("maloai");
				Date namphathanh = rs.getDate("namphathanh");
				boolean phobien = rs.getBoolean("phobien");
				return new CDbean(madia, tencd, soluong, gia, maloai, namphathanh, maloai, nghesi, anh, phobien);
			}
		} catch (Exception e) {

		}
		return null;
	}
	
	public void DeleteCD(String madia) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "delete from CD\r\n" + "where macd = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, madia);
			cmd.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public void ThemCD(String madia, String tendia, long soluong, long gia, String maloai, java.sql.Date namphathanh, String quocgia,
			String nghesi, String anh) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into CD(macd,tencd,soluong,gia,namphathanh,quocgia,nghesi,anh,maloai) values(?,?,?,?,?,?,?,?,?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, madia);
			cmd.setString(2, tendia);
			cmd.setLong(3, soluong);
			cmd.setLong(4, gia);
			cmd.setDate(5, namphathanh);
			cmd.setString(6, quocgia);
			cmd.setString(7, nghesi);
			cmd.setString(8, anh);
			cmd.setString(9, maloai);
			cmd.executeUpdate();
		} catch (Exception e) {

		}
	}
	
	public void UpdateCD(String madia, String tendia, long soluong, long gia, String maloai, java.sql.Date namphathanh, String quocgia,
			String nghesi, String anh) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update CD\r\n"
					+ "set tencd = ?, soluong = ?, gia = ?, namphathanh = ?, quocgia = ?, nghesi = ?, anh = ?, maloai = ?\r\n"
					+ "where macd = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(9, madia);
			cmd.setString(1, tendia);
			cmd.setLong(2, soluong);
			cmd.setLong(3, gia);
			cmd.setDate(4, namphathanh);
			cmd.setString(5, quocgia);
			cmd.setString(6, nghesi);
			cmd.setString(7, anh);
			cmd.setString(8, maloai);
			cmd.executeUpdate();
		} catch (Exception e) {

		}
	}
}
