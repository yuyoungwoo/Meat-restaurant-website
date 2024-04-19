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

public class MenuDAO {

		private Context init;
		private DataSource ds;
		
		private Connection conn;
		private PreparedStatement pstmt;
		private ResultSet rs;
		
		private static MenuDAO instance = new MenuDAO();
		public static MenuDAO getInstance() {
			return instance;
		}
		
		private MenuDAO() {
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
		
		private MenuDTO mapping(ResultSet rs) throws SQLException {
			MenuDTO dto = new MenuDTO();
			dto.setIdx(rs.getInt("idx"));
			dto.setContent(rs.getString("content"));
			dto.setMeatimage(rs.getString("meatimage"));
			dto.setPrice(rs.getInt("price"));
			dto.setMeatname(rs.getString("meatname"));
			dto.setName(rs.getString("name"));
			return dto;
		}
		
		// 게시글 목록 불러오기
		public List<MenuDTO> selectList() {
		    ArrayList<MenuDTO> list = new ArrayList<>();
		    String sql = "select * from menu";
		           
		    try {
		    	Connection conn = ds.getConnection();
		        PreparedStatement pstmt = conn.prepareStatement(sql);
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
		
		public MenuDTO selectOne(int idx) {
			MenuDTO dto = null;
			String sql="select * from menu where idx=?";
			try {
				conn = ds.getConnection();
				pstmt = conn.prepareStatement(sql);
				pstmt.setInt(1, idx);
				rs = pstmt.executeQuery();
				while(rs.next()) {
					dto = mapping(rs);
				}
			} catch (Exception e) {
				e.printStackTrace();
			}finally {
				close();
			}
			return dto;
		}
	
}
