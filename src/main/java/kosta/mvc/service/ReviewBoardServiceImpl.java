package kosta.mvc.service;

import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.modelmapper.ModelMapper;
import org.modelmapper.PropertyMap;
import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.QReviewBoard;
import kosta.mvc.domain.ReviewBoard;
import kosta.mvc.dto.MemberDTO;
import kosta.mvc.dto.ReviewDTO;
import kosta.mvc.repository.ReviewBoardRepository;
import lombok.RequiredArgsConstructor;
@Service
@Transactional
@RequiredArgsConstructor
public class ReviewBoardServiceImpl implements ReviewBoardService {
	private final ReviewBoardRepository reviewBoardRepository;

	@Override
	public List<ReviewDTO> selectByMovieCode(String movieCode) {
		BooleanBuilder builder = new BooleanBuilder();
		QReviewBoard qReviewBoard = QReviewBoard.reviewBoard;
		
		builder.and(qReviewBoard.movie.movieCode.equalsIgnoreCase(movieCode));
		Iterable<ReviewBoard> result = reviewBoardRepository.findAll(builder);
		
		List<ReviewBoard> result2 = new ArrayList<ReviewBoard>();
		for (ReviewBoard str : result) {
		    result2.add(str);
		}
		
		/////////////////////////////////////////
		List<ReviewDTO> list = new ArrayList<ReviewDTO>();
		for(ReviewBoard rb : result2) {
			ReviewDTO revieDTO = new ReviewDTO(rb.getReviewCode(), rb.getContent(), rb.getSratRating(), 
					rb.getInsertDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd hh:mm")));
			
			revieDTO.setMember(new MemberDTO(rb.getMember().getId()));
			
			list.add(revieDTO);
		}
		

		return list;
	}

	@Override
	public void reviewInsert(ReviewBoard reviewBoard) {
		reviewBoardRepository.save(reviewBoard);
		
	}

	@Override
	public List<ReviewBoard> selectByMyList(String id) {
		return reviewBoardRepository.selectByMyList(id);
	}

}
