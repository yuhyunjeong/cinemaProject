package kosta.mvc.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class MemberDTO {

	private String id;

	private String name;
	private String grade;
	
	private String birth;
	
	private String phone;
	
	private int point;
	
	private String regdate;
	
	public MemberDTO(String id) {
		this.id=id;
	}

}
