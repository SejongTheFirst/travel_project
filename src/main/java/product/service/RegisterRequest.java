package product.service;

import java.util.List;
import java.util.Map;

import product.model.Seller;

public class RegisterRequest {

	private Seller seller;
	private String productTitle;
	private String productCategory;
	private String location;
	private int price;
	private String productContent;
	private String productSubTitle;
	private int maxGuests;
	private List<String> fileNames;

	public RegisterRequest(Seller seller, String productTitle, String productCategory, String location, int price,
			String productContent, String productSubTitle, int maxGuests, List<String> fileNames) {
		this.seller = seller;
		this.productTitle = productTitle;
		this.productCategory = productCategory;
		this.location = location;
		this.price = price;
		this.productContent = productContent;
		this.productSubTitle = productSubTitle;
		this.maxGuests = maxGuests;
		this.fileNames = fileNames;
	}

	public Seller getSeller() {
		return seller;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public String getProductCategory() {
		return productCategory;
	}

	public String getLocation() {
		return location;
	}

	public int getPrice() {
		return price;
	}

	public String getProductContent() {
		return productContent;
	}

	public String getProductSubTitle() {
		return productSubTitle;
	}

	public int getMaxGuests() {
		return maxGuests;
	}

	public List<String> getFileNames() {
		return fileNames;
	}

	public void validate(Map<String, Boolean> errors) {
		if (productTitle == null || productTitle.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}