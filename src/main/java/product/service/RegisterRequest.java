package product.service;

import java.util.List;
import java.util.Map;

import product.model.Seller;

public class RegisterRequest {

	private Seller seller;
	private String productTitle;
	private String productSubTitle;
	private String productContent;
	private String productCategory;
	private int price;
	private List<String> fileNames;
	private int guests;
	private String location;

	public RegisterRequest(Seller seller, String productTitle, String productSubTitle, String productContent,
			String productCategory, int price, List<String> fileNames, int guests, String location) {
		this.seller = seller;
		this.productTitle = productTitle;
		this.productSubTitle = productSubTitle;
		this.productContent = productContent;
		this.productCategory = productCategory;
		this.price = price;
		this.fileNames = fileNames;
		this.guests = guests;
		this.location = location;
	}

	public Seller getSeller() {
		return seller;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public String getProductSubTitle() {
		return productSubTitle;
	}

	public String getProductContent() {
		return productContent;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public int getPrice() {
		return price;
	}

	public List<String> getFileNames() {
		return fileNames;
	}

	public int getGuests() {
		return guests;
	}

	public String getLocation() {
		return location;
	}

	public void validate(Map<String, Boolean> errors) {
		if (productTitle == null || productTitle.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}