package product.service;

import java.util.List;
import java.util.Map;

public class ModifyRequest {

	private String sellerId;
	private int productId;
	private int price;
	private String productTitle;
	private String productSubtitle;
	private List<String> fileNames;
	private String productContent;

	public ModifyRequest(String sellerId, int productId, int price, String productTitle, String productSubtitle,
			List<String> fileNames, String productContent) {
		super();
		this.sellerId = sellerId;
		this.productId = productId;
		this.price = price;
		this.productTitle = productTitle;
		this.productSubtitle = productSubtitle;
		this.fileNames = fileNames;
		this.productContent = productContent;
	}

	public String getSellerId() {
		return sellerId;
	}

	public int getProductId() {
		return productId;
	}

	public int getPrice() {
		return price;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public String getProductSubtitle() {
		return productSubtitle;
	}

	public List<String> getFileNames() {
		return fileNames;
	}

	public String getProductContent() {
		return productContent;
	}

	public void validate(Map<String, Boolean> errors) {
		if (productTitle == null || productTitle.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}