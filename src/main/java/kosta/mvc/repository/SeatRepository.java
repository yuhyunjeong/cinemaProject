package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.Seat;

public interface SeatRepository extends JpaRepository<Seat, Integer>, QuerydslPredicateExecutor<Seat> {

}
