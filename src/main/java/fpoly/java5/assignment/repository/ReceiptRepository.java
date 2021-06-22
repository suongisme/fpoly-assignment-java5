package fpoly.java5.assignment.repository;

import fpoly.java5.assignment.model.Receipt;
import org.springframework.data.domain.Sort;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;
import java.util.Map;

public interface ReceiptRepository extends JpaRepository<Receipt, Long> {

    List<Receipt> findByUserIdAndDate(long userId, Date date, Sort sort);

    List<Receipt> findByUserId(Long id, Sort st);
}
