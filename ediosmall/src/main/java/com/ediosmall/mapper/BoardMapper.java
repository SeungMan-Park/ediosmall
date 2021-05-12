package com.ediosmall.mapper;

import java.util.List;

import com.ediosmall.domain.AdBoardVO;
import com.ediosmall.domain.BoardVO;
import com.ediosmall.dto.Criteria;

public interface BoardMapper {
	
	public List<BoardVO> list();
	
	// 페이지 번호
	public List<BoardVO> getListWithSearchPaging(Criteria cri);
	
	public int getTotalCount(Criteria cri);
	
	// 게시물등록 - 사용자모드
	public void insert(BoardVO board);
	
	// 게시물등록 - 관리자모드
	public void adInsert(AdBoardVO board);
	
	public BoardVO read(Long brd_num);
	
	public int modify(BoardVO board);
	
	public int remove(Long brd_num);

}
