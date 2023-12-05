package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.mysql.cj.xdevapi.Statement;

public class DeleteTest {
	public static void main(String[] args) {
		delete("집게사장");
	}
	
	//실제 쿼리문 작성되는 메서드
	public static void delete(String memberName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/shopping_mall";
			conn = DriverManager.getConnection(url,"root","yong01");
			
			String sql = "DELETE FROM member_table WHERE member_name='"+memberName+"'";
			
			//쿼리실행
			
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			
			// 실제로 지정한 항목에 지정한 값을 넣기위해 쿼리문 실행
			int count = pstmt.executeUpdate();
			
			if(count == 0) {
				System.out.println("데이터 입력 실패");
			}else {
				System.out.println("데이터 입력 성공");
			}
			
		} catch (ClassNotFoundException e) {	
			e.printStackTrace();
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		finally {
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();	
				}
				if(pstmt != null && !pstmt.isClosed()) {
					pstmt.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}
	
}
