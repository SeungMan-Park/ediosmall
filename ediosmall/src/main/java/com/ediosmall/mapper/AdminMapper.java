package com.ediosmall.mapper;

import com.ediosmall.domain.AdminVO;

public interface AdminMapper {
	
	public AdminVO login_check(AdminVO vo) throws Exception;
	
	public void login_update(String admin_id) throws Exception;
	
	// 관리자 회원가입
	public void join(AdminVO vo) throws Exception;
	
	// 아이디 중복체크
	public int checkIdDuplicate(String admin_id) throws Exception;	
	
	// 회원수정 폼
	public AdminVO member_info(String admin_id) throws Exception;
	
	// 회원수정 저장
	public int modifyPOST(AdminVO vo) throws Exception;	
	

}
