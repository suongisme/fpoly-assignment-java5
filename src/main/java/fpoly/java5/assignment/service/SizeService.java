package fpoly.java5.assignment.service;

import fpoly.java5.assignment.model.Size;
import fpoly.java5.assignment.repository.SizeRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class SizeService {

	@Autowired
	private SizeRepository sizeRepository;
	
	public List<Size> findAll() {
		return sizeRepository.findAll();
	}
	
	public Size findById(Long id) {
		return sizeRepository.findById(id).orElseThrow(() -> {
			throw new RuntimeException("not found id "+id);
		});
	}

    public void submit(Size size) {
		sizeRepository.save(size);
    }

    public void delete(Long id) {
		sizeRepository.deleteById(id);
	}
}
