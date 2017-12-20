package File;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

public class FileDAO {
	
	Connection con;
	PreparedStatement pstmt;
	ResultSet rs;
	/*String url = "jdbc:oracle:thin:@localhost:1522:XE";
	String id = "system";
	String pw = "123456";*/
	
	public void getCon() {
		try {
			Context initctx = new InitialContext();
			Context envctx = (Context)initctx.lookup("java:comp/env");
			DataSource ds = (DataSource)envctx.lookup("jdbc/pool");
			con = ds.getConnection();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*public void getCon() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver.");
			con = DriverManager.getConnection(url, id, pw);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}*/
	
	public int upload(String fileName, String fileRealName) {
		getCon();
		try {
			String sql = "INSERT INTO xfile VAlUES(?,?,0)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileName);
			pstmt.setString(2, fileRealName);
			return pstmt.executeUpdate(); //정상적이면 1 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}
	
	public int hit(String fileRealName) {
		getCon();
		try {
			String sql = "UPDATE xfile SET downloadCount=downloadCount+1 "
					+ "WHERE fileRealName = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, fileRealName);
			return pstmt.executeUpdate(); //정상적이면 1 반환
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return -1;
	}
	
	public ArrayList<FileDTO> getList(){
		getCon();
		ArrayList<FileDTO> list = new ArrayList<>();
		
		try {
			String sql = "SELECT * FROM xfile";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				FileDTO file = new FileDTO(rs.getString(1), rs.getString(2), rs.getInt(3));
				list.add(file);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if(rs!=null) rs.close();
				if(pstmt!=null) pstmt.close();
				if(con!=null) con.close();
			} catch (Exception e2) {
				e2.printStackTrace();
			}
		}
		return list;
	}

}





















