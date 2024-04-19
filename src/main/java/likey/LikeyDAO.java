package likey;

import java.lang.reflect.Member;
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

public class LikeyDAO {
	
	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static LikeyDAO instance = new LikeyDAO();
	public static LikeyDAO getInstance() {
		return instance;
	}

	private  LikeyDAO() {
		try {
			init = new InitialContext();
			ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	
	private void close() {
		try {
			if(rs != null)		rs.close();
			if(pstmt != null)	pstmt.close();
			if(conn != null)	conn.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
}
	private LikeyDTO mapping(ResultSet rs) throws SQLException {
		LikeyDTO dto = new LikeyDTO();
		dto.setId(rs.getInt("id"));
		dto.setMember_userid(rs.getString("member_userid"));
		dto.setBoard_idx(rs.getInt("board_idx"));
		return dto;
	}
	
	//좋아요 판별
	public LikeyDTO checkLikey(String member_userid, int board_idx) {
		LikeyDTO dto = null;
		String sql = "select * from likey where member_userid = ? and board_idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_userid);
			pstmt.setInt(2, board_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new LikeyDTO();
				dto.setMember_userid(rs.getString("member_userid"));
				dto.setBoard_idx(rs.getInt("board_idx"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return dto;
	}
	//좋아요 클릭
	public int insert(String member_userid, int board_idx)  {
		int row = 0;
		String sql = "insert into likey (member_userid, board_idx) values ( ?, ? ) ";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_userid);
			pstmt.setInt(2, board_idx);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return row;
	}
	//좋아요 다시 클릭
	public int delete(int board_idx, String member_userid)  {
		int row = 0;
		String sql = "delete likey where board_idx = ? and member_userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			pstmt.setString(2, member_userid);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally {close();}
		return row;
	}
	
	//좋아요 카운트
	public LikeyDTO likeyCount(int board_idx) {
		LikeyDTO dto = null;
		String sql = "select count(*) as likeCount from likey where board_idx = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setInt(1, board_idx);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = new LikeyDTO();
				dto.setLikeCount(rs.getInt("likeCount"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return dto;
	}
	
	
	

}