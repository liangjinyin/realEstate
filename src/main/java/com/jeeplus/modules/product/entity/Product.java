/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.product.entity;

import org.hibernate.validator.constraints.Length;

import com.jeeplus.common.persistence.DataEntity;
import com.jeeplus.common.utils.excel.annotation.ExcelField;

/**
 * 产品信息Entity
 * @author jinyin
 * @version 2017-08-29
 */
public class Product extends DataEntity<Product> {
	
	private static final long serialVersionUID = 1L;
	private String name;		// 产品名称
	private String proManager;		// 产品负责人
	private String testManager;		// 测试负责人
	private String issueManager;		// 发布负责人
	private String status;		// 产品状态
	private String type;		// 产品类型
	private String describe;		// 产品描述
	private String iteration;		// 迭代
	private String interview;		// 访问控制
	
	public Product() {
		super();
	}

	public Product(String id){
		super(id);
	}

	@Length(min=0, max=64, message="产品名称长度必须介于 0 和 64 之间")
	@ExcelField(title="产品名称", align=2, sort=1)
	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}
	
	@Length(min=0, max=64, message="产品负责人长度必须介于 0 和 64 之间")
	@ExcelField(title="产品负责人", align=2, sort=2)
	public String getProManager() {
		return proManager;
	}

	public void setProManager(String proManager) {
		this.proManager = proManager;
	}
	
	@Length(min=0, max=64, message="测试负责人长度必须介于 0 和 64 之间")
	@ExcelField(title="测试负责人", align=2, sort=3)
	public String getTestManager() {
		return testManager;
	}

	public void setTestManager(String testManager) {
		this.testManager = testManager;
	}
	
	@Length(min=0, max=64, message="发布负责人长度必须介于 0 和 64 之间")
	@ExcelField(title="发布负责人", align=2, sort=4)
	public String getIssueManager() {
		return issueManager;
	}

	public void setIssueManager(String issueManager) {
		this.issueManager = issueManager;
	}
	
	@Length(min=0, max=64, message="产品状态长度必须介于 0 和 64 之间")
	@ExcelField(title="产品状态", dictType="pro_status", align=2, sort=5)
	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	@Length(min=0, max=64, message="产品类型长度必须介于 0 和 64 之间")
	@ExcelField(title="产品类型", dictType="pro_type", align=2, sort=6)
	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}
	
	@Length(min=0, max=64, message="产品描述长度必须介于 0 和 64 之间")
	@ExcelField(title="产品描述", align=2, sort=7)
	public String getDescribe() {
		return describe;
	}

	public void setDescribe(String describe) {
		this.describe = describe;
	}
	
	@Length(min=0, max=64, message="迭代长度必须介于 0 和 64 之间")
	@ExcelField(title="迭代", align=2, sort=8)
	public String getIteration() {
		return iteration;
	}

	public void setIteration(String iteration) {
		this.iteration = iteration;
	}
	
	@Length(min=0, max=64, message="访问控制长度必须介于 0 和 64 之间")
	@ExcelField(title="访问控制", dictType="interview", align=2, sort=9)
	public String getInterview() {
		return interview;
	}

	public void setInterview(String interview) {
		this.interview = interview;
	}
	
}