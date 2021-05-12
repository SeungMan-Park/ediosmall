package com.ediosmall.service;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.ediosmall.domain.HiredateVO;
import com.ediosmall.mapper.HiredateMapper;

import lombok.Setter;

@Service
public class HiredateServiceImpl implements HiredateService {
	
	@Setter(onMethod_ = @Autowired)
	private HiredateMapper hiredateMapper;

	@Override
	public void hiredate(Date hiredate, int cnt) throws Exception {
		// TODO Auto-generated method stub
		
	}


}
