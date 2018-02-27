/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.product.service;

import java.util.List;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.service.CrudService;
import com.jeeplus.modules.product.dao.EditionDao;
import com.jeeplus.modules.product.entity.Edition;

/**
 * 版本信息Service
 * @author jinyin
 * @version 2017-09-27
 */
@Service
@Transactional(readOnly = true)
public class EditionService extends CrudService<EditionDao, Edition> {

	public Edition get(String id) {
		return super.get(id);
	}
	
	public List<Edition> findList(Edition edition) {
		return super.findList(edition);
	}
	
	public Page<Edition> findPage(Page<Edition> page, Edition edition) {
		
		
		String sqlString = super.dataScopeFilter(edition.getCurrentUser(), "o", "u");
		
		edition.getSqlMap().put("dsfss", sqlString.toString());
		edition.setPage(page);
		page.setList(dao.findList(edition));
		return page;
		
		
		
		//return super.findPage(page, edition);
	}
	
	@Transactional(readOnly = false)
	public void save(Edition edition) {
		super.save(edition);
	}
	
	@Transactional(readOnly = false)
	public void delete(Edition edition) {
		super.delete(edition);
	}
	
	
	
	
}