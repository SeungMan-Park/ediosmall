package com.ediosmall.service;

import java.util.List;

import com.ediosmall.domain.AdminVO;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.dto.Criteria;

public interface AdminService {
	
	// 로그인
	public AdminVO login_check(AdminVO vo) throws Exception;
	
	// 관리자 회원가입
	public void join(AdminVO vo) throws Exception;	
	
	// 아이디 중복체크
	public int checkIdDuplicate(String admin_id) throws Exception;	

	// 회원수정 폼
	public AdminVO member_info(String admin_id) throws Exception;

	// 회원수정 저장
	public boolean modifyPOST(AdminVO vo) throws Exception;	
	
	// 관리자 회원관리_리스트
	public List<MbeiosVO> user_list(Criteria cri) throws Exception;	
	
	// 회원수(페이징기능에 사용)
	public int getTotalCountUser_list(Criteria cri) throws Exception;	
	
	// 관리자 회원관리_수정폼
	public MbeiosVO user_modify(String mbei_id) throws Exception;

	// 관리자 회원수정 저장
	public void user_modifyPost2(MbeiosVO vo) throws Exception;
	
	// 관리자_사용자 비밀번호 변경(저장)
	public void user_modify_pw(MbeiosVO vo) throws Exception;
	
	// 관리자_사용자 계정 삭제 정보 삭제처리
	public void user_delete(String mbei_name) throws Exception;	

}
