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
import kosta.mvc.domain.Orders;
import kosta.mvc.repository.MemberRepository;
import kosta.mvc.repository.OrdersRepository;

@SpringBootTest
@Transactional
@Commit
class CinemaProjectNewApplicationTests {

	@Autowired
	private MemberRepository memberRepo;
	
	@Autowired
	private NoticeBoardRepository noriceBoardRepository;

	@Autowired
	private OrdersRepository ordersRepo;
	
	@Test
	void contextLoads() {
		for(int i=200;i<250;i++) {
			memberRepo.save(new Member("test"+i, "1234", "User"+i, 0, new Date(2000-01-01), "010-1111-1111", 3000, null));
		}
		
		//예매 내역 등록
		/*for(int i=0;i<10;i++) {
			ordersRepo.save(new Orders(null, new Member("test0"), null, 0, 10000, 0));
		}*/

	} 
	
	@Test
	void test2223() {
		for(int i=0;i<10;i++) {
			noriceBoardRepository.save(new NoticeBoard(null, new Member("test200") ,  "title" + i , "content" + i , 0, null));
		}
		
        for(int i=0;i<100;i++) {
            memberRepo.save(new Member("test"+i, "1234", "User"+i, 0, new Date(2000-01-01), "010-1111-1111", 3000, null));
        }
        
	}
	
	@Test
	void selectMemberByIdPwd() {
		Member m = memberRepo.loginCheck("test0", "1234");
		System.out.println(m.getName());
	}

}








