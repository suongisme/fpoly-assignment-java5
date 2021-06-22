package fpoly.java5.assignment.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Category {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank(message = "{validation.category.id}")
	private String name;
	
	@OneToMany(fetch = FetchType.EAGER, mappedBy = "category", targetEntity = Product.class)
	private List<Product> products;
	
}
