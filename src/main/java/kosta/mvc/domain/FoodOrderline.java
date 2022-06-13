package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class FoodOrderline {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "foodorderline_pk")
	@SequenceGenerator(name = "foodorderline_pk", allocationSize = 1, sequenceName = "foodorderline_pk")
	private Long foodOrderlineCode;
	
	@ManyToOne
	@JoinColumn(name = "order_code" , nullable = false)
	private Orders order;
	
	@ManyToOne
	@JoinColumn(name = "food_code", nullable = false)
	private Food food;
	
	@Column(nullable=false)
	private int qty;
	
	private int sumPrice;
}
