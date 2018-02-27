/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.product.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.CrudService;
import com.jeeplus.modules.product.dao.IterationDao;
import com.jeeplus.modules.product.entity.Iteration;


/**
 * 迭代信息Service
 * @author jinyin
 * @version 2017-08-29
 */
@Service
@Transactional(readOnly = true)
public class IterationService extends CrudService<IterationDao, Iteration> {

	public Iteration get(String id) {
		return super.get(id);
	}
	
	public List<Iteration> findList(Iteration iteration) {
		return super.findList(iteration);
	}
	
	public Page<Iteration> findPage(Page<Iteration> page, Iteration iteration) {
		return super.findPage(page, iteration);
	}
	
	@Transactional(readOnly = false)
	public void save(Iteration iteration) {
		super.save(iteration);
	}
	
	@Transactional(readOnly = false)
	public void delete(Iteration iteration) {
		super.delete(iteration);
	}
	
	
	
	
}