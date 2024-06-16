package product.service;

import java.util.List;

import image.model.Image;
import product.model.Product;
import product.model.ProductContent;

public class ProductData {

	private Product product;
	private ProductContent content;
	private List<Image> images;

	public ProductData(Product product, ProductContent content, List<Image> images) {
		this.product = product;
		this.content = content;
		this.images = images;
	}

	public Product getProduct() {
		return product;
	}

	public ProductContent getContent() {
		return content;
	}

	public List<Image> getImages() {
		return images;
	}
}