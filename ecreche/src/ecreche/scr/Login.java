package ecreche.scr;


import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.mysql.jdbc.ResultSet;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private Connection con=null;
	private ResultSet rs=null;
	
	private PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
	HttpSession hs=null;

       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
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
		String userid=request.getParameter("userid");
		String upass=request.getParameter("userpass");
		String utype=request.getParameter("usertype");
		con=CrudOperation.createConnection();
		try
		{
			String strsql="select * from login where userid=? and userpass= ? and usertype=?";
			ps= con.prepareStatement(strsql);
			ps.setString(1, userid);;
			ps.setString(2, upass);
			ps.setString(3, utype);
			rs=(ResultSet) ps.executeQuery();
			if(rs.next()){
				hs=request.getSession();
				hs.setAttribute("userinfo",userid);
				
				if(utype.equals("admin"))
				{
					//response.sendRedirect("/ihotel/jsp/admin.jsp");
					response.sendRedirect("/ecreche/jsp/admin.jsp");
				}
				if(utype.equals("parent"))
				{
					response.sendRedirect("/ecreche/jsp/user.jsp");
				}
				if(utype.equals("caretaker"))
				{
					response.sendRedirect("/ecreche/jsp/caretaker.jsp");
				}
			}
			else
			{
				response.sendRedirect("/ecreche/jsp/login.jsp?msg1=Invalid userid password");
			}
		}
		catch(SQLException se)
		{
			System.out.println(se);
		}
		finally
		{
			try
			{
				if(rs!=null)
				{
					rs.close();
				}}
				catch(SQLException se)
				
					{
						System.out.println(se);
					}
					
				}
			
		
	}

}
