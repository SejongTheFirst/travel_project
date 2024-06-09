package product.service;

import java.util.List;

import image.model.Image;
import product.model.Product;

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
