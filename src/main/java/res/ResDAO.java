package res;

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

public class ResDAO {
    private Connection conn;
    private PreparedStatement pstmt;
    private ResultSet rs;

    private Context init;
    private DataSource ds;

    private static ResDAO instance = new ResDAO();

    public static ResDAO getInstance() {
        return instance;
    }

    private ResDAO() {
        try {
            init = new InitialContext();
            ds = (DataSource) init.lookup("java:comp/env/jdbc/oracle");
        } catch (NamingException e) {
            e.printStackTrace();
        }
    }

    private void close() {
        try {
            if (rs != null)
                rs.close();
            if (pstmt != null)
                pstmt.close();
            if (conn != null)
                conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    private ResDTO mapping(ResultSet rs) throws SQLException {
        ResDTO dto = new ResDTO();
        dto.setIdx(rs.getInt("idx"));
        dto.setName(rs.getString("name"));
        dto.setRes_year(rs.getString("res_year"));
        dto.setRes_month(rs.getString("res_month"));
        dto.setRes_day(rs.getString("res_day"));
        dto.setRes_hour(rs.getString("res_hour"));
        dto.setRes_minute(rs.getString("res_minute"));
        dto.setAdult(rs.getString("adult"));
        dto.setChil(rs.getString("chil"));
        dto.setMember_userid(rs.getString("member_userid"));
        return dto;
    }

	public int delete(String member_userid) {
		int row = 0;
		String sql = "update board set deleted = 1 where member_userid = ?";
		try {
			conn = ds.getConnection();
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, member_userid);
			row = pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		} finally { close(); }
			return row;
	}

    public int insert(ResDTO dto) {
        int row = 0;

        String sql = "insert into res (member_userid, name, res_year, res_month, res_day, res_hour, res_minute, adult, chil) "
        		+ "values (?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, dto.getMember_userid());
            pstmt.setString(2, dto.getName());
            pstmt.setString(3, dto.getRes_year());
            pstmt.setString(4, dto.getRes_month());
            pstmt.setString(5, dto.getRes_day());
            pstmt.setString(6, dto.getRes_hour());
            pstmt.setString(7, dto.getRes_minute());
            pstmt.setString(8, dto.getAdult());
            pstmt.setString(9, dto.getChil());
            row = pstmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }
        return row;
    }
    
    public ResDTO selectByUserId(String userId) {
        ResDTO dto = null;

        String sql = "SELECT * FROM res WHERE member_userid = ?";

        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, userId);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                dto = mapping(rs);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            close();
        }

        return dto;
    }
    
 // ResDAO.java

    public List<ResDTO> selectAll(String member_userid) {
        List<ResDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM res WHERE member_userid = ?";
        try {
            conn = ds.getConnection();
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, member_userid);
            rs = pstmt.executeQuery();
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
    
    public List<ResDTO> selectListByWriter(String member_userid) {
	       ArrayList<ResDTO> list = new ArrayList<>();
	       String sql ="select * from res where member_userid = ?";
	       try {
	          conn =ds.getConnection();
	          pstmt = conn.prepareStatement(sql);
	          pstmt.setString(1, member_userid);
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

}
