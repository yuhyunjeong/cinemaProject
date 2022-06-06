package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.OneToOne;

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
	private String giftCode;
	
	@OneToOne
	@JoinColumn(name="movie_code")
	private Movie movie;
	
	private String giftName;
	
	private int giftQty;
	
}
