package nobodyDB;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class NobodyDAOimpl implements NobodyDAO {
	private Connection getConnection() throws SQLException {
		Connection conn = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			//String dburl = "jdbc:oracle:thin:@localhost:1521:xe";
			String dburl = "jdbc:oracle:thin:@192.168.0.32:1521:xe";
			conn = DriverManager.getConnection(dburl, "nobody", "1234");			
		} catch (ClassNotFoundException e) {
			System.err.println("JDBC 드라이버 로드 실패!");
		}
		return conn;
	}
	////////////////////////// 파일 업로드 관련 메소드 ///////////////////////////////////////////////
	public ArrayList<UploadVO> upload_getList(){
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		//	데이터 전송을 위한 리스트
		ArrayList<UploadVO> list = new ArrayList<>();
		
		try {
			conn = getConnection();
			stmt = conn.createStatement();
			String sql = "select rownum, up_title, up_content, up_task, up_date from upload";			
			rs = stmt.executeQuery(sql);
			
			while(rs.next()) {
				UploadVO guestbookVO = new UploadVO(						
						rs.getString(2),
						rs.getString(3),
						rs.getString(4),
						rs.getString(5),
						rs.getInt(1)
						);
				list.add(guestbookVO);
			}
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		}finally {
			try {
				if (rs != null) rs.close();
				if (stmt != null) stmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		
		return list;
	}
	
	public boolean upload_insert(UploadVO uploadVO) {
		Connection conn = null;
		PreparedStatement pstmt = null;		
		ResultSet rs = null;
		int result =0;
		try {
			conn = getConnection();			
			String sql = "insert into upload values(seq_upload_no.nextval, ?, ?, ?, sysdate)";
			pstmt = conn.prepareStatement(sql);			
			pstmt.setString(1, uploadVO.getUp_title());
			pstmt.setString(2, uploadVO.getUp_content());
			pstmt.setString(3, uploadVO.getUp_task());
			result  = pstmt.executeUpdate();			
			
		} catch (SQLException e) {
			System.err.println("ERROR:" + e.getMessage());
		} finally {
			try {
				if (rs != null) rs.close();
				if (pstmt != null) pstmt.close();
				if (conn != null) conn.close();
			} catch (Exception e) {
				System.err.println("ERROR:" + e.getMessage());
			}
		}
		return result ==1;
	}		
	
	////////////////////////// 공지사항 관련 메소드 ///////////////////////////////////////////////
	
	@Override
    public boolean notice_insert(noticeVO noticeVO) {
       Connection conn = null;
       PreparedStatement pstmt = null;
       int insertedCount = 0;
       
       try {
          conn = getConnection();
          String sql = "INSERT INTO notice " +
                "VALUES(nt_No_seq.nextval, " +
                "?, ?, sysdate)";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, noticeVO.getnt_Title());
          pstmt.setString(2, noticeVO.getnt_Content());
         
          
          insertedCount = pstmt.executeUpdate();
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       } finally {
          try {
             if (pstmt != null) pstmt.close();
             if (conn != null) conn.close();
          } catch (Exception e) {
             System.err.println("ERROR:" + e.getMessage());
          }
       }
       return insertedCount == 1;
    }
	
	@Override
    public List<noticeVO> notice_getList() {
       Connection conn = null;
       Statement stmt = null;
       ResultSet rs = null;
       //   데이터 전송을 위한 리스트
       List<noticeVO> list = new ArrayList<>();
       
       try {
          conn = getConnection();
          stmt = conn.createStatement();
          String sql = "SELECT rownum, nt_Title, " +
             "nt_Content, nt_Date FROM notice";
          
          rs = stmt.executeQuery(sql);
          
          while(rs.next()) {
             noticeVO noticeVO = new noticeVO(
                   rs.getLong(1),
                   rs.getString(2),
                   rs.getString(3),
                   rs.getString(4)
                   );
             list.add(noticeVO);
          }
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       }
       
       return list;
    }
	
	////////////////////////// 로그인 관련 메소드 ///////////////////////////////////////////////
    
    // 회원가입 한 모든 회원의 id,pw 정보 반환 메소드
    @Override
    public ArrayList<UserInfoVO> info_getList() {
       Connection conn = null;
       Statement stmt = null;
       ResultSet rs = null;
       //   데이터 전송을 위한 리스트
       ArrayList<UserInfoVO> list = new ArrayList<UserInfoVO>();
       
       try {
          conn = getConnection();
          stmt = conn.createStatement();
          String sql = "SELECT user_id, user_pw FROM userlogin";
          
          rs = stmt.executeQuery(sql);
          
          while(rs.next()) {
             UserInfoVO userinfoVO = new UserInfoVO(
                   rs.getString(1),
                   rs.getString(2)
                   );
             list.add(userinfoVO);
          }
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       }
       
       return list;
    }
    // 로그인한 회원 정보 반환 메소드
    @Override
    public UserInfoVO getInfo(String id) {
       Connection conn = null;
       PreparedStatement pstmt = null;
       UserInfoVO userinfoVO = null;
       ResultSet rs = null;
       
       try {
          conn = getConnection();
          String sql = "SELECT user_id, " +
                "user_name, user_part, user_birth " +
                "FROM userinfo " +
                "WHERE user_id=?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, id);
          rs = pstmt.executeQuery();
          
          if (rs.next()) {
             userinfoVO = new UserInfoVO(
                   rs.getString(1),
                   rs.getString(2),
                   rs.getString(3),
                   rs.getString(4)
                   );
          }
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       } finally {
          try {
             if (rs != null) rs.close();
             if (pstmt != null) pstmt.close();
             if (conn != null) conn.close();
          } catch (Exception e) {
             System.err.println("ERROR:" + e.getMessage());
          }
       }
       return userinfoVO;
    }
    
    // 회원가입 시 입력 데이터 DB에 저장 메소드
    @Override
    public boolean info_insert(UserInfoVO userinfoVO) {
       Connection conn = null;
       Connection conn2 = null;
       PreparedStatement pstmt = null;
       PreparedStatement pstmt2 = null;
       int insertedCount = 0;
       int insertedCount2 = 0;
       
       try {
          conn = getConnection();
          String sql = "INSERT INTO userInfo " +
                "VALUES(?, ?, ?, ?)";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, userinfoVO.getUser_Id());
          pstmt.setString(2, userinfoVO.getUser_Name());
          pstmt.setString(3, userinfoVO.getUser_Part());
          pstmt.setString(4, userinfoVO.getUser_Birth());
          
          insertedCount = pstmt.executeUpdate();
          
          conn2 = getConnection();
          String sql2 = "INSERT INTO userLogin " +
                "VALUES(?,?)";
          pstmt2 = conn2.prepareStatement(sql2);
          pstmt2.setString(1, userinfoVO.getUser_Id());
          pstmt2.setString(2, userinfoVO.getUser_Password());
          
          insertedCount2 = pstmt2.executeUpdate();
          
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       } finally {
          try {
             if (pstmt != null) pstmt.close();
             if (conn != null) conn.close();
             if (pstmt2 != null) pstmt2.close();
             if (conn2 != null) conn2.close();
          } catch (Exception e) {
             System.err.println("ERROR:" + e.getMessage());
          }
       }
       return insertedCount == 1;
    }
    
    //////////////////////////교육신청 관련 메소드 ///////////////////////////////////////////////
    
    @Override
    public List<applicantVO> getList() {
       Connection conn = null;
       Statement stmt = null;
       ResultSet rs = null;
       //   데이터 전송을 위한 리스트
       List<applicantVO> list = new ArrayList<>();
       
       try {
          conn = getConnection();
          stmt = conn.createStatement();
          String sql = "SELECT * FROM applicant";
          
          rs = stmt.executeQuery(sql);
          
          while(rs.next()) {
             applicantVO applicantvo = new applicantVO(
                 rs.getLong(1),
                   rs.getString(2),
                   rs.getString(3),
                   rs.getDate(4),
                   rs.getString(5)
                   );
             list.add(applicantvo);
          }
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       }
       
       return list;
    }
    
    @Override
    public applicantVO get(Long ac_No) {
       Connection conn = null;
       PreparedStatement pstmt = null;
       applicantVO applicantvo = null;
       ResultSet rs = null;
       
       try {
          conn = getConnection();
          String sql = "SELECT ac_no, " +
                "ac_name, ac_phone " +
                "ac_birth, ac_lang " +
                "FROM applicant " +
                "WHERE no=?";
          pstmt = conn.prepareStatement(sql);
          pstmt.setLong(1, ac_No);
          
          rs = pstmt.executeQuery();
          
          if (rs.next()) {                   
             
             applicantvo = new applicantVO(
                   rs.getLong(1),
                   rs.getString(2),
                   rs.getString(3),
                   rs.getDate(4),
                   rs.getString(5)
                   );
          }
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       } finally {
          try {
             if (rs != null) rs.close();
             if (pstmt != null) pstmt.close();
             if (conn != null) conn.close();
          } catch (Exception e) {
             System.err.println("ERROR:" + e.getMessage());
          }
       }
       return applicantvo;
    }

    @Override
    public boolean insert(applicantVO applicantvo) {
       Connection conn = null;
       PreparedStatement pstmt = null;
       int insertedCount = 0;
       
       try {
          conn = getConnection();
          String sql = "INSERT INTO applicant " +
                "VALUES(SEQ_applicant_no.NEXTVAL, " +
                "?, ?, ?, ?)";
          pstmt = conn.prepareStatement(sql);
          pstmt.setString(1, applicantvo.getName());
          pstmt.setString(2, applicantvo.getPhone());     
          pstmt.setDate(3, applicantvo.getBirth());
          pstmt.setString(4, applicantvo.getLang());
          
          insertedCount = pstmt.executeUpdate();
       } catch (SQLException e) {
          System.err.println("ERROR:" + e.getMessage());
       } finally {
          try {
             if (pstmt != null) pstmt.close();
             if (conn != null) conn.close();
          } catch (Exception e) {
             System.err.println("ERROR:" + e.getMessage());
          }
       }
       return insertedCount == 1;
    }
    
}
