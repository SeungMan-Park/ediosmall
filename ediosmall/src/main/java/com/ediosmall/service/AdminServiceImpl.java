package com.ediosmall.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.AdminVO;
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


}
