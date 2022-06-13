package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.ReviewBoard;

public interface ReviewBoardService {
	List<ReviewBoard> selectByMovieCode(String movieCode);
}
