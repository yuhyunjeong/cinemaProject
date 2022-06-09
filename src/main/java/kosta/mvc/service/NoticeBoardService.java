package kosta.mvc.service;

import java.util.List;


import kosta.mvc.domain.NoticeBoard;

public interface NoticeBoardService {

	List<NoticeBoard> selectAll();
	
	NoticeBoard selectBy(Long bno);
	
	void insert(NoticeBoard noticeBoard);
	
	void delete(Long bno);
	
	NoticeBoard update(NoticeBoard noticeBoard);
}
