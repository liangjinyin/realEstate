/**
 * Copyright &copy; 2015-2020 <a href="http://www.jeeplus.org/">JeePlus</a> All rights reserved.
 */
package com.jeeplus.modules.product.web;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.validation.ConstraintViolationException;

import org.apache.shiro.authz.annotation.Logical;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.google.common.collect.Lists;
import com.jeeplus.common.config.Global;
import com.jeeplus.common.persistence.Page;
import com.jeeplus.common.utils.DateUtils;
import com.jeeplus.common.utils.MyBeanUtils;
import com.jeeplus.common.utils.StringUtils;
import com.jeeplus.common.utils.excel.ExportExcel;
import com.jeeplus.common.utils.excel.ImportExcel;
import com.jeeplus.common.web.BaseController;
import com.jeeplus.modules.product.entity.Edition;
import com.jeeplus.modules.product.service.EditionService;

/**
 * 版本信息Controller
 * @author jinyin
 * @version 2017-09-27
 */
@Controller
@RequestMapping(value = "${adminPath}/edition/edition")
public class EditionController extends BaseController {

	@Autowired
	private EditionService editionService;
	
	@ModelAttribute
	public Edition get(@RequestParam(required=false) String id) {
		Edition entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = editionService.get(id);
		}
		if (entity == null){
			entity = new Edition();
		}
		return entity;
	}
	
	/**
	 * 版本列表页面
	 */
	@RequiresPermissions("edition:edition:list")
	@RequestMapping(value = {"list", ""})
	public String list(Edition edition, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Edition> page = editionService.findPage(new Page<Edition>(request, response), edition); 
		model.addAttribute("page", page);
		return "modules/edition/editionList";
	}

	/**
	 * 查看，增加，编辑版本表单页面
	 */
	@RequiresPermissions(value={"edition:edition:view","edition:edition:add","edition:edition:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(Edition edition, Model model) {
		model.addAttribute("edition", edition);
		return "modules/edition/editionForm";
	}

	/**
	 * 保存版本
	 */
	@RequiresPermissions(value={"edition:edition:add","edition:edition:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(Edition edition, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (!beanValidator(model, edition)){
			return form(edition, model);
		}
		if(!edition.getIsNewRecord()){//编辑表单保存
			Edition t = editionService.get(edition.getId());//从数据库取出记录的值
			MyBeanUtils.copyBeanNotNull2Bean(edition, t);//将编辑表单中的非NULL值覆盖数据库记录中的值
			editionService.save(t);//保存
		}else{//新增表单保存
			editionService.save(edition);//保存
		}
		addMessage(redirectAttributes, "保存版本成功");
		return "redirect:"+Global.getAdminPath()+"/edition/edition/?repage";
	}
	
	/**
	 * 删除版本
	 */
	@RequiresPermissions("edition:edition:del")
	@RequestMapping(value = "delete")
	public String delete(Edition edition, RedirectAttributes redirectAttributes) {
		editionService.delete(edition);
		addMessage(redirectAttributes, "删除版本成功");
		return "redirect:"+Global.getAdminPath()+"/edition/edition/?repage";
	}
	
	/**
	 * 批量删除版本
	 */
	@RequiresPermissions("edition:edition:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			editionService.delete(editionService.get(id));
		}
		addMessage(redirectAttributes, "删除版本成功");
		return "redirect:"+Global.getAdminPath()+"/edition/edition/?repage";
	}
	
	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("edition:edition:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(Edition edition, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "版本"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<Edition> page = editionService.findPage(new Page<Edition>(request, response, -1), edition);
    		new ExportExcel("版本", Edition.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出版本记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/edition/edition/?repage";
    }

	/**
	 * 导入Excel数据

	 */
	@RequiresPermissions("edition:edition:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<Edition> list = ei.getDataList(Edition.class);
			for (Edition edition : list){
				try{
					editionService.save(edition);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条版本记录。");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条版本记录"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入版本失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/edition/edition/?repage";
    }
	
	/**
	 * 下载导入版本数据模板
	 */
	@RequiresPermissions("edition:edition:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "版本数据导入模板.xlsx";
    		List<Edition> list = Lists.newArrayList(); 
    		new ExportExcel("版本数据", Edition.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/edition/edition/?repage";
    }
	
	
	

}