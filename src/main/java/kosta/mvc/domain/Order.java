package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Order {

	@Id
	@NonNull
	private String orderCode;
	
	@OneToOne
	private String id;
	
	@NonNull
	private LocalDateTime orderDate;

	private int pointPrice;
	
	@NonNull
	private int totalPrice;
	
}
