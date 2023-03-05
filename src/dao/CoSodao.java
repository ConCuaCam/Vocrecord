package dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.util.ArrayList;

import bean.CDbean;
import bean.adminbean;
import bo.CDbo;
import bo.adminbo;
import bo.cartbo;
import bo.chitietdonhangbo;
import bo.donhangbo;
import bo.khachhangbo;

public class CoSodao {
	public Connection cn;
	public void KetNoi(){
		try {
			// Xac dinh he qtcsdl
			Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
			System.out.println("OK buoc 1");
			cn=DriverManager.getConnection("jdbc:sqlserver://WIN-PRO\\BRUH:1433;databaseName=QLVOC;user=sa; password=123456");
			System.out.println("OK buoc 2");
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		
		
	}
	
	public static void main(String [] ts){
			CoSodao cs = new CoSodao();
			cs.KetNoi();
			CDdao s = new CDdao();
			System.out.print(s.getcd());
	}
}
