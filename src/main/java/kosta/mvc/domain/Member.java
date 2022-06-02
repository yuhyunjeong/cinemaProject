package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;

import org.hibernate.annotations.CreationTimestamp;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class Member {
	
	@Id
	@NonNull
	private String id;
	private String password;
	private String name;
	private int grade;
	private Date birth;
	
	@Column(length = 13)
	private String phone;
	
	private int point;
	
	@CreationTimestamp
	private LocalDateTime regdate;
	
	
	public Member(String id) {
		this.id=id;
	}
}
