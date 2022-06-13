package kosta.mvc.service;

import java.util.ArrayList;
import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import com.querydsl.core.BooleanBuilder;

import kosta.mvc.domain.QReviewBoard;
import kosta.mvc.domain.ReviewBoard;
import kosta.mvc.repository.ReviewBoardRepository;
import lombok.RequiredArgsConstructor;
@Service
@Transactional
@RequiredArgsConstructor
public class ReviewBoardServiceImpl implements ReviewBoardService {
	private final ReviewBoardRepository reviewBoardRepository;

	@Override
	public List<ReviewBoard> selectByMovieCode(String movieCode) {
		BooleanBuilder builder = new BooleanBuilder();
		QReviewBoard qReviewBoard = QReviewBoard.reviewBoard;
		
		builder.and(qReviewBoard.movie.movieCode.equalsIgnoreCase(movieCode));
		Iterable<ReviewBoard> result = reviewBoardRepository.findAll(builder);
		List<ReviewBoard> result2 = new ArrayList<ReviewBoard>();
		for (ReviewBoard str : result) {
		    result2.add(str);
		}
		return result2;
	}

}
