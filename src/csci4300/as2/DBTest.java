package csci4300.as2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class DBTest
 */
@WebServlet("/DBTest")
public class DBTest extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public DBTest() {
        super();
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<html><head>");
		out.println("<title>DBTest - Example</title>");
		out.println("</head><body><h1>DBTest - Example");
		
		String dbURL = "jdbc:mysql://localhost:3306/world?serverTimezone=UTC";
		
		String useDBQuery = "use cartoonCatalog;";
		
		String testQuery = "SELECT * FROM cartoonCatalog.Entry;";
		
		String username = "root";
		String password = ""; // fill in password, not filled in for security purposes
		
		try {
			Connection connection = DriverManager.getConnection(dbURL, username, password);
			
		    PreparedStatement useDBStmt = connection.prepareStatement(useDBQuery);
		    useDBStmt.executeQuery();
		    
		    PreparedStatement testPstmt = connection.prepareStatement(testQuery);
		    
		    ResultSet rs = testPstmt.executeQuery();
		    
		    out.println("<table border='1'><th>EntryID</th><th>Title</th>");
		    out.println("<th>AirDates</th><th>ReleaseDate</th><th>Runtime</th>");
		    out.println("<th>Genre</th><th>Category</th><th>Description</th>");
		    
		    while(rs.next()) {
		    	out.println("<tr>");
		    	out.println("<td>" + rs.getString(1) + "</td><td>" + rs.getString(2) + "</td>");
		    	out.println("<td>" + rs.getString(3) + "</td><td>" + rs.getString(4) + "</td><td>" + rs.getString(5) + "</td>");
		    	out.println("<td>" + rs.getString(6) + "</td><td>" + rs.getString(7) + "</td><td>" + rs.getString(8) + "</td>");
		    	out.println("</tr>");
		    }
		    
		    connection.close();
		    
		    out.println("</table>");
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		out.println("</body></html>");
		out.close();
	}

}
