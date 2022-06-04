package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;

import kosta.mvc.domain.QnABoard;
import kosta.mvc.repository.QnABoardRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class QnABoardServiceImpl implements QnABoardService {
	private QnABoardRepository qnABoardRepository;

	@Override
	public List<QnABoard> selectAll() {
		return qnABoardRepository.findAll();
	}

	@Override
	public QnABoard selectBy(Long bno) {
		// TODO Auto-generated method stub
		return null;
	}

}
