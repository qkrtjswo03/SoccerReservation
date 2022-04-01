package user;

import java.sql.Connection;
import java.sql.PreparedStatement;

import DBUtil.DBUtil;


public class userDAO {
	public int join(String userName, String userEmail, String userPWD, String userPhone) {
		String sql = "insert into member Values(?,?,?,?)";
		try {
			Connection con = DBUtil.getConnection();
			PreparedStatement psmt = con.prepareStatement(sql);
			psmt.setString(1, userName);
			System.out.println(userName);
			psmt.setString(2, userEmail);
			System.out.println(userEmail);
			psmt.setString(3, userPWD);
			System.out.println(userPWD);
			psmt.setString(4, userPhone);
			System.out.println(userPhone);
			
			return psmt.executeUpdate();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
		return -1;
	}
}
