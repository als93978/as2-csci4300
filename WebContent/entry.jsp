<!DOCTYPE html>

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
      	String test = (String) request.getAttribute("Test");
      
      	out.println("<p>" + test + "</p>");
      %>
    
      <div class="banner">
      </div>
      
      <div class="content">
        <div class="entryContent">
          <div class="tableArea">
            <h1 class="entryTitle">Spongebob Squarepants</h1>
            
            <table>
              <tr>
                <th>Air Dates</th>
                <td>May 1st, 1999 to Present</td>
              </tr>

              <tr>
                <th>ReleaseDate</th>
                <td>May 1st, 1999</td>
              </tr>

              <tr>
                <th>Runtime</th>
                <td>11 Minutes</td>
              </tr>

              <tr>
                <th>Genre</th>
                <td>Animated Comedy</td>
              </tr>

              <tr>
                <th>Description</th>
                <td>The show chronicles the adventures of a cheerful and goofy sea-sponge and his wacky neighbors.</td>
              </tr>
            </table>
          </div>

          <div class="reviewArea">
            <div class="userReviewHeader">
              <h3>User Reviews</h3>
            </div>
            
            <div class="reviewBox">
              <p>User: <span class="userTextColor">Neptune</span></p>
              <p class="goldUnderline">Rating: 5 out of 5</p>
              <p>Date: Apr 25 2020</p>
              <p>
                It is truly a gift from the gods! There is a reason Nickelodeon
                has made $13 billion from it!
              </p>
            </div>

            <div class="reviewBox">
              <p>User: <span class="userTextColor">aschultz086</span></p>
              <p class="goldUnderline">Rating: 5 out of 5</p>
              <p>Date: Apr 24 2020</p>
              <p>
                Childhood nostalgia! It's been around about as long as I've been!
              </p>
            </div>

            <div class="reviewBox">
              <p>User: <span class="userTextColor">SomeUser</span></p>
              <p class="goldUnderline">Rating: 5 out of 5</p>
              <p>Date: Apr 22 2020</p>
              <p>
                Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Sit amet consectetur adipiscing elit ut aliquam purus sit. Adipiscing at in tellus integer feugiat scelerisque varius. Orci phasellus egestas tellus rutrum tellus pellentesque eu tincidunt tortor. Tristique sollicitudin nibh sit amet commodo nulla facilisi nullam vehicula. Sed tempus urna et pharetra pharetra. Turpis in eu mi bibendum neque egestas congue quisque egestas. Etiam dignissim diam quis enim lobortis scelerisque fermentum. Metus dictum at tempor commodo ullamcorper a lacus. Aliquam ultrices sagittis orci a scelerisque.
              </p>
            </div>
            
            <div class="newReviewBox">
              <h3>New Review</h3>
              <form method="POST">
                <p>Rating: <input class="ratingInput" type="number" minlength="1" maxlength="1" size="1" min="0" max="5"></p>

                <textarea class="reviewTextArea" rows="15" placeholder="Write your review here..." spellcheck="true"></textarea>
                
                <div class="publishReviewButtonContainer">
                  <button type="submit" class="publishReviewButton">Publish Review</button>
                </div>
              </form>
            </div>
          </div>

          <div class="bottomButtonContainer">
	    <a href="user.html" class="bottomButton">Add to Favorites</a>
	  </div>
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

