package com.ediosmall.service;

import com.ediosmall.dto.EmailDTO;

public interface EmailService {
	
	public void sendMail(EmailDTO dto, String message);

}
