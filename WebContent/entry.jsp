<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="csci4300.as2.Entry" %>
<%@ page import="csci4300.as2.Episode" %>
<%@ page import="csci4300.as2.Review" %>

<html lang="en">
  
  <%
  	Entry entry = (Entry) request.getAttribute("entry");
        
    String entryID = entry.getEntryID();
    String entryTitle = entry.getTitle();
    String airDates = entry.getAirDates();
    String releaseDate = entry.getReleaseDate();
    String entryRuntime = entry.getRuntime();
    String genre = entry.getGenre();
    String category = entry.getCategory();
    String description = entry.getDescription();
    String imgName = entry.getImgName();
    String imgYPos = entry.getImgYPos();
  %>
  
  <head>
    <title>CartoonCatalog | Entry: <%= entryTitle %></title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
    <script src="https://kit.fontawesome.com/0318fd2bd1.js" crossorigin="anonymous"></script>
    <script src="outline.js"></script>
    
   	<!-- Favicon -->
	<link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
	<link rel="icon" type="image/png" sizes="32x32" href="favicon-32x32.png">
	<link rel="icon" type="image/png" sizes="16x16" href="favicon-16x16.png">
	<link rel="manifest" href="site.webmanifest">
	<link rel="mask-icon" href="safari-pinned-tab.svg" color="#5bbad5">
	<meta name="msapplication-TileColor" content="#da532c">
	<meta name="theme-color" content="#ffffff">
  </head>

  <body>
    <div class="headerContainer">
      <header class="header">
	  	<nav class="headerNav">
	  		<h1 class="logo"><a href="index.html">Cartoon<span class="logo2Half">Catalog</span></a></h1>
		
		  	<ul class="headerButtons">
            	<li><a href="login.html" class="headerButton1">LOGIN</a></li>
            	<li><a href="register.html" class="headerButton2">REGISTER</a></li>
          	</ul>
		</nav>
      </header>
    </div>

    <div class="contentContainer">
      <div class="banner" <% out.println("style='background-image: url(\"img/" + imgName + "\");"); %>
      <% out.println("background-position: 50% " + imgYPos + "%;'"); %>>
      </div>
      
      <div class="content">
        <div class="entryContent">
          <div class="entryDataTableArea">
            <h1 class="entryTitle"><%= entryTitle %></h1>
            
            <table>
            
              <%
              	if(entry.getCategory().equals("Series")) {
              		out.println("<tr>");
              		out.println("<th>Air Dates</th>");
              		out.println("<td>" + airDates + "</td>");
              		out.println("</tr>");
              	}
              %>

              <tr>
                <th>Release Date</th>
                <td><%= releaseDate %></td>
              </tr>

              <tr>
                <th>Runtime</th>
                <td><%= entryRuntime %></td>
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
          	
		  <%
		  	ArrayList<Episode> episodes = (ArrayList<Episode>) request.getAttribute("episodes");
		          		
		    if(episodes != null && category.equals("Series")) {
		    	out.println("<div class='episodesDataTableArea'>");
		        out.println("<h2 class='episodeHeader'>Episodes</h2>");
		        out.println("<table>");
		        out.println("<tr>");
		        out.println("<th>Episode #</th>");
		        out.println("<th>Episode Title</th>");
		        out.println("<th>Original Air Date</th>");
		        out.println("<th>Runtime</th>");
		        out.println("</tr>");
		          		
		        for(int i = 0; i < episodes.size(); i++) {
		        	Episode episode = episodes.get(i);
		          			
		          	out.println("<tr>");
		          	out.println("<td>" + episode.getEpisodeNum() + "</td>");
		          	out.println("<td>" + episode.getTitle() + "</td>");
		          	out.println("<td>" + episode.getOriginalAirDate() + "</td>");
		          	out.println("<td>" + episode.getRuntime() + "</td>");
		          	out.println("</tr>");
		        }
		        
		        out.println("</table>");
		        out.println("</div>");
		    }
		          		
		  %>

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
              	<p>Nickname: <input class="nicknameInput" type="text" name="nickname" required></p>
              
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
	  	<a href="login.html" class="footerText">Login</a>
      	<a href="register.html" class="footerText">Register</a>
      </footer>
    </div>
  </body>
  
</html>

