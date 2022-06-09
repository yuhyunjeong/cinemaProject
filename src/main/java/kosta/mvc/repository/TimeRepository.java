package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;


import kosta.mvc.domain.Time;

public interface TimeRepository extends JpaRepository<Time, Long> , QuerydslPredicateExecutor<Time>{
	
	  
	  List<Time> findByMovieMovieCodeEquals(String movieCode);

	  Time findByTimeCodeEquals(long timeCode);
	  
}
