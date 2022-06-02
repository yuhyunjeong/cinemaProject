package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import org.hibernate.annotations.CreationTimestamp;

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
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "order_pk")
	@SequenceGenerator(name = "order_pk", allocationSize = 1, sequenceName = "order_pk")
	private Long orderCode;
	
	@ManyToOne
	@JoinColumn(name="id")
	private Member memberId;
	
	@CreationTimestamp
	private LocalDateTime orderDate;

	private int pointPrice;
	
	@Column(nullable=false)
	private int totalPrice;
	
	@Column(columnDefinition = "0")
	private int orderState;
}
