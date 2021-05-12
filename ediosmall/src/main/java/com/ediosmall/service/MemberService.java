package com.ediosmall.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.domain.UserInfoVO;
import com.ediosmall.dto.LoginDTO;

public interface MemberService {
	
	// 아이디 중복체크
	public int checkIdDuplicate(String mbei_id) throws Exception;
	
	// 회원가입
	public void join(MbeiosVO vo) throws Exception;
	
	public MbeiosVO login_ok(LoginDTO dto) throws Exception;
	
	public MbeiosVO login_check(MbeiosVO vo) throws Exception; 
	
	// 회원수정 폼
	public MbeiosVO member_info(String mbei_id) throws Exception;	
	
	// 회원수정 저장
	public boolean modifyPOST(MbeiosVO vo) throws Exception;
	
	// 회원 삭제(탈퇴)
	public void deleteUser(String mbei_name) throws Exception;
		
	
	
	// 아이디 찾기 : 화면에 출력
	public String find_id(String mbei_name) throws Exception;
	
	
	// 비밀번호 찾기
	public MbeiosVO find_pwd(String mbei_id, String mbei_name) throws Exception;
	
	// 비밀번호 찾기 : 메일로 전송 (암호화 전제, 수정파일 전송)
	public MbeiosVO find_pwd_cryPassEnc(String mbei_id, String mbei_name) throws Exception;
	
	
	
	// mapper 작업을 전제로 진행되었다.
	public List<UserInfoVO> userinfo_list() throws Exception;
	
	// 사용자 비밀번호 변경
	public void modify_pw(MbeiosVO vo) throws Exception;	
	
	public void pw_search(LoginDTO dto) throws Exception;



}
