package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Item;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface ItemRepository extends JpaRepository<Item, Long> {

}
