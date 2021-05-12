package com.ediosmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.AdBoardVO;
import com.ediosmall.domain.BoardVO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.mapper.BoardMapper;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class BoardServiceImpl implements BoardService {
	
	@Setter(onMethod_ = @Autowired)
	private BoardMapper mapper;

	@Override
	public List<BoardVO> list() {
		// TODO Auto-generated method stub
		return mapper.list();
	}

	@Override
	public List<BoardVO> getListWithSearchPaging(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getListWithSearchPaging(cri);
	}

	@Override
	public int getTotalCount(Criteria cri) {
		// TODO Auto-generated method stub
		return mapper.getTotalCount(cri);
	}

	@Override
	public void insert(BoardVO board) {
		// TODO Auto-generated method stub
		mapper.insert(board);
	}

	@Override
	public BoardVO read(Long brd_num) {
		// TODO Auto-generated method stub
		return mapper.read(brd_num);
	}

	@Override
	public int modify(BoardVO board) {
		// TODO Auto-generated method stub
		return mapper.modify(board);
	}

	@Override
	public int remove(Long brd_num) {
		// TODO Auto-generated method stub
		return mapper.remove(brd_num);
	}

	@Override
	public void adInsert(AdBoardVO board) {
		// TODO Auto-generated method stub
		mapper.adInsert(board);
	}
	

}
