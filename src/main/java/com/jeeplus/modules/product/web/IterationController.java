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
import com.jeeplus.modules.product.entity.Iteration;
import com.jeeplus.modules.product.service.IterationService;


/**
 * 迭代信息Controller
 * @author jinyin
 * @version 2017-08-29
 */
@Controller
@RequestMapping(value = "${adminPath}/iteration/iteration")
public class IterationController extends BaseController {

	@Autowired
	private IterationService iterationService;
	
	@ModelAttribute
	public Iteration get(@RequestParam(required=false) String id) {
		Iteration entity = null;
		if (StringUtils.isNotBlank(id)){
			entity = iterationService.get(id);
		}
		if (entity == null){
			entity = new Iteration();
		}
		return entity;
	}
	
	/**
	 * 迭代列表页面
	 */
	@RequiresPermissions("iteration:iteration:list")
	@RequestMapping(value = {"list", ""})
	public String list(Iteration iteration, HttpServletRequest request, HttpServletResponse response, Model model) {
		Page<Iteration> page = iterationService.findPage(new Page<Iteration>(request, response), iteration); 
		model.addAttribute("page", page);
		return "modules/product/iterationList";
	}

	/**
	 * 查看，增加，编辑迭代表单页面
	 */
	@RequiresPermissions(value={"iteration:iteration:view","iteration:iteration:add","iteration:iteration:edit"},logical=Logical.OR)
	@RequestMapping(value = "form")
	public String form(Iteration iteration, Model model) {
		model.addAttribute("iteration", iteration);
		return "modules/product/iterationForm";
	}

	/**
	 * 保存迭代
	 */
	@RequiresPermissions(value={"iteration:iteration:add","iteration:iteration:edit"},logical=Logical.OR)
	@RequestMapping(value = "save")
	public String save(Iteration iteration, Model model, RedirectAttributes redirectAttributes) throws Exception{
		if (!beanValidator(model, iteration)){
			return form(iteration, model);
		}
		if(!iteration.getIsNewRecord()){//编辑表单保存
			Iteration t = iterationService.get(iteration.getId());//从数据库取出记录的值
			MyBeanUtils.copyBeanNotNull2Bean(iteration, t);//将编辑表单中的非NULL值覆盖数据库记录中的值
			iterationService.save(t);//保存
		}else{//新增表单保存
			iterationService.save(iteration);//保存
		}
		addMessage(redirectAttributes, "保存迭代成功");
		return "redirect:"+Global.getAdminPath()+"/iteration/iteration/?repage";
	}
	
	/**
	 * 删除迭代
	 */
	@RequiresPermissions("iteration:iteration:del")
	@RequestMapping(value = "delete")
	public String delete(Iteration iteration, RedirectAttributes redirectAttributes) {
		iterationService.delete(iteration);
		addMessage(redirectAttributes, "删除迭代成功");
		return "redirect:"+Global.getAdminPath()+"/iteration/iteration/?repage";
	}
	
	/**
	 * 批量删除迭代
	 */
	@RequiresPermissions("iteration:iteration:del")
	@RequestMapping(value = "deleteAll")
	public String deleteAll(String ids, RedirectAttributes redirectAttributes) {
		String idArray[] =ids.split(",");
		for(String id : idArray){
			iterationService.delete(iterationService.get(id));
		}
		addMessage(redirectAttributes, "删除迭代成功");
		return "redirect:"+Global.getAdminPath()+"/iteration/iteration/?repage";
	}
	
	/**
	 * 导出excel文件
	 */
	@RequiresPermissions("iteration:iteration:export")
    @RequestMapping(value = "export", method=RequestMethod.POST)
    public String exportFile(Iteration iteration, HttpServletRequest request, HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "迭代"+DateUtils.getDate("yyyyMMddHHmmss")+".xlsx";
            Page<Iteration> page = iterationService.findPage(new Page<Iteration>(request, response, -1), iteration);
    		new ExportExcel("迭代", Iteration.class).setDataList(page.getList()).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导出迭代记录失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/iteration/iteration/?repage";
    }

	/**
	 * 导入Excel数据

	 */
	@RequiresPermissions("iteration:iteration:import")
    @RequestMapping(value = "import", method=RequestMethod.POST)
    public String importFile(MultipartFile file, RedirectAttributes redirectAttributes) {
		try {
			int successNum = 0;
			int failureNum = 0;
			StringBuilder failureMsg = new StringBuilder();
			ImportExcel ei = new ImportExcel(file, 1, 0);
			List<Iteration> list = ei.getDataList(Iteration.class);
			for (Iteration iteration : list){
				try{
					iterationService.save(iteration);
					successNum++;
				}catch(ConstraintViolationException ex){
					failureNum++;
				}catch (Exception ex) {
					failureNum++;
				}
			}
			if (failureNum>0){
				failureMsg.insert(0, "，失败 "+failureNum+" 条迭代记录。");
			}
			addMessage(redirectAttributes, "已成功导入 "+successNum+" 条迭代记录"+failureMsg);
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入迭代失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/iteration/iteration/?repage";
    }
	
	/**
	 * 下载导入迭代数据模板
	 */
	@RequiresPermissions("iteration:iteration:import")
    @RequestMapping(value = "import/template")
    public String importFileTemplate(HttpServletResponse response, RedirectAttributes redirectAttributes) {
		try {
            String fileName = "迭代数据导入模板.xlsx";
    		List<Iteration> list = Lists.newArrayList(); 
    		new ExportExcel("迭代数据", Iteration.class, 1).setDataList(list).write(response, fileName).dispose();
    		return null;
		} catch (Exception e) {
			addMessage(redirectAttributes, "导入模板下载失败！失败信息："+e.getMessage());
		}
		return "redirect:"+Global.getAdminPath()+"/iteration/iteration/?repage";
    }
	
	
	

}