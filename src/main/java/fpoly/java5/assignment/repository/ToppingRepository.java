package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Topping;
import org.springframework.data.jpa.repository.JpaRepository;

public interface ToppingRepository extends JpaRepository<Topping, Long> {
}
