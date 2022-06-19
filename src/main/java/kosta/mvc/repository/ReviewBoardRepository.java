package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.querydsl.QuerydslPredicateExecutor;
import org.springframework.data.repository.query.Param;

import kosta.mvc.domain.ReviewBoard;

public interface ReviewBoardRepository extends JpaRepository<ReviewBoard, Long>, QuerydslPredicateExecutor<ReviewBoard>{
	
	@Query(value = "select * from review_board where id = :id", nativeQuery=true)
	List<ReviewBoard> selectByMyList(@Param("id") String id);
}
