package mvc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import util.DBUtil3;
import mvc.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao {
	
	// MemberVO의 내용을 DB에 insert하는 메서드
	@Override
	public int insertMember(MemberVO memvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			String sql = "insert into mymember(mem_id, mem_name, mem_tel, mem_addr) values (?, ?, ?, ?)";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memvo.getMem_id());
			pstmt.setString(2, memvo.getMem_name());
			pstmt.setString(3, memvo.getMem_tel());
			pstmt.setString(4, memvo.getMem_addr());
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			cnt = 0; // 처리가 잘못되면 0을 반환
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e){}
			if(conn!=null) try{ conn.close(); }catch(SQLException e){}
		}
		return cnt;
	}
	
	// 회원 정보를 삭제하는 메서드
	@Override
	public int deleteMember(String memId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int cnt = 0;
		try {
			conn = DBUtil3.getConnection();
			String sql = "delete from mymember where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1, memId);
			
			cnt = pstmt.executeUpdate();
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e){}
			if(conn!=null) try{ conn.close(); }catch(SQLException e){}
		}
		return cnt;
	}
	
	// 회원 정보를 수정하는 메서드
	@Override
	public int updateMember(MemberVO memvo) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		
		int cnt = 0;
		
		try {
			conn = DBUtil3.getConnection();
			String sql = "update mymember set mem_name = ? , mem_tel = ? , mem_addr = ? where mem_id = ?";
			
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memvo.getMem_name());
			pstmt.setString(2, memvo.getMem_tel());
			pstmt.setString(3, memvo.getMem_addr());
			pstmt.setString(4, memvo.getMem_id());
			
			cnt = pstmt.executeUpdate();
			
			
		} catch (SQLException e) {
			cnt = 0;
			e.printStackTrace();
		} finally {
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e){}
			if(conn!=null) try{ conn.close(); }catch(SQLException e){}
		}
		return cnt;
	}
	
	// 회원 전체 정보를 List에 담아 반환하는 메서드
	@Override
	public List<MemberVO> getAllMember() {
		List<MemberVO> mList = new ArrayList<MemberVO>();
		Connection conn = null;
		Statement stmt = null;
		ResultSet rs = null;
		
		try {
			conn = DBUtil3.getConnection();
			String sql="select * from mymember";
			
			stmt = conn.createStatement();
			rs = stmt.executeQuery(sql);
			
			while(rs.next()){
				MemberVO mv = new MemberVO();
				mv.setMem_id(rs.getString("mem_id"));
				mv.setMem_name(rs.getString("mem_name"));
				mv.setMem_tel(rs.getString("mem_tel"));
				mv.setMem_addr(rs.getString("mem_addr"));
				mList.add(mv);
			}
			
		} catch (SQLException e) {
			mList = null;
			e.printStackTrace();
		} finally {
			if(conn!=null) try{ conn.close(); }catch(SQLException e){}
			if(stmt!=null) try{ stmt.close(); }catch(SQLException e){}
			if(rs!=null) try{ rs.close(); }catch(SQLException e){}
		}
		
		return mList;
	}
	
	// 
	@Override
	public boolean getMember(String memId) {
		Connection conn = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		int count = 0;
		boolean check = false;
		
		try {
			conn = DBUtil3.getConnection();
			String sql = "select count(*) cnt from mymember where mem_id = ?";
			pstmt = conn.prepareStatement(sql);
			
			pstmt.setString(1, memId);
			rs = pstmt.executeQuery();
			
			if(rs.next()){
				count = rs.getInt("cnt");
			}
			if(count>0){
				check = true;
			} 
			
		} catch (SQLException e) {
			check = false;
		} finally {
			if(conn!=null) try{ conn.close(); }catch(SQLException e){}
			if(pstmt!=null) try{ pstmt.close(); }catch(SQLException e){}
			if(rs!=null) try{ rs.close(); }catch(SQLException e){}
		}
		return check;
	}

}
