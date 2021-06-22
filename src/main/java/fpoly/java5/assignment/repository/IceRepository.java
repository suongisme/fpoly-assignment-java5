package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Ice;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

public interface IceRepository extends JpaRepository<Ice, Long> {
	
}
