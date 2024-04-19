package board2;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class Board2DAO {

	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static Board2DAO instance = new Board2DAO();
	public static Board2DAO getInstance() {
		return instance;
	}
	
	private Board2DAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null) 		rs.close();
			if(pstmt != null) 	pstmt.close();
			if(conn != null) 	conn.close();
		}catch(SQLException e) {}
	}
	
	   private Board2DTO mapping(ResultSet rs) throws SQLException {
		      Board2DTO dto = new Board2DTO();
		      dto.setIdx(rs.getInt("idx"));
		      dto.setMtitle(rs.getString("mtitle"));
		      dto.setMenu_name(rs.getString("menu_name"));
		      dto.setMwriter(rs.getString("mwriter"));
		      dto.setMeatcontext(rs.getString("meatcontext"));
		      dto.setPhoto_review(rs.getString("photo_review"));
		      dto.setViewCount(rs.getInt("viewCount"));
		      dto.setWriteDate(rs.getDate("writeDate"));
		      dto.setPrice(rs.getInt("price"));
		      dto.setMeat_name(rs.getString("meat_name"));
		      dto.setDeleted(rs.getInt("deleted"));
		   
		      return dto;
		   }
	
	   public List<Board2DTO> selectList2(String meatname){
		      ArrayList<Board2DTO> list = new ArrayList<>();
		      String sql = "select * from board2 where menu_name=? and deleted = 0";
		      try {
		         Connection conn = ds.getConnection();
		         PreparedStatement pstmt = conn.prepareStatement(sql);
		         pstmt.setString(1, meatname);
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            list.add(mapping(rs));
		         }
		      }catch (SQLException e) {
		         e.printStackTrace();
		      }finally {close();}
		      return list;
		   }
		   // 게시글 목록 불러오기
		   public List<Board2DTO> selectList(String search) {
		       ArrayList<Board2DTO> list = new ArrayList<>();
		       String sql = "select * from board2"
		               + " WHERE "
		               + " deleted = 0 AND "
		               + " (mtitle LIKE '%' || ? || '%' OR "
		               + " mwriter LIKE '%' || ? || '%' OR " 
		               + " meatcontext LIKE '%' || ? || '%')" 
		               + " ORDER BY idx DESC";

		       try {
		          Connection conn = ds.getConnection();
		           PreparedStatement pstmt = conn.prepareStatement(sql);
		           pstmt.setString(1, search);
		           pstmt.setString(2, search);
		           pstmt.setString(3, search);
		           ResultSet rs = pstmt.executeQuery();
		           while (rs.next()) {
		                list.add(mapping(rs));
		           }
		       } catch (SQLException e) {
		           e.printStackTrace();
		       }finally {
		          close();
		       }
		       return list;
		   }
		   
		   // 단일 게시글 불러오기
		   public Board2DTO selectOne(int idx) {
		      Board2DTO dto = null;
		      String sql = "select * from board2 where idx = ? ";
		      try {
		         conn = ds.getConnection();
		         pstmt = conn.prepareStatement(sql);
		         pstmt.setInt(1, idx);
		         rs = pstmt.executeQuery();
		         while(rs.next()) {
		            dto = mapping(rs);
		         }
		      } catch (SQLException e) {
		         e.printStackTrace();
		      } finally { close(); }
		      return dto;
		   }
		   
		      // 글 작성하기
		      public int insert(Board2DTO dto) {
		         int row = 0;
		         String sql = "insert into board2 (meat_name, mtitle, menu_name, mwriter, price, meatcontext, deleted)"
		               + " values(?, ?, ?, ?, ?, ?, 0)";
		         try {
		            conn = ds.getConnection();
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, dto.getMeat_name());
		            pstmt.setString(2, dto.getMtitle());
		            pstmt.setString(3, dto.getMenu_name());
		            pstmt.setString(4, dto.getMwriter());
		            pstmt.setInt(5, dto.getPrice());
		            pstmt.setString(6, dto.getMeatcontext());
		            pstmt.setInt(6, dto.getDeleted());
		            row = pstmt.executeUpdate();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         } finally { close(); }
		         return row;
		      }
		      
		      // 삭제(update)
		      public int delete(int idx) {
		         int row = 0;
		         String sql = "update board2 set deleted = 1 where idx = ?";
		         try {
		            conn = ds.getConnection();
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setInt(1, idx);
		            row = pstmt.executeUpdate();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         } finally { close(); }
		            return row;
		      }
		      
		         // 삭제여부
		       public List<Board2DTO> selectListByWriter(String userid) {
		          ArrayList<Board2DTO> list = new ArrayList<>();
		          String sql ="select * from board2 where mwriter = ?";
		          try {
		             conn =ds.getConnection();
		             pstmt = conn.prepareStatement(sql);
		             pstmt.setString(1, userid);
		              rs = pstmt.executeQuery();
		              while(rs.next()) {
		                 list.add(mapping(rs));
		              }
		          } catch (Exception e) {
		             e.printStackTrace();
		          }finally {
		             close();
		          }
		          
		          return list;   
		       }
		       
		       // 삭제 복원   
		       public int back(int idx) {
		          int row =0;
		          String sql="update board2 "
		                + "    set deleted = 0"
		                + "    where idx = ? ";
		          try {
		             conn = ds.getConnection();
		             pstmt = conn.prepareStatement(sql);
		             pstmt.setInt(1, idx);
		             row =pstmt.executeUpdate();
		          } catch (Exception e) {
		             e.printStackTrace();
		          }
		          return row;
		          
		       }

		   
		      
		      // 조회수 증가
		      public int totalView(int idx) {
		         int row = 0;
		         String sql ="update board2 set viewCount = viewCount + 1 where idx = ?";
		         try {
		            conn = ds.getConnection();
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setInt(1, idx);
		            row = pstmt.executeUpdate();
		         } catch (SQLException e) {
		            e.printStackTrace();
		         } finally {
		            close();
		         }
		         return row;
		      }
		      
		      // 게시물 수정
		      public int modifyPost(Board2DTO dto) {
		         int row=0;
		         String sql="update board2 set mtitle=?, meatcontext=? where idx=?";
		         try {
		            conn = ds.getConnection();
		            pstmt = conn.prepareStatement(sql);
		            pstmt.setString(1, dto.getMtitle());
		            pstmt.setString(2, dto.getMeatcontext());
		            pstmt.setInt(3, dto.getIdx());
		            row = pstmt.executeUpdate();
		         } catch (Exception e) {
		            e.printStackTrace();
		         }finally {
		            close();
		         }return row;
		      }
		      
		      
		      
		   }
