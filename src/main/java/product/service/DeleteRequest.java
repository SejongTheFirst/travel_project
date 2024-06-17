package product.service;

import java.util.List;
import java.util.Map;

public class DeleteRequest {

	private String memberid;
	private int productId;
	private String productTitle;
	private List<String> images;
	private String productContent;

	public DeleteRequest(String memberid, int productId, String productTitle, List<String> images,
			String productContent) {
		this.memberid = memberid;
		this.productId = productId;
		this.productTitle = productTitle;
		this.images = images;
		this.productContent = productContent;
	}

	public String getMemberid() {
		return memberid;
	}

	public int getProductId() {
		return productId;
	}

	public String getProductTitle() {
		return productTitle;
	}

	public List<String> getImages() {
		return images;
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