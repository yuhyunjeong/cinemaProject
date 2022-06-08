package kosta.mvc.service;

import java.util.List;

import kosta.mvc.domain.QnABoard;



public interface QnABoardService {

	List<QnABoard> selectAll();
	
	QnABoard selectBy(Long bno);
	
	void insert(QnABoard qnaBoard);
	
	void delete(Long bno);
	
	QnABoard update(QnABoard qnaBoard);
}
