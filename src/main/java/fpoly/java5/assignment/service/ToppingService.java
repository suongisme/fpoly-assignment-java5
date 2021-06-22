package fpoly.java5.assignment.service;

import fpoly.java5.assignment.model.Topping;
import fpoly.java5.assignment.repository.ToppingRepository;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

@Service
public class ToppingService {

	@Autowired
	private ToppingRepository toppingRepository;
	
	public List<Topping> findAll() {
		List<Topping> list = Optional.ofNullable(toppingRepository.findAll()).orElseGet(ArrayList::new);
		return list;
	}
	
	public Topping findById(Long id) {
		return toppingRepository.findById(id).orElseThrow(() -> {
			throw new RuntimeException("not found id"+id);
		});
	}

    public void submit(Topping topping) {
		toppingRepository.save(topping);
    }

    public void delete(Long id) {
		toppingRepository.deleteById(id);
	}
}
