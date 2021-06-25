package fpoly.java5.assignment.service;

import fpoly.java5.assignment.constant.Constant;
import fpoly.java5.assignment.model.Product;
import fpoly.java5.assignment.repository.CategoryRepository;
import fpoly.java5.assignment.repository.ProductRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ProductService {

	@Autowired
	private ProductRepository productRepository;

	public List<Product> findAll() {
		return productRepository.findAll();
	}

	public Page<Product> findAll(Integer page) {
		PageRequest pageRequest = PageRequest.of(page-1, Constant.ORDER_MAX_PRODUCT_PER_PAGE);

		Page<Product> all = productRepository.findAll(pageRequest);

		return all;
	}

	public Product findById(Long id) {
		return productRepository.findById(id).orElseThrow(() -> {
			throw new RuntimeException("not found id "+id);
		});
	}

	public Page<Product> findAllByCategoryId(Long id, Integer page) {


		PageRequest pageRequest = PageRequest.of(page-1, Constant.ORDER_MAX_PRODUCT_PER_PAGE);

		return productRepository.findAllByCategoryId(id, pageRequest);
	}

	public Product submit(Product product) {
		return productRepository.save(product);
	}

	public void delete(Long id) {
		productRepository.deleteById(id);
	}
}
