package com.ediosmall.service;

import com.ediosmall.domain.AdminVO;

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

}
