package csci4300.as2;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SearchDB
 */
@WebServlet("/SearchDB")
public class SearchDB extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SearchDB() {
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
		// process the request, search the database for the keyword
		response.setContentType("text/html");
		
		PrintWriter out = response.getWriter();
		
		String dbURL = "jdbc:mysql://localhost:3306/cartoonCatalog?serverTimezone=UTC";
		
		String useDBQuery = "use cartoonCatalog;";
		
		String searchDBQuery = "select Entry.Title, Entry.ReleaseDate, Entry.Description"
				+ " from Entry"
				+ " where Entry.Title like ?"
				+ " or Entry.AirDates like ?"
				+ " or Entry.ReleaseDate like ?"
				+ " or Entry.Runtime like ?"
				+ " or Entry.Genre like ?"
				+ " or Entry.Category like ?"
				+ " or Entry.Description like ?;";
		
		String keyword = "%" + request.getParameter("keyword") + "%";
		
		String username = "root";
		String password = "ajgopattymn7890"; // fill in password, not filled in for security purposes
		
		try {
			Connection connection = DriverManager.getConnection(dbURL, username, password);
			
		    PreparedStatement useDBStmt = connection.prepareStatement(useDBQuery);
		    useDBStmt.executeQuery();
		    
		    PreparedStatement searchDBPstmt = connection.prepareStatement(searchDBQuery);
		    searchDBPstmt.setString(1, keyword);
		    searchDBPstmt.setString(2, keyword);
		    searchDBPstmt.setString(3, keyword);
		    searchDBPstmt.setString(4, keyword);
		    searchDBPstmt.setString(5, keyword);
		    searchDBPstmt.setString(6, keyword);
		    searchDBPstmt.setString(7, keyword);
		    
		    ResultSet rs = searchDBPstmt.executeQuery();
		    
		    ArrayList<SearchResult> searchResults = new ArrayList<SearchResult>();
		    while(rs.next()) {
		    	String title = rs.getString(1);
		    	String releaseDate = rs.getString(2);
		    	String summary = rs.getString(3);
		    	
		    	SearchResult searchResult = new SearchResult(title, releaseDate, summary);
		    	searchResults.add(searchResult);
		    }
		    
		    request.setAttribute("searchResults", searchResults);
		    
		    connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// After processing search request, go back to the search page with the response to display results to user
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/search.jsp");
		dispatcher.forward(request, response);
	}

}
