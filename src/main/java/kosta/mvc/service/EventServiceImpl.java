package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.Event;
import kosta.mvc.domain.QEvent;
import kosta.mvc.repository.EventRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class EventServiceImpl implements EventService {
	private final EventRepository eventRepository;

	@Override
	public void eventAttend(Event event) {
		
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
		}else {
			
		}
	
	
	
	
	
	
	}
 
}
