/**

 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.product.entity;

import java.util.Date;

import org.hibernate.validator.constraints.Length;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 版本信息Entity
 * @author jinyin
 * @version 2017-09-27
 */
public class Edition extends DataEntity<Edition> {
	
	private static final long serialVersionUID = 1L;
	private String product;		// 产品名称
	private String iteration;		// 关联迭代
	private String editionNum;		// 发布版本号
	private String createMan;		// 构建者
	private Date date;		// 打包日期
	private String codeAddress;		// 源代码地址
	private String loadAddress;		// 下载地址
	
	public Edition() {
		super();
	}

	public Edition(String id){
		super(id);
	}

	@Length(min=0, max=64, message="产品名称长度必须介于 0 和 64 之间")
	@ExcelField(title="产品名称", align=2, sort=1)
	public String getProduct() {
		return product;
	}

	public void setProduct(String product) {
		this.product = product;
	}
	
	@Length(min=0, max=64, message="关联迭代长度必须介于 0 和 64 之间")
	@ExcelField(title="关联迭代", align=2, sort=2)
	public String getIteration() {
		return iteration;
	}

	public void setIteration(String iteration) {
		this.iteration = iteration;
	}
	
	@Length(min=0, max=64, message="发布版本号长度必须介于 0 和 64 之间")
	@ExcelField(title="发布版本号", align=2, sort=3)
	public String getEditionNum() {
		return editionNum;
	}

	public void setEditionNum(String editionNum) {
		this.editionNum = editionNum;
	}
	
	@Length(min=0, max=64, message="构建者长度必须介于 0 和 64 之间")
	@ExcelField(title="构建者", align=2, sort=4)
	public String getCreateMan() {
		return createMan;
	}

	public void setCreateMan(String createMan) {
		this.createMan = createMan;
	}
	
	@JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss")
	@ExcelField(title="打包日期", align=2, sort=5)
	public Date getDate() {
		return date;
	}

	public void setDate(Date date) {
		this.date = date;
	}
	
	@Length(min=0, max=64, message="源代码地址长度必须介于 0 和 64 之间")
	@ExcelField(title="源代码地址", align=2, sort=6)
	public String getCodeAddress() {
		return codeAddress;
	}

	public void setCodeAddress(String codeAddress) {
		this.codeAddress = codeAddress;
	}
	
	@Length(min=0, max=64, message="下载地址长度必须介于 0 和 64 之间")
	@ExcelField(title="下载地址", align=2, sort=7)
	public String getLoadAddress() {
		return loadAddress;
	}

	public void setLoadAddress(String loadAddress) {
		this.loadAddress = loadAddress;
	}
	
}