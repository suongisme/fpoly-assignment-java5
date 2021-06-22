package fpoly.java5.assignment.service;

import fpoly.java5.assignment.model.Sugar;
import fpoly.java5.assignment.repository.SugarRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SugarService {

	@Autowired
	private SugarRepository sugarRepository;
	
	public List<Sugar> findAll() {
		return sugarRepository.findAll();
	}
	
	public Sugar findById(Long id) {
		return sugarRepository.findById(id).orElseThrow(() -> {
			throw new RuntimeException("not found id "+id );
		});
	}

	public void submit(Sugar sugar) {
		sugarRepository.save(sugar);
	}

	public void delete(Long id) {
		sugarRepository.deleteById(id);
	}
}
