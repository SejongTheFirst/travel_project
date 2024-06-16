package home.service;

import java.util.List;

import product.service.Display;

public class HomePage {

	private List<Display> displays;

	public HomePage(List<Display> displays) {
		this.displays= displays;
	}

	public List<Display> getDisplays() {
		return displays;
	}

}
