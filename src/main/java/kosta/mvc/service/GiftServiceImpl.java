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
		// TODO Auto-generated method stub

	}

	@Override
	public Gift update(Gift gift) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void delete(Gift gift) {
		// TODO Auto-generated method stub

	}

}
