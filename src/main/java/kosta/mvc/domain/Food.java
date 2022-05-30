package kosta.mvc.domain;

import javax.persistence.Entity;
import javax.persistence.Id;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

@Entity
@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
public class Food {

	@Id
	@NonNull
	private String foodCode;
	
	@NonNull
	private String foodName;
	
	@NonNull
	private String foodContent;
	
	@NonNull
	private String foodPrice;
}