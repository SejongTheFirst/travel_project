package product.service;

import image.model.Image;
import product.model.Product;

public class Display {
	private Product product;
	private Image thumbnail;

	public Display(Product product, Image thumbnail) {
		this.product = product;
		this.thumbnail = thumbnail;
	}

	public Product getProduct() {
		return product;
	}

	public Image getThumbnail() {
		return thumbnail;
	}
}
