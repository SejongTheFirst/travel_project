package product.service;

import java.util.Map;

public class ModifyRequest {

	private String memberid;
	private int productNum;
	private int price;
	private String productTitle;
	private String productSubtitle;
	private String productContent;

	public ModifyRequest(String memberid, int productNum, int price, String productTitle, String productSubtitle, String productContent) {
		super();
		this.memberid = memberid;
		this.productNum = productNum;
		this.price=price;
		this.productTitle = productTitle;
		this.productSubtitle=productSubtitle;
		this.productContent = productContent;
	}

	public String getMemberid() {
		return memberid;
	}

	public int getProductNum() {
		return productNum;
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

	public String getProductContent() {
		return productContent;
	}
	
	public void validate(Map<String, Boolean> errors) {
		if (productTitle == null || productTitle.trim().isEmpty()) {
			errors.put("title", Boolean.TRUE);
		}
	}

}