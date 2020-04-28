package csci4300.as2;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.text.DateFormat;
import java.util.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class SubmitReview
 */
@WebServlet("/SubmitReview")
public class SubmitReview extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public SubmitReview() {
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
		// process the request: write review data to DB
		response.setContentType("text/html");
		
		String dbURL = "jdbc:mysql://localhost:3306/cartoonCatalog?serverTimezone=UTC";
		
		String useDBQuery = "use cartoonCatalog;";
		
		String submitReviewQuery = "insert into Review(EntryID, Nickname, Title, Rating, Date, Content)"
				+ " values(?, ?, ?, ?, ?, ?);";
		
		String entryID = request.getParameter("EntryID");
		String nickname = request.getParameter("nickname");
		String title = request.getParameter("title");
		String rating = request.getParameter("rating");
		String date = getCurrentDate();
		String content = request.getParameter("content");
		
		String username = "root";
		String password = "ajgopattymn7890"; // fill in password, not filled in for security purposes
		
		try {
			Connection connection = DriverManager.getConnection(dbURL, username, password);
			
		    PreparedStatement useDBStmt = connection.prepareStatement(useDBQuery);
		    useDBStmt.executeQuery();
		    
		    PreparedStatement submitReviewPstmt = connection.prepareStatement(submitReviewQuery);
		    submitReviewPstmt.setString(1, entryID);
		    submitReviewPstmt.setString(2, nickname);
		    submitReviewPstmt.setString(3, title);
		    submitReviewPstmt.setString(4, rating);
		    submitReviewPstmt.setString(5, date);
		    submitReviewPstmt.setString(6, content);
		    
		    submitReviewPstmt.executeUpdate();
		    
		    connection.close();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// After getting the entry data of entry specified by entryID, go to the entry page with the to display results to user
		RequestDispatcher dispatcher = getServletContext().getRequestDispatcher("/GetEntryData");
		dispatcher.forward(request, response);
	}
	
	private String getCurrentDate() {
		Date date = new Date();
		
		return DateFormat.getDateTimeInstance().format(date);
		
//		Calendar calendar = Calendar.getInstance();
//		
//		String month = "";
//		int day = calendar.get(Calendar.DAY_OF_MONTH);
//		int year = calendar.get(Calendar.YEAR);
//		
//		switch(calendar.get(Calendar.MONTH)) {
//			case 0:
//				month = "Jan";
//				break;
//				
//			case 1:
//				month = "Feb";
//				break;
//				
//			case 2:
//				month = "Mar";
//				break;
//				
//			case 3:
//				month = "Apr";
//				break;
//				
//			case 4:
//				month = "May";
//				break;
//				
//			case 5:
//				month = "Jun";
//				break;
//				
//			case 6:
//				month = "Jul";
//				break;
//				
//			case 7:
//				month = "Aug";
//				break;
//				
//			case 8:
//				month = "Sep";
//				break;
//				
//			case 9:
//				month = "Oct";
//				break;
//				
//			case 10:
//				month = "Nov";
//				break;
//				
//			case 11:
//				month = "Dec";
//				break;
//		}
//		
//		return month + " " + day + ", " + year;
	}

}
