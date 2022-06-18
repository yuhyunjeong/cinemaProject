package kosta.mvc.domain;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.SequenceGenerator;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Entity
@Setter
@Getter
@AllArgsConstructor
@NoArgsConstructor
@RequiredArgsConstructor
//@ToString
public class Seat {

	@Id
	@NonNull
	@GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "seat_pk")
	@SequenceGenerator(name = "seat_pk", allocationSize = 1, sequenceName = "seat_pk")
	private int seatCode;
	
	@ManyToOne(fetch = FetchType.LAZY)
	@JoinColumn(name="screen_code")
	@JsonIgnore
	private Screen screen;
	
	@Column(nullable = false, length = 3)
	private String seatRow;
	
	@Column(nullable = false)
	private int seatCol;
	
}
