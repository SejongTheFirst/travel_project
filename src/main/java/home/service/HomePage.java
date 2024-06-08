package home.service;

import java.util.List;

import product.model.Product;

public class HomePage {
	
	//여기에 리스트객체 추가
	private List<Product> product;
	
					//여기에 매개변수 추가
	public HomePage(List<Product> product) {
		this.product=product;
	}
	
	// 아래로 접근자 추가
	public List<Product> getProduct() {
		return product;
	}

}
