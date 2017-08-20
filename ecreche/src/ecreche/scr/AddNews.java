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

import ecreche.bean.UserDetail;

/**
 * Servlet implementation class AddNews
 */
@WebServlet("/AddNews")
public class AddNews extends HttpServlet {
	Connection con=null;
	PreparedStatement ps=null;
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AddNews() {
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
		String newsid=request.getParameter("newsid");
		String topic=request.getParameter("topic");
		String content=request.getParameter("content");
	
		
		NewsDetail ud=new NewsDetail();
		ud.setNewsid(newsid);
		ud.setTopic(topic);
		ud.setContent(content);
		String strsql="insert into news values(?,?,?,?)";
		try
		{
			con.setAutoCommit(false);
			ps=con.prepareStatement(strsql);
			ps.setString(1, ud.getNewsid());
			ps.setString(2,ud.getTopic());
		
			ps.setString(3,ud.getContent());
			ps.setDate(4, null);
			int rw=ps.executeUpdate();
			if(rw>0)
			{
				con.setAutoCommit(true);
				response.sendRedirect("/ecreche/jsp/addnews.jsp");
			}
			
		} 
		catch (SQLException se)
		{
			// TODO: handle exception
			System.out.println(se);
		}
	}

}
