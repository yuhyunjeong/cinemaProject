package kosta.mvc.service;


import java.io.File;
import java.util.List;
import java.util.UUID;

import javax.transaction.Transactional;

import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kosta.mvc.domain.EventBoard;
import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.repository.EventBoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class EventBoardServiceImpl implements EventBoardService {
	private final EventBoardRepository eventBoardRepository;
	


	@Override
	public List<EventBoard> selectAll() {
		return eventBoardRepository.findAllByOrderByBnoDesc();
	}
	
	@Override
	public void eventInsert(EventBoard eventBoard, MultipartFile file) throws Exception {
		
        String path = System.getProperty("user.dir") + "/src/main/resources/static/img/event";
        UUID uuid = UUID.randomUUID();
        String fileName = uuid + "_" + file.getOriginalFilename();
        File saveFile = new File(path,fileName);
        file.transferTo(saveFile);
        eventBoard.setEventImg(fileName);
        eventBoard.setEventPath("/img/event/"+fileName);
        eventBoardRepository.save(eventBoard);
	}

	@Override
	public EventBoard selectBy(Long bno) {
		EventBoard eventBoard = eventBoardRepository.findById(bno).orElse(null);
		if(eventBoard==null)new RuntimeException("상세보기에 오류가 발생했습니다.");
		return eventBoard;
	}

	@Override
	public List<EventBoard> eventMainList() {
		return eventBoardRepository.findAllByOrderByBnoDesc();
	}

	

}
