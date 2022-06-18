package kosta.mvc.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.EventBoard;

public interface EventBoardRepository extends JpaRepository<EventBoard, Long> {
	List<EventBoard> findAllByOrderByBnoDesc();
}
