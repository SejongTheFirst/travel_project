package product.service;

import product.model.Product;
import product.model.ProductContent;

public class ProductData {

	private Product product;
	private ProductContent content;

	public ProductData(Product product, ProductContent content) {
		super();
		this.product = product;
		this.content = content;
	}

	public Product getProduct() {
		return product;
	}

	public ProductContent getContent() {
		return content;
	}

}