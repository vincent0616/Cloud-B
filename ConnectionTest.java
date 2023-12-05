package jdbc;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

//MySQL(DBMS) - JAVA 프로그램(jdbc) 연결 테스트

// JDBC에서 쿼리문 작성 주의사항
// 1. JDBC에서는 세미콜론(;) 빼고 작성
// 2. SELECT * FROM 보다는 특정 컬럼을 명시하는게 좋다
// 3. 쿼리문으로 원하는 결과를 한번에 얻도록 작성(쿼리문으로 값을 가져오고 가져온 값을 추가적인 작업하는것은 지양)
// 4. 쿼리문 들여쓰기할때 띄어쓰기 주의

public class ConnectionTest {
	public static void main(String[] args) {
		//java.sql.Connection
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
	
		try {
			//어떤 DBMS를 쓸지에 대한 설정 - 해당하는 DB 드라이버를 로드
			Class.forName("com.mysql.jdbc.Driver");
			
			// 드라이버 매니저에게 Connection 객체 요청
			String url = "jdbc:mysql://localhost/shopping_mall";
			conn = DriverManager.getConnection(url,"root","1234");
			
			// 쿼리문 실행을 위한 Statement 객체 생성
			stmt = conn.createStatement();
			
			// 쿼리문 작성		
			String sql = "SELECT * FROM member_table";
			
			//실제 쿼리문 실행
			rs = stmt.executeQuery(sql);
			
			//실제 쿼리문 콘솔에서 확인
			//rs.next() -> ResultSet에 next()메서드
			//다음 결과값이 있으면 true, 마지막 결과값이면 false 반환
			while(rs.next()) {
				String id = rs.getString(1);
				String memberId = rs.getString(2);
				String memberPw = rs.getString(3);
				String memberName = rs.getString(4);
				String memberTel = rs.getString(5);
				String memberNic = rs.getString(6);
				
				System.out.println(id + " " + memberId + " " + memberPw + " " 
						+ memberName + " "+ memberTel + " " + memberNic);
				
			}
			
			
			System.out.println("연결에 성공했습니다");
			
		} catch (ClassNotFoundException e) {
			System.out.println("실패");
			
		} catch (SQLException e) {
			System.out.println("에러항목 : " + e);
		}
		finally {
			//Connection 객체가 아직 실행되고 있으면(열려있으면) 닫아주는 기능
			try {
				if(conn != null && !conn.isClosed()) {
					conn.close();
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
	}

}
