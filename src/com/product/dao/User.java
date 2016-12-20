package com.product.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.product.Utils.DB;


/**
 * return 998 表示用户输入密码错误
 * return -1 用户名不存在
 * return b 表示登录成功  0管理员   1买入信息   2卖出信息    3信息管理
 * @author DELL
 *
 */
public class User {

	private Connection conn = DB.getConnection();

	public int login(String username,String password){
		if(username==""&&password==""){
			return -999;
		}
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		try {
			pstmt = conn.prepareStatement("SELECT* FROM users WHERE user_name =? ");
			pstmt.setString(1, username);
			rs = pstmt.executeQuery();
			while(rs.next()){
				String a = rs.getString("password");
				if(a.trim().equals(password)){
					int b = rs.getInt("role");
					return b;
				}else{
					return 998;
				}
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}finally{
			if(rs != null ){
				try {
					rs.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			if(pstmt != null){
				try {
					pstmt.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DB.closeConnection();
		}
		return -1;
	}
	public boolean insert(String username, String password, int role){
		PreparedStatement pstmtInsert = null;
		boolean flag = false;
		try {
			pstmtInsert = conn.prepareStatement("INSERT INTO users(user_name,password,role) VALUES(?,?,?)");
			pstmtInsert.setString(1, username);
			pstmtInsert.setString(2, password);
			pstmtInsert.setInt(3, role);
			int result = pstmtInsert.executeUpdate();
			if(result > 0){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmtInsert != null){
				try {
					pstmtInsert.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DB.closeConnection();
		}
		return flag;
	}
	public boolean modify(int id, String username, String password, int role){
		PreparedStatement pstmtModify = null;
		boolean flag = false;
		try {
			pstmtModify = conn.prepareStatement("UPDATE users SET user_name=?,password=?,role=? WHERE user_id=?");
			pstmtModify.setString(1, username);
			pstmtModify.setString(2, password);
			pstmtModify.setInt(3, role);
			pstmtModify.setInt(4, id);
			int result = pstmtModify.executeUpdate();
			if(result > 0){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmtModify != null){
				try {
					pstmtModify.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DB.closeConnection();
		}
		return flag;
	}
	public boolean delete(int id){
		PreparedStatement pstmtDelete = null;
		boolean flag = false;
		try {
			pstmtDelete = conn.prepareStatement("DELETE FROM users WHERE user_id=?");
			pstmtDelete.setInt(1, id);
			int result = pstmtDelete.executeUpdate();
			if(result > 0){
				flag = true;
			}
		}catch(Exception e){
			e.printStackTrace();
		}finally{
			if(pstmtDelete != null){
				try {
					pstmtDelete.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			DB.closeConnection();
		}
		return flag;
	}

}



