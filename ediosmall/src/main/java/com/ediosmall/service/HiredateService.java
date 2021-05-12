package com.ediosmall.service;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

import com.ediosmall.domain.HiredateVO;

public interface HiredateService {
	
	public void hiredate(Date hiredate, int cnt) throws Exception;
	
	

}
