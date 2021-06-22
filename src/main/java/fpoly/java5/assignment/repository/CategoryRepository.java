package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Category;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface CategoryRepository extends JpaRepository<Category,Long> {

}
