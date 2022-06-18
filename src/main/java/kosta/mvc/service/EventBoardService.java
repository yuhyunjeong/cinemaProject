package kosta.mvc.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.EventBoard;



public interface EventBoardService {
	List<EventBoard> selectAll();
	
	EventBoard selectBy(Long bno);
	
	void eventInsert(EventBoard eventBoard, MultipartFile file) throws Exception;
	
	List<EventBoard> eventMainList();
}
