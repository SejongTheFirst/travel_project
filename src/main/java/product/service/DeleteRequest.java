package product.service;

import java.util.Map;

public class DeleteRequest {

	private String memberid;
	private int productNum;
	private String productTitle;
	private String productContent;

	public DeleteRequest(String memberid, int productNum, String productTitle, String productContent) {
		super();
		this.memberid = memberid;
		this.productNum = productNum;
		this.productTitle = productTitle;
		this.productContent = productContent;
	}

	public String getMemberid() {
		return memberid;
	}

	public int getProductNum() {
		return productNum;
	}

	public String getProductTitle() {
		return productTitle;
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