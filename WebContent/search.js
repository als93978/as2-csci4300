window.onload = function init() {
    document.getElementById("search").addEventListener("click", on_click);
}

function on_click() {
    var clickedSearchButton = sessionStorage.getItem("clickedSearchButton");

    if(!clickedSearchButton) {
        var entry = document.getElementById("entry").value;
        var searchResults = document.getElementById("searchResults");
        var br = document.createElement("br");
        while(searchResults.firstNode) {
            searchResults.removeChild(searchResults.lastChild);
        }

        var result = 1;
        var resultNumP = document.createElement("p");
        var resultNumText = document.createTextNode("Results Found: " + result);
        resultNumP.appendChild(resultNumText);
        resultNumP.setAttribute("class", "resultNumText");

        searchResults.appendChild(resultNumP);
        
        //go through database and get number of search results. Implement after backend
        var placeholderLink = document.createElement("a");
        // placeholderLink.style.textDecoration = "none";
        // placeholderLink.style.color = "black";
        placeholderLink.setAttribute("href", "entry.html");
        placeholderLink.setAttribute("class", "placeholderLink");
        var placeholder = document.createElement("div");
        
        if(result > 0) {
            var title = document.createElement("p");
            title.setAttribute("class", "searchResultTitleText");
            var titleText = document.createTextNode("Title: Spongebob Squarepants\n");
            title.appendChild(titleText);
            placeholder.appendChild(title);

            var date = document.createElement("p");
            var dateText = document.createTextNode("First aired: May 1st, 1999");
            date.appendChild(dateText);
            placeholder.appendChild(date);

            var sum = document.createElement("p");
            var sumText = document.createTextNode("Short summary: A talking sea sponge fry cook embarks on miscellaneous adventures with his pals: a squirrel scientist, greedy crab boss, lazy sea star, and overly annoyed squid neighbor.");
            sum.appendChild(sumText)
            placeholder.appendChild(sum);
            
	    // implement styling
            placeholder.setAttribute("class", "searchPlaceholder");
        }

        placeholderLink.appendChild(placeholder);
        
        searchResults.appendChild(placeholderLink);
        
        sessionStorage.setItem("clickedSearchButton", "true");
    }
}
