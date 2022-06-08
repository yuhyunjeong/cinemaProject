package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Gift {
	
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "gift_pk")
	@SequenceGenerator(name="gift_pk", allocationSize = 1, sequenceName = "gift_pk")
	private String giftCode;
	
	@OneToOne
	@JoinColumn(name="movie_code")
	@JsonIgnore
	private Movie movie;
	
	private String giftName;
	
	private int giftQty;
	
}
