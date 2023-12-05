package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class InsertTest {
	public static void main(String[] args) {
		insert("모자");
	}
	
	//실제 쿼리문 작성되는 메서드
	public static void insert(String cate_name) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		try {
			Class.forName("com.mysql.jdbc.Driver");
			String url = "jdbc:mysql://localhost/shopping_mall";
			conn = DriverManager.getConnection(url,"root","1234");
			
			String sql = "INSERT INTO category_table(cate_name) VALUES(?)";
			
			//쿼리실행
			
			//쿼리문 준비
			pstmt = conn.prepareStatement(sql);
			
			//어떤 항목에 어떤 값을 넣게될지 지정
			pstmt.setString(1, cate_name);
			
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
