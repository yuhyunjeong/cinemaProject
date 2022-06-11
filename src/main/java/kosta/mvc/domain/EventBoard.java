package kosta.mvc.domain;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.web.multipart.MultipartFile;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;

import lombok.Setter;

@Entity
@Table(name = "eventboard")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class EventBoard {
	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_bno_seq")
	@SequenceGenerator(sequenceName = "event_bno_seq", allocationSize = 1, name = "event_bno_seq")
	private Long bno; 
	
	private String title;
	
	private String eventImg; 
	
	private String eventPath;
	
	@CreationTimestamp
	private LocalDateTime insertDate;
	
}














