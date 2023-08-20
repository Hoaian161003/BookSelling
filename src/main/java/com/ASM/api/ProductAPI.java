package com.ASM.api;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import com.ASM.entity.Product;
import com.ASM.service.ProductService;

@CrossOrigin("*")
@RestController
public class ProductAPI {
	@Autowired
	ProductService productService;
	
	@GetMapping("/api/products")
	public List<Product> getAll(){
		return productService.findAll();
	}
	@GetMapping("/api/products/{id}")
	public Product getOne(@PathVariable("id") Integer id){
		return productService.findById(id);
	}
	@PostMapping("/api/products")
	public Product create(@RequestBody Product product){
		productService.create(product);
		return product;
	}
	@PutMapping("/api/products/{id}")
	public Product update(@RequestBody Product product, 
			@PathVariable("id") Integer id){
		if(productService.existedById(id)) {
			productService.update(product);
		} else {
			throw new RuntimeException();
		}
		return product;
	}
	@DeleteMapping("/api/products/{id}")
	public void delete(@PathVariable("id") Integer id){
		productService.deleteById(id);
	}
}