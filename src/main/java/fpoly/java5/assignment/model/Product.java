package fpoly.java5.assignment.model;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import javax.persistence.*;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
public class Product {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private Long id;

	@NotBlank(message = "{validation.product.name}")
	private String name;

	@NotNull(message = "{validation.product.price}")
	@Min(value = 0, message = "{validation.product.price.min}")
	private Double price;

	@NotNull(message = "{validation.product.sale}")
	@Min(value = 0, message = "{validation.product.sale.min}")
	private Integer sale;

	private String image;

	@NotBlank(message = "{validation.product.description}")
	private String description;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name = "category_id")
	private Category category;
}
