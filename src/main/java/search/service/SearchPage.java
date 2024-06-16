package search.service;

import java.util.List;

import board.model.Article;
import product.service.Display;

public class SearchPage {
	
	private int total;
	private int currentPage;
	private List<Display> displays;
	private List<Article> articles;
	private int totalPages;
	private int startPage;
	private int endPage;

	public SearchPage(int total, int currentPage, int size, List<Display> displays, List<Article> articles) {
		this.total = total;
		this.currentPage = currentPage;
		this.displays = displays;
		this.articles=articles;
		if (total == 0) {
			totalPages = 0;
			startPage = 0;
			endPage = 0;
		} else {
			totalPages = total / size;
			if (total % size > 0) {
				totalPages++;
			}
			int modVal = currentPage % 5;
			startPage = currentPage / 5 * 5 + 1;
			if (modVal == 0)
				startPage -= 5;

			endPage = startPage + 4;
			if (endPage > totalPages)
				endPage = totalPages;
		}
	}

	public int getTotal() {
		return total;
	}

	public boolean hasNoProduct() {
		return total == 0;
	}

	public boolean hasProduct() {
		return total > 0;
	}

	public int getCurrentPage() {
		return currentPage;
	}

	public int getTotalPages() {
		return totalPages;
	}

	public List<Display> getDisplays() {
		return displays;
	}
	
	public List<Article> getArticles() {
		return articles;
	}
	

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}
}
