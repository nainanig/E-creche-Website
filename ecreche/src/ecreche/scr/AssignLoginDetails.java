package ecreche.scr;

import ecreche.bean.*;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class AssignLoginDetails
 */
@WebServlet("/AssignLoginDetails")
public class AssignLoginDetails extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AssignLoginDetails() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		con=CrudOperation.createConnection();
		int userid=Integer.parseInt(request.getParameter("hdui"));
		String userpass=request.getParameter("txtpass");
	
		String usertype=request.getParameter("usertype");
		UserDetail ud=new UserDetail();
		ud.setUserid(userid);
		ud.setUserpass(userpass);
		
		ud.setUsertype(usertype);
		String strsql="insert into login values(?,?,?)";
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setInt(1, ud.getUserid());
			ps.setString(2,ud.getUserpass());
		
			ps.setString(3,ud.getUsertype());
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				con.setAutoCommit(true);
				response.sendRedirect("/ecreche/jsp/admin.jsp");
			}
			
		} 
		catch (SQLException se)
		{
			// TODO: handle exception
			System.out.println(se);
		}
	}

}
