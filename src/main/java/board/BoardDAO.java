package board;

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

public class BoardDAO {

	private Context init;
	private DataSource ds;
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private static BoardDAO instance = new BoardDAO();
	public static BoardDAO getInstance() {
		return instance;
	}
	
	private BoardDAO() {
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
	
	private BoardDTO mapping(ResultSet rs) throws SQLException {
		BoardDTO dto = new BoardDTO();
		dto.setIdx(rs.getInt("idx"));
		dto.setTitle(rs.getString("title"));
		dto.setWriter(rs.getString("writer"));
		dto.setContent(rs.getString("content"));
		dto.setImage(rs.getString("image"));
		dto.setIpaddr(rs.getString("ipaddr"));
		dto.setViewCount(rs.getInt("viewCount"));
		dto.setWriteDate(rs.getDate("writeDate"));
		dto.setNewPost(rs.getInt("newPost"));
		dto.setDeleted(rs.getInt("deleted"));
		dto.setImportlist(rs.getInt("importlist"));
	
		return dto;
	}
	
	public int selectCount(String search) {
	    int count = 0;
	    String sql = "select count(*) as count from board"
	            + " WHERE "
	            + "deleted = 0 AND "
	            + " (title LIKE '%' || ? || '%' OR "
	            + " writer LIKE '%' || ? || '%' OR " 
	            + " content LIKE '%' || ? || '%')";

	    try {
	    	Connection conn = ds.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, search);
	        pstmt.setString(2, search);
	        pstmt.setString(3, search);
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
                count = rs.getInt("count");
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    }finally {
	    	close();
	    }
	    return count;
	}
	
	// 게시글 목록 불러오기
	public List<BoardDTO> selectList(String search, Paging paging) {
	    ArrayList<BoardDTO> list = new ArrayList<>();
	    String sql = "SELECT * FROM board " +
	            "WHERE deleted = 0 AND (title LIKE '%' || ? || '%' OR " +
	            "writer LIKE '%' || ? || '%' OR content LIKE '%' || ? || '%') " +
	            "ORDER BY CASE WHEN writer = 'admin' THEN 0 ELSE 1 END, idx DESC "
	            + " offset ? rows"
	            + " fetch next ? rows only";
	    try {
	        Connection conn = ds.getConnection();
	        PreparedStatement pstmt = conn.prepareStatement(sql);
	        pstmt.setString(1, search);
	        pstmt.setString(2, search);
	        pstmt.setString(3, search);
	        pstmt.setInt(4, paging.getOffset());
	        pstmt.setInt(5, paging.getFetch());
	        ResultSet rs = pstmt.executeQuery();
	        while (rs.next()) {
	            list.add(mapping(rs));
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return list;
	}
	
	
	// 단일 게시글 불러오기 (ip주소 일부 가리기)
	public BoardDTO selectOne(int idx) {
		BoardDTO dto = null;
		String sql = "select * from board where idx = ? ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
				dto.setIpaddr(maskIPaddr(dto.getIpaddr()));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}
	
	private String maskIPaddr(String src) {	// 아이피 주소 원본(DB에서 가져온 값)
		String dst = "";
		int dotCount = 0;
		for(int i = 0; i < src.length(); i++) {
			char ch = src.charAt(i);
			if(ch == '.') dotCount += 1;
			if(dotCount >= 2 && '0' <= ch && ch <= '9') {
				dst += '*';
			}
			else {
				dst += ch;
			}
		}
		return dst;		// 뒷자리 숫자를 자릿수 맞춰서 *로 바꾼 문자열
	}
	
	// 글 작성하기
	public int insert(BoardDTO dto) {
		int row = 0;
		String sql = "insert into board (title, writer, content, image, ipaddr) "
				+ " values (?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImage());
			pstmt.setString(5, dto.getIpaddr());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// 삭제(update)
	public int delete(String writer) {
		int row = 0;
		String sql = "update board set deleted = 1 where writer = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, writer);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
			return row;
	}
	
	// 작성시간여부
	public String newpost(int idx) {
	    String result = ""; // 문자열로 반환
	    String sql = "SELECT idx, writeDate, " +
	            "CASE " +
	            "WHEN (SYSDATE - writeDate) > 1 THEN '0' " +
	            "WHEN (SYSDATE - writeDate) <= 1 THEN '1' " +
	            "END AS newPost " +
	            "FROM board WHERE idx = ?";
	    try {
	        conn = ds.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, idx);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            result = rs.getString("newPost"); // 문자열로 읽어오기
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally {
	        close();
	    }
	    return result;
	}
	
	// 공지
	public int importlist(int idx) {
	    int result = 0;
	    String sql = "select idx, writer, " +
	            " CASE " +
	            " WHEN writer = 'admin' THEN '1' " +
	            " WHEN writer != 'admin' THEN '0' " +
	            " END AS importlist " +
	            " FROM board WHERE idx = ?";
	    try {
	        conn = ds.getConnection();
	        pstmt = conn.prepareStatement(sql);
	        pstmt.setInt(1, idx);
	        rs = pstmt.executeQuery();
	        if (rs.next()) {
	            result = rs.getInt("importlist"); // importlist 값을 가져옴
	        }
	    } catch (SQLException e) {
	        e.printStackTrace();
	    } finally { 
	        close(); 
	    }
	    return result;
	}

	
	// 조회수 증가
	public int totalView(int idx) {
		int row = 0;
		String sql ="update board set viewCount = viewCount + 1 where idx = ?";
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
	
	
	public List<BoardDTO> selectListByWriter(String userid) {
	       ArrayList<BoardDTO> list = new ArrayList<>();
	       String sql ="select * from board where writer = ?";
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
	    
	    
	public int back(int idx) {
	       int row =0;
	       String sql="update board "
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

		
		
	public int modifyPost(BoardDTO dto) {
			int row=0;
			String sql="update board set title=?, content=? where idx=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1, dto.getTitle());
				pstmt.setString(2, dto.getContent());
				pstmt.setInt(3, dto.getIdx());
				row = pstmt.executeUpdate();
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}return row;
		}
	
	
	
}
