package assess;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class AssessDAO {
   private Context init;
   private DataSource ds;
   
   private Connection conn;
   private PreparedStatement pstmt;
   private ResultSet rs;
   
   private static AssessDAO instance = new AssessDAO();
   public static AssessDAO getInstance() {
      return instance;
   }
   
   private AssessDAO() {
      try {
         init = new InitialContext();
         ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
      } catch (NamingException e) {
         e.printStackTrace();
      }
   }
   
   private void close() {
      try {
         if(rs != null)       rs.close();
         if(pstmt != null)    pstmt.close();
         if(conn != null)    conn.close();
      } catch(SQLException e) {
         e.printStackTrace();
      }
   }
   
   private AssessDTO mapping(ResultSet rs) throws SQLException {
      AssessDTO dto = new AssessDTO();
      dto.setIdx(rs.getInt("idx"));
      dto.setMember_userid(rs.getString("member_userid"));
      dto.setLikecount(rs.getInt("likecount"));
      dto.setHatecount(rs.getInt("hatecount"));
      
      return dto;
   }
   
   public int updateAssessCount(String memberUserId, String action) {
	      Connection conn = null;
	      PreparedStatement pstmt = null;
	      int updatedCount = 0;

	      try {
	         conn = ds.getConnection();

	         String sql = "";
	         if ("like".equals(action)) {
	            sql = "UPDATE assess SET likecount = likecount + 1 WHERE member_userid = ?";
	         } else if ("dislike".equals(action)) {
	            sql = "UPDATE assess SET hatecount = hatecount + 1 WHERE member_userid = ?";
	         }

	         pstmt = conn.prepareStatement(sql);
	         pstmt.setString(1, memberUserId);

	         updatedCount = pstmt.executeUpdate();
	      } catch (SQLException e) {
	         e.printStackTrace();
	      } finally {
	         close();
	      }

	      return updatedCount;
	   }
   
	// AssessDAO 클래스에 추가
	public boolean hasUserAssessed(String memberUserId, int idx) {
	   Connection conn = null;
	   PreparedStatement pstmt = null;
	   ResultSet rs = null;
	   boolean hasAssessed = false;
	
	   try {
	      conn = ds.getConnection();
	      String sql = "SELECT COUNT(*) FROM assess WHERE member_userid = ? AND idx = ?";
	      pstmt = conn.prepareStatement(sql);
	      pstmt.setString(1, memberUserId);
	      pstmt.setInt(2, idx);
	      rs = pstmt.executeQuery();
	
	      if (rs.next()) {
	         int count = rs.getInt(1);
	         hasAssessed = (count > 0);
	      }
	   } catch (SQLException e) {
	      e.printStackTrace();
	   } finally {
	      close();
	   }
	
	   return hasAssessed;
	}


}
