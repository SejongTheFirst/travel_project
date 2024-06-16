package product.service;

import java.util.List;

public class ProductPage {

	private int total;
	private int currentPage;
	private List<Display> displays;
	private int totalPages;
	private int startPage;
	private int endPage;

	public ProductPage(int total, int currentPage, int size, List<Display> displays) {
		this.total = total;
		this.currentPage = currentPage;
		this.displays = displays;
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

	public int getStartPage() {
		return startPage;
	}

	public int getEndPage() {
		return endPage;
	}

}