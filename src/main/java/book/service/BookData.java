package book.service;

import java.util.List;

import book.model.Book;
import book.model.BookProduct;

public class BookData {

	private List<Book> book;
	private List<BookProduct> bookProd;

	public BookData(List<Book> book, List<BookProduct> bookProd) {
		super();
		this.book = book;
		this.bookProd = bookProd;
	}

	public List<Book> getBook() {
		return book;
	}

	public List<BookProduct> getBookProd() {
		return bookProd;
	}
}
