package kosta.mvc.service;

import javax.transaction.Transactional;

import org.springframework.stereotype.Service;


import kosta.mvc.domain.QnAReply;
import kosta.mvc.repository.QnAReplyRepsitory;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class QnAReplyServiceImpl implements QnAReplyService {
	private final QnAReplyRepsitory qnAReplyRepsitory;
	
	@Override
	public void insert(QnAReply qnaReply) {
		qnAReplyRepsitory.save(qnaReply);

	}

	@Override
	public void delete(Long rno) {
		// TODO Auto-generated method stub

	}

}
