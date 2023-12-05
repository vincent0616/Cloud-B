package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class UpdateTest {
	public static void main(String[] args) {
		update("플랑크톤","집게사장");
	}
	
	//실제 쿼리문 작성되는 메서드
	public static void update(String memberName, String beforeName) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/shopping_mall";
			conn = DriverManager.getConnection(url,"root","1234");
			
			String sql = "UPDATE member_table SET member_name = ? where member_name =?";
			
			//쿼리실행
			
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			
			//어떤 항목에 어떤 값을 넣게될지 지정
			pstmt.setString(1, memberName);
			pstmt.setString(2, beforeName);
			
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
