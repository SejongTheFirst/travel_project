package image.model;

public class Image {

	private Integer imageId;
	private String sellerId;
	private int productId;
	private String fileName;

	public Image(Integer imageId, String sellerId, int productId, String fileName) {
		this.imageId = imageId;
		this.sellerId = sellerId;
		this.productId = productId;
		this.fileName = fileName;
	}

	public Integer getImageId() {
		return imageId;
	}

	public String getSellerId() {
		return sellerId;
	}

	public int getProductId() {
		return productId;
	}

	public String getFileName() {
		return fileName;
	}

}
