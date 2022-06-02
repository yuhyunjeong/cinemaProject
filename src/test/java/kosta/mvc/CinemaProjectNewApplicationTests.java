package kosta.mvc;

import java.util.Date;

import javax.transaction.Transactional;

import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.annotation.Commit;

import kosta.mvc.domain.Member;
import kosta.mvc.domain.NoticeBoard;
import kosta.mvc.repository.MemberRepository;
import kosta.mvc.repository.NoticeBoardRepository;

@SpringBootTest
@Transactional
@Commit
class CinemaProjectNewApplicationTests {

	@Autowired
	private MemberRepository memberRepo;
	
	@Autowired
	private NoticeBoardRepository noriceBoardRepository;
	
	@Test
	void contextLoads() {
		
		for(int i=200;i<250;i++) {
			memberRepo.save(new Member("test"+i, "1234", "User"+i, 0, new Date(2000-01-01), "010-1111-1111", 3000, null));
		}
	} 
	
	@Test
	void test2223() {
		for(int i=0;i<10;i++) {
			noriceBoardRepository.save(new NoticeBoard(null, new Member("test0") ,  "title" + i , "content" + i , 0, null));
		}
	}

}
