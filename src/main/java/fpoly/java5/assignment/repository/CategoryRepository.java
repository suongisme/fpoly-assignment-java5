package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Category;
import org.springframework.data.domain.Example;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

import java.util.Optional;

public interface CategoryRepository extends JpaRepository<Category,Long> {

    @Query(value = "SELECT * FROM category LIMIT 1", nativeQuery = true)
    Category findOne();
}
