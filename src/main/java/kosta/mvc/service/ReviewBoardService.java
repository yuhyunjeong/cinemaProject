package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.ReviewBoard;
import kosta.mvc.dto.ReviewDTO;

public interface ReviewBoardService {
	List<ReviewDTO> selectByMovieCode(String movieCode);
	void reviewInsert(ReviewBoard reviewBoard);
	List<ReviewBoard> selectByMyList(String id);
}
