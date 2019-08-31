package com.DevenDream7.DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import com.DevenDream7.bean.User;
import com.DevenDream7.util.db.ConnectionFactory;

public class Hiererchy {
	public static void moneyHandler(String user){
		String parent=getParent(user);		
		if(parent!=null && user!=null){
			new TransactionDAO().creditTrans(new UserDAO().getUser(user), new UserDAO().getUser(parent),5);
			new UserDAO().updateBal(parent);
			moneyHandler(parent);
		}
		return;
	}
	
	public static void hierarchy(String str) throws SQLException {
		String parent = getParent(str);
		if (parent != null) {
			List<String> rs = getRefer(parent);
			int level = getLevel(parent);
			ArrayList<String> emails = new ArrayList<>(rs);
			if (!emails.isEmpty() && emails.size() == 2) {
				if (getLevel(emails.get(0)) == getLevel(emails.get(1))) {
					updateLevel(parent, level + 1);
					hierarchy(parent);
				}
			} else if (emails.size() > 2) {
				boolean check = true;
				for (int i = 0; i < emails.size() - 1; i++) {
					check = check && (getLevel(emails.get(i)) == getLevel(emails.get(i + 1)));
					check = check && (getLevel(emails.get(i)) != 0 && getLevel(emails.get(i + 1)) != 0);
				}
				if (check) {
					updateLevel(parent, level + 1);
					hierarchy(parent);
				}
			}
		}
		return;
	}

	public static List<String> getRefer(String email) {
		Connection con = ConnectionFactory.getConnection();
		ResultSet rs = null;
		ArrayList<String> list=new ArrayList<>();
		try {
			
			PreparedStatement stmt = con.prepareStatement("SELECT email from user_account where refid=? ");
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			while(rs.next()){
				list.add(rs.getString(1));
			}
			return list;
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		return list;
	}

	public static int getLevel(String email) {
		Connection con = ConnectionFactory.getConnection();
		ResultSet rs = null;
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT level from user_account where email=? ");
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next())
				return rs.getInt(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return 0;
	}

	public static void updateLevel(String email, int level) {
		Connection con = ConnectionFactory.getConnection();
		try {
			PreparedStatement stmt = con.prepareStatement("UPDATE user_account set level=? where email=? ");
			stmt.setString(2, email);
			stmt.setInt(1, level);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		

	}

	public static String getParent(String email) {
		Connection con = ConnectionFactory.getConnection();
		ResultSet rs = null;
		try {
			PreparedStatement stmt = con.prepareStatement("SELECT refid from user_account where email=? ");
			stmt.setString(1, email);
			rs = stmt.executeQuery();
			if (rs.next())
				return rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return null;
	}
}
