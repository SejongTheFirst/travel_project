package board.model;

import java.sql.Timestamp;
import java.util.Date;

public class Article {

	private Integer number;
	private Writer writer;
	private String title;
	private Date regDate;
	private Date modifiedDate;
	private String category;
	private int readCount;

	public Article(Integer number, String title, Writer writer, Timestamp regDate ,String category) {
	    this.number = number;
	    this.title = title;
	    this.writer = writer;
	    this.regDate = regDate;
	    this.category=category;
	}

	public Article(Integer number, Writer writer, String title, Date regDate, Date modifiedDate, int readCount, String category) {
	    this.number = number;
	    this.writer = writer;
	    this.title = title;
	    this.regDate = regDate;
	    this.modifiedDate = modifiedDate;
	    this.readCount = readCount;
	    this.category = category;
	}

	public Integer getNumber() {
	    return number;
	}

	public Writer getWriter() {
	    return writer;
	}

	public String getCategory() {
		return category;
	}


	public String getTitle() {
	    return title;
	}

	public Date getRegDate() {
	    return regDate;
	}

	public Date getModifiedDate() {
	    return modifiedDate;
	}

	public int getReadCount() {
	    return readCount;
	}

	public Article(String title, Date regDate) {
	    this.title = title;
	    this.regDate = regDate;
	}
}