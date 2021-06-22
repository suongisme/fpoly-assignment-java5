package fpoly.java5.assignment.service;

import fpoly.java5.assignment.model.Ice;
import fpoly.java5.assignment.repository.IceRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class IceService {

	@Autowired
	private IceRepository iceRepository;
	
	public List<Ice> findAll() {
		return iceRepository.findAll();
	}
	
	public Ice findById(Long id) {
		return iceRepository.findById(id).orElseThrow(() -> {
			throw new RuntimeException("not found id "+id);
		});
	}

    public void submit(Ice ice) {
		iceRepository.save(ice);
    }

	public void delete(Long id) {
		iceRepository.deleteById(id);
	}
}
