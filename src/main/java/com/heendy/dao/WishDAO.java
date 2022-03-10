package com.heendy.dao;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.heendy.utils.DBManager;

import oracle.jdbc.OracleTypes;

public class WishDAO {
	private WishDAO() {  } //�̱��� ���� ó��
    private static WishDAO instance = new WishDAO();
    public static WishDAO getInstance() {
      return instance;
    }  
	  

    // ����Ŭ ����
    private Connection conn;
    
    // sql��������, �Լ� ȣ��
    private CallableStatement cs;
    
    // ���ƿ� insert
	public int insertWish(int memberId, int productId, int companyId) {
	    int result = 0;	
	    String sql = "{CALL sp_insert_wish(?, ?, ?)}";
	    		
	    conn = null;
	    cs = null;
	    System.out.println("DAO : insertWish");
	    try {
	    	conn = DBManager.getConnection();
	    	cs = conn.prepareCall(sql);
		    cs.setInt(1, memberId);
		    cs.setInt(2, productId);
		    cs.setInt(3, companyId);
		    result = cs.executeUpdate();
		    System.out.println(result);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, cs);
	    }
	    return result;
	}
	
	// ���ƿ� delete
	public int deleteWish(int memberId, int productId) {
	    int result = 0;	
	    String sql = "{CALL sp_delete_wish(?, ?)}";
	    conn = null;
	    cs = null;
	    System.out.println("DAO : deleteWish");
	    try {
	    	conn = DBManager.getConnection();
	    	cs = conn.prepareCall(sql);
		    cs.setInt(1, memberId);
		    cs.setInt(2, productId);
		    result = cs.executeUpdate();
		    System.out.println(result);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, cs);
	    }
	    return result;
	}
	
	// ���ƿ� ����
	public int wishIs(int memberId, int productId) {
		int result = 0;	
	    String sql = "{CALL sp_is_wish(?,?,?)}";
	    conn = null;
	    cs = null; 
	    try {
	    	conn = DBManager.getConnection();
	    	cs = conn.prepareCall(sql);
	    	cs.setInt(1, memberId);
	    	cs.setInt(2, productId);
		    cs.registerOutParameter(3, OracleTypes.INTEGER);
	    	cs.executeUpdate();
	    	result = cs.getInt(3);
	    } catch (Exception e) {
	    	e.printStackTrace();
	    } finally {
	    	DBManager.close(conn, cs);
	    }
		return result;
	}
}
