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

import org.apache.jasper.tagplugins.jstl.core.Out;

/**
 * Servlet implementation class GetEntryData
 */
@WebServlet("/GetEntryData")
public class GetEntryData extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public GetEntryData() {
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
		// process the request: get data associated with entry specified by entryID
		response.setContentType("text/html");
		
		String dbURL = "jdbc:mysql://localhost:3306/cartoonCatalog?serverTimezone=UTC";
		
		String useDBQuery = "use cartoonCatalog;";
		
		String getEntryDataQuery = "select Entry.Title, Entry.AirDates, Entry.ReleaseDate,"
				+ "Entry.Runtime, Entry.Genre, Entry.Category, Entry.Description, Entry.imgName"
				+ " from Entry"
				+ " where EntryID = ?";
		
		String getReviewDataQuery = "select Review.Nickname, Review.Title, Review.Rating,"
				+ "Review.Date, Review.Content"
				+ " from Entry, Review"
				+ " where Entry.EntryID = Review.EntryID"
				+ " and Entry.EntryID = ?"
				+ " order by Review.Date desc;";
		
		String entryID = request.getParameter("EntryID");
		
		String username = "root";
		String password = "ajgopattymn7890"; // fill in password, not filled in for security purposes
		
		try {
			Connection connection = DriverManager.getConnection(dbURL, username, password);
			
		    PreparedStatement useDBStmt = connection.prepareStatement(useDBQuery);
		    useDBStmt.executeQuery();
		    
		    PreparedStatement getEntryDataPstmt = connection.prepareStatement(getEntryDataQuery);
		    getEntryDataPstmt.setString(1, entryID);
		    
		    ResultSet entryRS = getEntryDataPstmt.executeQuery();
		    
		    Entry entry = new Entry();
		    while(entryRS.next()) {
		    	String title = entryRS.getString(1);
		    	String airDates = entryRS.getString(2);
		    	String releaseDate = entryRS.getString(3);
		    	String runtime = entryRS.getString(4);
		    	String genre = entryRS.getString(5);
		    	String category = entryRS.getString(6);
		    	String description = entryRS.getString(7);
		    	String imgName = entryRS.getString(8);
		    	
		    	entry.setEntryID(entryID);
		    	entry.setTitle(title);
		    	entry.setAirDates(airDates);
		    	entry.setReleaseDate(releaseDate);
		    	entry.setRuntime(runtime);
		    	entry.setGenre(genre);
		    	entry.setCategory(category);
		    	entry.setDescription(description);
		    	entry.setImgName(imgName);
		    }
		    
		    request.setAttribute("entry", entry);
		    
		    PreparedStatement getReviewDataPstmt = connection.prepareStatement(getReviewDataQuery);
		    getReviewDataPstmt.setString(1, entryID);
		    
		    ResultSet reviewRS = getReviewDataPstmt.executeQuery();
		    
		    ArrayList<Review> reviews = new ArrayList<Review>();
		    while(reviewRS.next()) {
		    	String nickname = reviewRS.getString(1);
		    	String title = reviewRS.getString(2);
		    	String rating = reviewRS.getString(3);
		    	String date = reviewRS.getString(4);
		    	String content = reviewRS.getString(5);
		    	
		    	Review review = new Review();
		    	review.setNickname(nickname);
		    	review.setTitle(title);
		    	review.setRating(rating);
		    	review.setDate(date);
		    	review.setContent(content);
		    	
		    	reviews.add(review);
		    }
		    
		    request.setAttribute("reviews", reviews);
		    
		    connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// After getting the entry data of entry specified by entryID, go to the entry page with the to display results to user
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/entry.jsp");
		dispatcher.forward(request, response);
	}

}
