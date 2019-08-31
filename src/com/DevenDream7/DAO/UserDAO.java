package com.DevenDream7.DAO;

import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.DevenDream7.bean.User;
import com.DevenDream7.bean.UserAccount;
import com.DevenDream7.util.db.ConnectionFactory;

public class UserDAO {


	public int getCountForTable(String table){
		String sql = "SELECT count(*) FROM "+table;
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
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

	public User getUser(String userName) {

		String sql = "SELECT * FROM user where email=?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userName);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new User(rs.getString(1), rs.getString(2),
						rs.getString(3), rs.getString(5), rs.getString(4),
						rs.getString(6), rs.getString(7));
			}
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

	public void updateBal(String email) {
		String sql="UPDATE  user_account SET balance=? WHERE email=? ";
		UserAccount userAccount=getAccount(email);
		if(userAccount==null){
			return;
		}
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setDouble(1, userAccount.getBalance()+5);
			stmt.setString(2, email);
			stmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}

	}

	public boolean checkLogin(String userName, String password) {
		String sql = "SELECT email,password FROM user where email=? and password=?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userName);
			stmt.setString(2, password);
			ResultSet rs = stmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}

		return false;
	}

	public String getUserId(String userName) {
		String sql = "SELECT userid FROM user WHERE email =?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, userName);
			ResultSet rs = stmt.executeQuery();
			rs.next();
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

	public int getCount() {
		String sql = "SELECT count(userid) FROM user";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			ResultSet rs = stmt.executeQuery();
			rs.next();
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

	public boolean register(User user,InputStream inputStream) {
		String sql = "INSERT INTO user(userid,firstname,lastname,email,phone,password,refid) VALUES(?,?,?,?,?,?,?)";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, user.getUserId());
			stmt.setString(2, user.getFirstName());
			stmt.setString(3, user.getLastName());
			stmt.setString(4, user.getEmail());
			stmt.setString(5, user.getPhone());
			stmt.setString(6, user.getPassword());
			stmt.setString(7, user.getRefrenceid());
			stmt.execute() ;
			createUserAccount(user.getEmail(), user.getRefrenceid());
			PreparedStatement pst=con.prepareStatement("INSERT INTO images(userid,photo) VALUES(?,?)");
			pst.setString(1,user.getUserId());
			pst.setBlob(2, inputStream);
			pst.execute();
			Hiererchy.hierarchy(user.getEmail());
			Hiererchy.moneyHandler(user.getEmail());
			System.out.println("Signup.....................");
			return true;


		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean createUserAccount( String email, String refid) {
		String sql = "INSERT INTO user_account(email,refid) VALUES(?,?)";
		Connection con=ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			stmt.setString(2, refid);
			stmt.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	public UserAccount getAccount(String email) {
		String sql = "SELECT balance,level FROM user_account where email=?";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			if (rs.next()) {
				return new UserAccount(rs.getDouble(1), rs.getInt(2));
			}
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

	public boolean checkRefer(String refid){
		String sql = "SELECT * FROM user WHERE email=? ";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, refid);
			ResultSet rs = stmt.executeQuery();
			return rs.next();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}

	public boolean checkEmailExistance(String email){
		String sql = "SELECT * FROM user WHERE email=? ";
		Connection con = ConnectionFactory.getConnection();
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setString(1, email);
			ResultSet rs = stmt.executeQuery();
			return (!rs.next());
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		return false;
	}


	public  String getQuotes() {
		Connection con = ConnectionFactory.getConnection();
		ResultSet rs = null;
		String date=""+new Date().getDate();
		try {

			PreparedStatement stmt = con.prepareStatement("SELECT postUrl FROM quotes WHERE date=? ");
			stmt.setString(1, date);
			rs = stmt.executeQuery();
			if(rs.next()){
				return rs.getString(1);
			}
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
