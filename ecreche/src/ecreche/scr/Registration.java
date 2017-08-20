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
 * Servlet implementation class Registration
 */
@WebServlet("/Registration")
public class Registration extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null;
	
	
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Registration() {
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
		int userid=Integer.parseInt(request.getParameter("userid"));
		String pname=request.getParameter("pname");
		long phoneno=Long.parseLong(request.getParameter("phoneno"));
		String email=request.getParameter("email");
		String kname=request.getParameter("kname");
		String age=request.getParameter("age");
		String gender=request.getParameter("gender");
		String program=request.getParameter("program");
		String draftno=request.getParameter("draftno");
		UserDetail ud=new UserDetail();
		ud.setUserid(userid);
		ud.setPname(pname);
		ud.setPhoneno(phoneno);
		ud.setEmail(email);
		ud.setKname(kname);
		ud.setAge(age);
		ud.setGender(gender);
		ud.setProgram(program);
		ud.setDraftno(draftno);
		
		String strsql="insert into registration values(?,?,?,?,?,?,?,?,?,?)";
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setInt(1, ud.getUserid());
			ps.setString(2,ud.getPname());
			ps.setLong(3, ud.getPhoneno());
			ps.setString(4,ud.getEmail());
			ps.setString(5,ud.getKname());
			ps.setString(6,ud.getAge());
			ps.setString(7,ud.getGender());
			ps.setString(8,ud.getProgram());
			ps.setString(9,ud.getDraftno());
			ps.setBoolean(10, false);
			
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				con.setAutoCommit(true);
				response.sendRedirect("/ecreche/jsp/msg.jsp");
			}
			
		} 
		catch (SQLException se)
		{
			// TODO: handle exception
			System.out.println(se);
		}
		
		
	}

}
