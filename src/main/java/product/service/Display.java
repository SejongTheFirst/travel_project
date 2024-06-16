package product.service;

import java.util.List;

import image.model.Image;
import product.model.Product;

public class Display {
	private List<Product> product;
	private List<Image> images;

	public Display(List<Product> product, List<Image> images) {
		this.product = product;
		this.images = images;
	}
	
	public List<Product> getProduct() {
		return product;
	}

	public List<Image> getImages() {
		return images;
	}
	
}
