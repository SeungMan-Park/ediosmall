package com.ediosmall.service;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.domain.UserInfoVO;
import com.ediosmall.dto.LoginDTO;
import com.ediosmall.mapper.MemberMapper;

import lombok.Setter;

@Service  // bean name : memberServiceImpl 
public class MemberServiceImpl implements MemberService {
	
	@Setter(onMethod_ = @Autowired)
	private MemberMapper mapper;

	@Override
	public int checkIdDuplicate(String mbei_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.checkIdDuplicate(mbei_id);
	}

	// 회원가입
	@Override
	public void join(MbeiosVO vo) throws Exception {
		
		mapper.join(vo);
		
	}

	@Override
	public MbeiosVO login_ok(LoginDTO dto) throws Exception {
		
		return mapper.login_ok(dto);
	}

	@Override
	public MbeiosVO member_info(String mbei_id) throws Exception {
		// TODO Auto-generated method stub
		return mapper.member_info(mbei_id);
	}

	@Override
	public boolean modifyPOST(MbeiosVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.modifyPOST(vo) == 1;
	}

	@Override
	public MbeiosVO find_pwd(String mbei_id, String mbei_name) throws Exception {
		// TODO Auto-generated method stub
		return mapper.find_pwd(mbei_id, mbei_name);
	}

	@Override
	public String find_id(String mbei_name) throws Exception {
		// TODO Auto-generated method stub
		return mapper.find_id(mbei_name);
	}

	@Override
	public void deleteUser(String mbei_name) throws Exception {
		// TODO Auto-generated method stub
		
		mapper.deleteUser(mbei_name);
	}

	@Override
	public List<UserInfoVO> userinfo_list() throws Exception {
		// TODO Auto-generated method stub
		return mapper.userinfo_list();
	}

	@Override
	public void modify_pw(MbeiosVO vo) throws Exception {
		// TODO Auto-generated method stub
		mapper.modify_pw(vo);
	}

	@Override
	public MbeiosVO find_pwd_cryPassEnc(String mbei_id, String mbei_name) throws Exception {
		// TODO Auto-generated method stub
		return mapper.find_pwd_cryPassEnc(mbei_id, mbei_name);
	}

	@Override
	public void pw_search(LoginDTO dto) throws Exception {
		// TODO Auto-generated method stub
		mapper.pw_search(dto);
		
	}

	@Override
	public MbeiosVO login_check(MbeiosVO vo) throws Exception {
		// TODO Auto-generated method stub
		return mapper.login_check(vo);
	}

}
