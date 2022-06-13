package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;

import kosta.mvc.domain.ReviewBoard;

public interface ReviewBoardRepository extends JpaRepository<ReviewBoard, Long>, QuerydslPredicateExecutor<ReviewBoard>{

}
