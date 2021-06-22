package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Product;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface ProductRepository extends JpaRepository<Product, Long> {

    Page<Product> findAllByCategoryId(Long categoryId, Pageable page);
}
