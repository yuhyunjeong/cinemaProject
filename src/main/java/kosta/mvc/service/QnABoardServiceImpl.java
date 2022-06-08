package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.domain.QnABoard;
import kosta.mvc.repository.QnABoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class QnABoardServiceImpl implements QnABoardService {
	private final QnABoardRepository qnABoardRepository;

	@Override
	public List<QnABoard> selectAll() {
		return qnABoardRepository.findAll();
	}

	@Override
	public QnABoard selectBy(Long bno) {
		QnABoard qnaBoard = qnABoardRepository.findById(bno).orElse(null);
		if(qnaBoard==null)new RuntimeException("상세보기에 오류가 발생했습니다.");
		return qnaBoard;
	}

	@Override
	public void insert(QnABoard qnaBoard) {
		qnABoardRepository.save(qnaBoard);
		
	}

	@Override
	public void delete(Long bno) {
		qnABoardRepository.deleteById(bno);
		
	}

	@Override
	public QnABoard update(QnABoard qnaBoard) {
		QnABoard board = qnABoardRepository.getById(qnaBoard.getBno());
		board.setTitle(qnaBoard.getTitle());
		board.setContent(qnaBoard.getContent());
		return board;
		
	}

}
