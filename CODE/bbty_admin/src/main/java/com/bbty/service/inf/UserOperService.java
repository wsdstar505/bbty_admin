package com.bbty.service.inf;

import com.bbty.pojo.UserOper;

public interface UserOperService {

	public void saveUserOper(UserOper oper);
	
	public void uptUserOperBySelective(UserOper oper);

	public void deleteUserOper(UserOper userOper);

}
