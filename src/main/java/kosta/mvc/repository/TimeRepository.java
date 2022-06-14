package kosta.mvc.repository;

import java.util.Date;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import kosta.mvc.domain.Time;

public interface TimeRepository extends JpaRepository<Time, Long> , QuerydslPredicateExecutor<Time>{
	
	  List<Time> findByMovieMovieCodeEquals(String movieCode);

	  Time findByTimeCodeEquals(long timeCode);
	
	  List<Time> findByTimeDateEqualsAndMovieMovieCodeEquals(Date timeDateconvert, String movieCode); //findAll이 왜안되는지..?
	  
	  
	  
}
