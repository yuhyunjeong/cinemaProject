package kosta.mvc.domain;

import java.time.LocalDateTime;
import java.util.Date;
import java.util.List;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@RequiredArgsConstructor
public class Member {
	
	@Id
	@NonNull
	private String id;
	
	@Column(nullable=false)
	private String password;
	
	@Column(nullable=false)
	private String name;
	private int grade;
	
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date birth;
	
	@Column(length = 13)
	private String phone;
	
	private int point;
	
	@CreationTimestamp
	private LocalDateTime regdate;
	
	@OneToMany(mappedBy="member")
	private List<Orders> orderList;
}
