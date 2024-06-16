package product.model;

public class Product {

	private Integer productId;
	private Seller seller;
	private String productTitle;
	private String productCategory;
	private String location;
	private int price;
	private String status;

	public Product(Integer productId, Seller seller, String productTitle, String productCategory, String location,
			int price, String status) {
		this.productId = productId;
		this.seller = seller;
		this.productTitle = productTitle;
		this.productCategory = productCategory;
		this.location = location;
		this.price = price;
		this.status = status;
	}

	public Integer getProductId() {
		return productId;
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

	public String getStatus() {
		return status;
	}

}