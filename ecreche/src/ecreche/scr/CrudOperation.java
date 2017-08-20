package ecreche.scr;
import java.util.*;
import java.sql.*;

import ecreche.bean.UserDetail;

public class CrudOperation {
	private static Connection con=null;
	private ResultSet rs=null;
	private PreparedStatement ps=null;
	private UserDetail ud=null;
	public static Connection createConnection()
	{
		try{
			Class.forName("com.mysql.jdbc.Driver");
			con=DriverManager.getConnection("jdbc:mysql://localhost:3306/creche","root","root");
			
		}
		catch(ClassNotFoundException|SQLException se)
		{
			System.out.println(se);
			
		}
		return con;
	}
	public ArrayList<UserDetail> showData(String sql)
	{
		ArrayList<UserDetail>uslist=new ArrayList<UserDetail>();
		con=createConnection();
		try{
			ps=con.prepareStatement(sql);
			rs=ps.executeQuery();
			while(rs.next())
			{
				ud=new UserDetail();
				ud.setPname(rs.getString("pname"));  
				ud.setPhoneno(rs.getLong("phoneno"));
				ud.setEmail(rs.getString("email"));
				ud.setUserid(rs.getInt("userid"));
				ud.setKname(rs.getString("kname"));
				uslist.add(ud);
				
			}
		}
		catch(SQLException se)
		{
		System.out.println(se);
		
		}
		return uslist;
		
	}
	
	

}
