package product.model;

import java.util.List;

import image.model.Image;

public class ProductWithImage {
	private Product product;
	private List<Image> images;

	public ProductWithImage(Product product, List<Image> images) {
		this.product = product;
		this.images = images;
	}

	public Product getProduct() {
		return product;
	}

	public List<Image> getImages() {
		return images;
	}
}
