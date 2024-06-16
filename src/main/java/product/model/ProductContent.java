package product.model;

import java.util.Date;

public class ProductContent {

	private Integer productId;
	private String productContent;
	private String productSubTitle;
	private int maxGuests;
	private Date regDate;
	private Date modDate;

	public ProductContent(Integer productId, String productContent, String productSubTitle, int maxGuests, Date regDate,
			Date modDate) {
		this.productId = productId;
		this.productContent = productContent;
		this.productSubTitle = productSubTitle;
		this.maxGuests = maxGuests;
		this.regDate = regDate;
		this.modDate = modDate;
	}

	public Integer getProductId() {
		return productId;
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

	public Date getRegDate() {
		return regDate;
	}

	public Date getModDate() {
		return modDate;
	}

}