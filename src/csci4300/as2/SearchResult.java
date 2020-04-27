package csci4300.as2;

public class SearchResult {
	private String entryID;
	private String title;
	private String releaseDate;
	private String summary;
	
	public SearchResult(String entryID, String title, String releaseDate, String summary) {
		this.entryID = entryID;
		this.title = title;
		this.releaseDate = releaseDate;
		this.summary = summary;
	}
	
	public SearchResult() {
		
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public String getSummary() {
		return summary;
	}

	public void setSummary(String summary) {
		this.summary = summary;
	}

	public String getEntryID() {
		return entryID;
	}

	public void setEntryID(String entryID) {
		this.entryID = entryID;
	}
}
