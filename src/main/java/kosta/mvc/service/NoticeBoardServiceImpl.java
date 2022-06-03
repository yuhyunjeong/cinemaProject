package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.repository.NoticeBoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class NoticeBoardServiceImpl implements NoticeBoardService {
	private final NoticeBoardRepository noticeBoardRepository;
	@Override
	public List<NoticeBoard> selectAll() {
		return noticeBoardRepository.findAll();
	}
	@Override
	public NoticeBoard selectBy(Long bno) {
		noticeBoardRepository.updateReadNum(bno);
		NoticeBoard noticeBoard = noticeBoardRepository.findById(bno).orElse(null);
		if(noticeBoard==null)new RuntimeException("상세보기에 오류가 발생했습니다.");
		return noticeBoard;
	}

}
