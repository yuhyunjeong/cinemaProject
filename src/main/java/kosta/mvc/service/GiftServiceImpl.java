package kosta.mvc.service;

import java.util.List;

import javax.transaction.Transactional;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

import kosta.mvc.domain.Gift;
import kosta.mvc.repository.GiftRepository;
import lombok.RequiredArgsConstructor;

@Service
@Transactional
@RequiredArgsConstructor
public class GiftServiceImpl implements GiftService {
	
	private final GiftRepository giftRepo;

	@Override
	public List<Gift> selectAll() {
		
		return giftRepo.findAll();
	}

	@Override
	public Page<Gift> selectAll(Pageable pageable) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insert(Gift gift) {
		Gift saveGift = giftRepo.save(gift);
		System.out.println("saveGift : " + saveGift);

	}

	@Override
	public Gift selectBy(String giftCode) {
		
		Gift gift = giftRepo.findById(giftCode).orElse(null);
		if(gift.equals(null)) {
			throw new RuntimeException("상세보기 오류가 발생했습니다.");
		}
		
		return gift;
	}
	
	@Override
	public Gift update(Gift gift) {
		
		Gift dbGift = giftRepo.findById(gift.getGiftCode()).orElse(null);
		if(dbGift == null) {
			throw new RuntimeException("사은품코드 오류로 수정할 수 없습니다.");
		}
		
		// 수정완료 
		dbGift.setGiftName(gift.getGiftName());
		dbGift.setGiftQTY(gift.getGiftQTY());
		
		return dbGift;
	}

	@Override
	public void delete(String giftCode) {
		
		Gift dbGift = giftRepo.findById(giftCode).orElse(null);
		if(dbGift == null) {
			throw new RuntimeException("사은품코드 오류로 삭제할 수 없습니다.");
		}
		
		giftRepo.deleteById(giftCode);
		
	}



}
