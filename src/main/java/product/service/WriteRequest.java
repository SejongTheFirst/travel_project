package product.service;

import java.util.Map;

import product.model.Writer;

public class WriteRequest {

	private Writer writer;
	private String productTitle;
	private String productSubTitle;
	private String productContent;
	private String productType;
	private int price;
	private String imgUrl;
	private int guests;
	private String location;

	public WriteRequest(Writer writer, String productTitle, String productSubTitle, String productContent, String type, int price, String imgUrl, int guests,
			String location) {
		super();
		this.writer = writer;
		this.productTitle = productTitle;
		this.productSubTitle=productSubTitle;
		this.productContent = productContent;
		this.productType=type;
		this.price=price;
		this.imgUrl = imgUrl;
		this.guests = guests;
		this.location = location;
	}
	
	public int getPrice() {
		return price;
	}
	
	public String getProductType() {
		return productType;
	}

	public Writer getWriter() {
		return writer;
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

	public String getImgUrl() {
		return imgUrl;
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