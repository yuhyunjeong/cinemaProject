package kosta.mvc.domain;


import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Table(name = "event")
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
public class Event {

	@Id
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "event_code_seq")
	@SequenceGenerator(sequenceName = "event_code_seq", allocationSize = 1, name = "event_code_seq")
	private Long eventCode;
	
	@ManyToOne
	@JoinColumn(name = "id")
	private Member member;
	
	@ManyToOne
	@JoinColumn(name = "event_bno")
	private EventBoard eventBoard;
}
