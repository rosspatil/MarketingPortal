package com.DevenDream7.DAO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Timestamp;

import com.DevenDream7.bean.User;
import com.DevenDream7.util.db.ConnectionFactory;

public class TransactionDAO {
	
	
	public void debitTrans(User user,User parent,double amount){
		Connection con=ConnectionFactory.getConnection();
		String sql="INSERT INTO transaction(date,userid,deptby,amount,creditby) values(?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));			
			stmt.setString(2, parent.getUserId());
			stmt.setString(3, user.getEmail());
			stmt.setDouble(4, amount);
			stmt.setString(5, "N/A");
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
	}
	
	public void creditTrans(User user,User parent,double amount){
		Connection con=ConnectionFactory.getConnection();
		String sql="INSERT INTO transaction(date,userid,creditby,amount,deptby) values(?,?,?,?,?)";
		PreparedStatement stmt;
		try {
			stmt = con.prepareStatement(sql);
			stmt.setTimestamp(1, new Timestamp(System.currentTimeMillis()));			
			stmt.setString(2, parent.getUserId());
			stmt.setString(3, user.getEmail());
			stmt.setDouble(4, amount);
			stmt.setString(5, "N/A");
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
	}

}
