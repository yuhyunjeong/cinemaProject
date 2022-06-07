package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import kosta.mvc.domain.QnAReply;

public interface QnAReplyRepsitory extends JpaRepository<QnAReply, Long> {

}
