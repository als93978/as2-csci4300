<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="csci4300.as2.Entry" %>
<%@ page import="csci4300.as2.Review" %>

<html lang="en">
  
  <head>
    <title>CartoonCatalog | Entry: Spongebob Squarepants</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
    <script src="https://kit.fontawesome.com/0318fd2bd1.js" crossorigin="anonymous"></script>
    <script src="outline.js"></script>
  </head>

  <body>
    <div class="headerContainer">
      <header class="header">
	<nav class="headerNav">
	  <h1 class="logo"><a href="index.html">Cartoon<span class="logo2Half">Catalog</span></a></h1>

	</nav>
      </header>
    </div>

    <div class="contentContainer">
      <%
        Entry entry = (Entry) request.getAttribute("entry");
        
        String entryID = entry.getEntryID();
        String title = entry.getTitle();
        String airDates = entry.getAirDates();
        String releaseDate = entry.getReleaseDate();
        String runtime = entry.getRuntime();
        String genre = entry.getGenre();
        String category = entry.getCategory();
        String description = entry.getDescription();
      	String imgName = entry.getImgName();
      %>
    
      <div class="banner" <% out.println("style='background-image: url(\"img/" + imgName + "\"'"); %>>
      </div>
      
      <div class="content">
        <div class="entryContent">
          <div class="tableArea">
            <h1 class="entryTitle"><%= title %></h1>
            
            <table>
              <tr>
                <th>Air Dates</th>
                <td><%= airDates %></td>
              </tr>

              <tr>
                <th>ReleaseDate</th>
                <td><%= releaseDate %></td>
              </tr>

              <tr>
                <th>Runtime</th>
                <td><%= runtime %></td>
              </tr>

              <tr>
                <th>Genre</th>
                <td><%= genre %></td>
              </tr>
              
              <tr>
              	<th>Category</th>
              	<td><%= category %></td>
              </tr>

              <tr>
                <th>Description</th>
                <td><%= description %></td>
              </tr>
            </table>
          </div>

          <div class="reviewArea">
            <div class="userReviewHeader">
              <h3>User Reviews</h3>
            </div>
            
			<%
				ArrayList<Review> reviews = (ArrayList<Review>) request.getAttribute("reviews");
			
				if(reviews != null) {
					for(int i = 0; i < reviews.size(); i++) {
						Review review = reviews.get(i);
						
						out.println("<div class='reviewBox'>");
						out.println("<p>Nickname: <span class='userTextColor'>"
								+ review.getNickname() + "</span></p>");
						out.println("<p class='goldUnderline'>Rating: "
								+ review.getRating() + " out of 5</p>");
						out.println("<p>Date: " + review.getDate() + "</p>");
						out.println("<h3>" + review.getTitle() + "</h3>");
						out.println("<p>" + review.getContent() + "</p>");
						out.println("</div>");
					}
				}
			%>
            
            <div class="newReviewBox">
              <h3>New Review</h3>
              <form action="SubmitReview" method="POST" accept-charset="UTF-8">
              	<p>Nickname: <input class="nicknameInput" type="text" name="nickname" required>
              
                <p>Rating: <input class="ratingInput" type="number" name="rating" minlength="1" maxlength="1" size="1" min="0" max="5" required></p>

				<p>Review Title: <input class="reviewTitleInput" type="text" name="title" Required></p>

                <textarea class="reviewTextArea" name="content" rows="15" placeholder="Write your review here..." spellcheck="true" required></textarea>
                
                <% out.println("<input type='hidden' name='EntryID' value='" + entryID + "'" + "/>"); %>
                
                <div class="publishReviewButtonContainer">
                  <button type="submit" class="publishReviewButton">Publish Review</button>
                </div>
              </form>
            </div>
          </div>

          <!-- <div class="bottomButtonContainer"> -->
	    	<!-- <a href="user.html" class="bottomButton">Add to Favorites</a> -->
	  	  <!-- </div> -->
        </div>
      </div>
    </div>

    <div class="footerContainer">
      <footer class="footer">
	<h1 class="footerLogo"><a href="index.html">Cartoon<span class="logo2Half">Catalog</span></a></h1>

      </footer>
    </div>
  </body>
  
</html>

