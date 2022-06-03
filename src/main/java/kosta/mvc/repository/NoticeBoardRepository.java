package kosta.mvc.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;

import kosta.mvc.domain.NoticeBoard;

public interface NoticeBoardRepository extends JpaRepository<NoticeBoard, Long> {
	@Query("update NoticeBoard b set b.readnum = b.readnum + 1 where b.bno = ?1")
	@Modifying
	void updateReadNum(Long bno);
}
