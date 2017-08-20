package ecreche.scr;
import java.util.*;

import ecreche.bean.MsgDetail;

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
 * Servlet implementation class Compose
 */
@WebServlet("/Compose")
public class Compose extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null;
	
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Compose() {
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
		String msgid=request.getParameter("msgid");
		String subject=request.getParameter("sub");
		String msg=request.getParameter("msg");
		String senderid=request.getParameter("senderid");
		String receiverid=request.getParameter("receiverid");
		
		MsgDetail ud=new MsgDetail();
		ud.setMsgid(msgid);
		ud.setSubject(subject);
		ud.setMsg(msg);
		ud.setSenderid(senderid);
		ud.setReceiverid(receiverid);
		
		String strsql="insert into message values(?,?,?,?,?,?,?,?)";
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			
			ps.setString(1,ud.getMsgid());
			ps.setString(2,ud.getSubject());
			ps.setString(3,ud.getMsg());
			ps.setString(4,ud.getSenderid());
			ps.setString(5,ud.getReceiverid());
			
			ps.setBoolean(6, false);
			ps.setBoolean(7, false);
			ps.setDate(8, null);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				con.setAutoCommit(true);
				response.sendRedirect("/ecreche/jsp/message.jsp");
			}
			
		} 
		catch (SQLException se)
		{
			// TODO: handle exception
			System.out.println(se);
		}
	}

}
