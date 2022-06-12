package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import kosta.mvc.domain.Event;

public interface EventRepository extends JpaRepository<Event, Long>, QuerydslPredicateExecutor<Event> {

	@Query("select e from Event e where e.eventBoard = :#{#paramEvent.eventBoard.bno} and e.member = :#{#paramEvent.member.id}")
	Event duplicateCheck(@Param("paramEvent") Event event);
	
}
