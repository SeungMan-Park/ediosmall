package com.ediosmall.mapper;

import java.util.Date;

import org.apache.ibatis.annotations.Param;

public interface HiredateMapper {
	
	public void hiredate(@Param("hiredate") Date hiredate, @Param("cnt") int cnt) throws Exception;

}
