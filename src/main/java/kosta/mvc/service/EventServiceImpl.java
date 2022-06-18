package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Event;
import kosta.mvc.domain.QEvent;
import kosta.mvc.dto.MemberDTO;
import kosta.mvc.dto.eventDTO;
import kosta.mvc.repository.EventRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {
	private final EventRepository eventRepository;

	@Override
	public String eventAttend(Event event) {
		
		//Event ev = eventRepository.duplicateCheck(event);
	//	System.out.println(ev);
		//eventRepository.save(event);

		BooleanBuilder builder = new BooleanBuilder();
		QEvent qEvent = QEvent.event;
		
		
		builder.and(qEvent.member.id.equalsIgnoreCase(event.getMember().getId()));
		builder.and(qEvent.eventBoard.bno.eq(event.getEventBoard().getBno()));
		
		Iterable<Event> result = eventRepository.findAll(builder);

		List<Event> result2 = new ArrayList<Event>();
		for (Event str : result) {
		    result2.add(str);
		}
		
		if(result2.isEmpty()) {
			eventRepository.save(event);
			return "참여완료.";
		}else {
			return "이미 참여 하셨습니다.";
		}
	
	}

	@Override
	public List<eventDTO> lottery(Long bno, Long num) {
		List<Event> list = eventRepository.lottery(bno, num);
		
		List<eventDTO> result = new ArrayList<eventDTO>();
		for(Event ev : list) {
			eventDTO eventDTO = new eventDTO(ev.getEventCode(), new MemberDTO(ev.getMember().getId()));
			result.add(eventDTO);
		}
		System.out.println("ss"+result);
		return result;
	}
 
}
