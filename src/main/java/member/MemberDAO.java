package member;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class MemberDAO {

	private Connection conn;
	private PreparedStatement pstmt;
	private ResultSet rs;
	
	private Context init;
	private DataSource ds;
	
	private static MemberDAO instance = new MemberDAO();
	public static MemberDAO getInstance() {
		return instance;
	}
	private MemberDAO() {
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
	
	private MemberDTO mapping(ResultSet rs) throws SQLException {
		MemberDTO dto = new MemberDTO();
		dto.setEmail(rs.getString("email"));
		dto.setGender(rs.getString("gender"));
		dto.setIdx(rs.getInt("idx"));
		dto.setUserid(rs.getString("userid"));
		dto.setUsername(rs.getString("username"));
		dto.setUserpw(rs.getString("userpw"));
		return dto;
	}
	
	// �쉶�썝 媛��엯
	public int insert(MemberDTO dto) {
		int row = 0;
		String sql = "insert into member (userid, userpw, username, email, gender) "
				+ "values (?, ?, ?, ?, ?)";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			pstmt.setString(3, dto.getUsername());
			pstmt.setString(4, dto.getEmail());
			pstmt.setString(5, dto.getGender());
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return row;
	}
	
	// �븘�씠�뵒 以묐났泥섎━

		public MemberDTO OkId(String userId) {
		    MemberDTO dto = null;
		    String sql = "SELECT * FROM member WHERE userid = ?";

		    try {
		        conn = ds.getConnection();
		        pstmt = conn.prepareStatement(sql);
		        pstmt.setString(1, userId);
		        ResultSet rs = pstmt.executeQuery();

		        while (rs.next()) {
		           dto = mapping(rs);
		       
		        }
		    } catch (SQLException e) {
		        e.printStackTrace();
		    } finally {
		        close();
		    }
		    return dto;
		}

	
	// 濡쒓렇�씤
	public MemberDTO login(MemberDTO dto) {
		MemberDTO login = null;
		String sql = "select * from member where userid = ? and userpw = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, dto.getUserid());
			pstmt.setString(2, dto.getUserpw());
			rs = pstmt.executeQuery();
			while(rs.next()) {
				login = mapping(rs);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
		return login;
	}
	
	// selectOne
	public MemberDTO selectOne(String userId) {
		MemberDTO dto = null;
		String sql ="select * from member where userId =?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				dto = mapping(rs);
			}
		}catch(Exception e) {
			
		}finally {
			close();
		}
		
		return dto;
		
	}
	// 硫ㅻ쾭 �닔�젙
	public int update(MemberDTO dto) {
		int row=0;
		String sql = "update member"
				+ "	set"
				+ "	userId=?,"
				+ "	userName=?,"
				+ "	userpw=?,"
				+ "	gender=?,"
				+ "	email=? "
				+ "	where"
				+ "	idx =?";
		 try {
			 conn = ds.getConnection();
			 pstmt = conn.prepareStatement(sql);
			 pstmt.setString(1, dto.getUserid());
				pstmt.setString(2, dto.getUsername());
				pstmt.setString(3, dto.getUserpw());
				pstmt.setString(4, dto.getGender());
				pstmt.setString(5, dto.getEmail());
				pstmt.setInt(6, dto.getIdx());
				row = pstmt.executeUpdate();
		 }catch (Exception e){
			 e.printStackTrace();
		 }finally {
			 close();
		 }
		 return row;
		}
		
	// �깉�눜
	public int delete(String userId) {
		int row = 0;
		String sql ="delete member where userid =?";
		try {
			conn =ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, userId);
			row = pstmt.executeUpdate();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			close();
		}
		return row;
	}
	
	
}