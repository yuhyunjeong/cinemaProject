package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.EventBoard;

public interface EventBoardRepository extends JpaRepository<EventBoard, Long> {

}
