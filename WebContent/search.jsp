<!DOCTYPE html>

<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.ArrayList" %>
<%@ page import="csci4300.as2.SearchResult" %>

<html lang="en">

  <head>
    <title>CartoonCatalog | Search</title>
    <meta charset="utf-8">
    <link rel="stylesheet" type="text/css" href="stylesheet.css">
    <script src="https://kit.fontawesome.com/0318fd2bd1.js" crossorigin="anonymous"></script>
    <script src="outline.js"></script>
    <script src="search.js"></script>
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

        <form class="searchForm" action="SearchDB" method="POST" accept-charset="UTF-8">
        	<input type="text" class="searchBar" id="keyword" name="keyword" placeholder="Enter a movie or show title, air date, or other keywords...">
        	<button type="submit" class="searchButton" id="search"><i class="fas fa-search"></i></button>
        </form>
      </header>
    </div>

    <div class="contentContainer" id="searchContainer"> 
      <div class="searchResults" id="searchResults">
		<%	
			ArrayList<SearchResult> searchResults = (ArrayList<SearchResult>) request.getAttribute("searchResults");
			
			if(searchResults != null) {
				if(searchResults.size() > 0)
					out.println("<p class='searchResultNumText'>Results: " + searchResults.size() + "</p>");
				else
					out.println("<p class='searchResultNumText'>No results found. Try refining your search.</p>");
				
				for(int i = 0; i < searchResults.size(); i++) {
					out.println("<form id='searchForm" + i + "'" + " action='GetEntryData' method='POST'>");
					
					SearchResult searchResult = searchResults.get(i);
					
					if(i == 0)
						out.println("<div class='firstSearchPlaceholder'");
					else
						out.println("<div class='searchPlaceholder'");
					
					out.println("onclick='goToEntry(" + i + ")'" + " >");
					
					out.println("<p class='searchResultTitleText'>");
					out.println("Title: " + searchResult.getTitle());
					out.println("</p>");
					
					out.println("<p>");
					out.println("Release Date: " + searchResult.getReleaseDate());
					out.println("</p>");
					
					out.println("<p>");
					out.println("Short summary: " + searchResult.getSummary());
					out.println("</p>");
					
					out.println("<input type='hidden' name='EntryID' value='" + searchResult.getEntryID() + "'" + "/>");
					
					out.println("</div>");
					
					out.println("</form>");
				}
				
				
			}
		%>
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
