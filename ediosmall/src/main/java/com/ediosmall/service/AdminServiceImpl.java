package com.ediosmall.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.AdminVO;
import com.ediosmall.domain.MbeiosVO;
import com.ediosmall.dto.AdminDTO;
import com.ediosmall.dto.Criteria;
import com.ediosmall.mapper.AdminMapper;

import lombok.Setter;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Setter(onMethod_ = @Autowired)
	private AdminMapper adminMapper;

	@Override
	public AdminVO login_check(AdminVO vo) throws Exception {
		
		AdminVO adVO = adminMapper.login_check(vo);
		
		if(adVO != null) {
			adminMapper.login_update(vo.getAdmin_id());  // 로그인 시간 업데이트
		}
		
		return adVO;  // 이전 로그인 시간정보
		
	}
	
	@Override
	public AdminVO loginRight_check(AdminVO vo) throws Exception {
		
		AdminVO adRightVO = adminMapper.loginRight_check(vo);
		
		return adRightVO;
	}

	@Override
	public void join(AdminVO vo) throws Exception {
		
		adminMapper.join(vo);
		
	}

	@Override
	public int checkIdDuplicate(String admin_id) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.checkIdDuplicate(admin_id);
	}

	@Override
	public AdminVO member_info(String admin_id) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.member_info(admin_id);
	}

	@Override
	public boolean modifyPOST(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.modifyPOST(vo) == 1;
	}

	@Override
	public List<MbeiosVO> user_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.user_list(cri);
	}

	@Override
	public int getTotalCountUser_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.getTotalCountUser_list(cri);
	}

	@Override
	public MbeiosVO user_modify(String mbei_id) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.user_modify(mbei_id);
	}

	@Override
	public void user_modifyPost2(MbeiosVO vo) throws Exception {
		// TODO Auto-generated method stub
		adminMapper.user_modifyPost2(vo);
	}

	@Override
	public void user_modify_pw(MbeiosVO vo) throws Exception {
		// TODO Auto-generated method stub
		adminMapper.user_modify_pw(vo);
	}

	@Override
	public void user_delete(String mbei_name) throws Exception {
		// TODO Auto-generated method stub
		
		adminMapper.user_delete(mbei_name);
		
	}

	@Override
	public List<AdminVO> admin_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.admin_list(cri);
	}

	@Override
	public int getTotalCountAdmin_list(Criteria cri) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.getTotalCountAdmin_list(cri);
	}

	@Override
	public void adminRightChange(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		adminMapper.adminRightChange(vo);
	}

	@Override
	public AdminVO adLogin_dto_ok(AdminDTO dto) throws Exception {
		// TODO Auto-generated method stub
		return adminMapper.adLogin_dto_ok(dto);
	}

	@Override
	public void modify_pw(AdminVO vo) throws Exception {
		// TODO Auto-generated method stub
		adminMapper.modify_pw(vo);
	}

	@Override
	public void adDeleteAdmin(String admin_id) throws Exception {
		// TODO Auto-generated method stub
		adminMapper.adDeleteAdmin(admin_id);
	}




}
