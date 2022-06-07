package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Food {

	@Id
	@NonNull
	private String foodCode;
	
	private String foodName;
	
	private String foodContent;
	
	private int foodPrice;
	
	private String foodImage;
	
	
}
