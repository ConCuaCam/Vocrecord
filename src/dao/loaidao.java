package dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import bean.loaibean;

public class loaidao {
	public ArrayList<loaibean> getloai() {
		try {
			ArrayList<loaibean> dsloai = new ArrayList<loaibean>();
			// b1: ket noi vao csdl
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			// b2 Lay du lieu ve
			String sql = "select * from loai";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String maloai = rs.getString("maloai");
				String tenloai = rs.getString("tenloai");
				dsloai.add(new loaibean(maloai, tenloai));
			}
			// b3: Dong rs va cn
			rs.close();
			cs.cn.close();
			return dsloai;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public void ThemLoai(String maloai, String tenloai) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "insert into loai(maloai, tenloai) values(?,?)";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, maloai);
			cmd.setString(2, tenloai);
			cmd.executeUpdate();
		} catch (Exception e) {

		}
	}

	public void DeleteLoai(String maloai) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "delete from loai\r\n" + "where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, maloai);
			cmd.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public loaibean CheckMaLoai(String maloai) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "select * from loai where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, maloai);
			ResultSet rs = cmd.executeQuery();
			while (rs.next()) {
				String tenloai = rs.getString("tenloai");
				return new loaibean(maloai, tenloai);
			}
		} catch (Exception e) {

		}
		return null;
	}

	public void UpdateLoai(String maloai, String tenloai) {
		try {
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			String sql = "update loai \r\n" + "set tenloai= ?\r\n" + "where maloai = ?";
			PreparedStatement cmd = cs.cn.prepareStatement(sql);
			cmd.setString(1, tenloai);
			cmd.setString(2, maloai);
			cmd.executeUpdate();
		} catch (Exception e) {

		}
	}
}
