package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.FetchType;
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
public class Gift {
	
	@Id
	@NonNull
	private String giftCode;
	
	@OneToOne(fetch = FetchType.LAZY)
	private String movieCode;
	
	@NonNull
	private String giftName;
	
	@NonNull
	private int giftQTY;

}
