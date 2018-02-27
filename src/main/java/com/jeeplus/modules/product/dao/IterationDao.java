/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.product.dao;

import com.jeeplus.common.persistence.CrudDao;
import com.jeeplus.common.persistence.annotation.MyBatisDao;
import com.jeeplus.modules.product.entity.Iteration;


/**
 * 迭代信息DAO接口
 * @author jinyin
 * @version 2017-08-29
 */
@MyBatisDao
public interface IterationDao extends CrudDao<Iteration> {

	
}