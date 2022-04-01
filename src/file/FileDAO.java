package file;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

public class FileDAO {
	
	private Connection con;
	
	public FileDAO() {
		try {
			String url = "jdbc:mysql://localhost:3306/test?serverTimezone=UTC";
			String user = "root";
			String pwd = "1111";
			Class.forName("com.mysql.cj.jdbc.Driver");
			con = DriverManager.getConnection(url, user, pwd);
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	public int upload(String fileName, String fileRealName) {
		String SQL = "INSERT INTO FILE VALUES (?,?)";
		try {
			PreparedStatement pstmt = con.prepareStatement(SQL);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate();
		}catch (Exception e) {
			e.printStackTrace();
		}
		return -1;
	}
}