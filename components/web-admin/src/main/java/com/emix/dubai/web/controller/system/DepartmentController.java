package com.emix.dubai.web.controller.system;

import com.emix.core.exception.ServiceException;
import com.emix.core.web.BaseController;
import com.emix.dubai.business.entity.system.Department;
import com.emix.dubai.business.entity.system.User;
import com.emix.dubai.business.service.system.DepartmentService;
import com.emix.dubai.business.service.system.UserService;
import com.emix.dubai.constants.GlobalConstants;
import com.google.common.collect.Maps;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springside.modules.web.Servlets;

import javax.servlet.ServletRequest;
import javax.validation.Valid;
import java.util.Map;

/**
 * 管理员管理用户的Controller.
 *
 * @author calvin
 */
@Controller
@RequestMapping(value = "/system/dept")
public class DepartmentController extends BaseController {

    private static Map<String, String> sortTypes = Maps.newLinkedHashMap();

    static {
        sortTypes.put("auto", "自动");
        sortTypes.put("deptName", "部门名称");
        sortTypes.put("deptDesc", "部门描述");
    }

    @Autowired
    private DepartmentService departmentService;
    @Autowired
    private UserService userService;

    @RequestMapping(value = "")
    public String list(@RequestParam(value = "sortType", defaultValue = "auto") String sortType,
                       @RequestParam(value = "page", defaultValue = "1") int pageNumber, Model model, ServletRequest request) {
        Map<String, Object> searchParams = Servlets.getParametersStartingWith(request, "search_");

        Page<Department> depts = departmentService.getDepartments(searchParams, pageNumber, GlobalConstants.PAGE_SIZE, sortType);

        model.addAttribute("depts", depts);
        model.addAttribute("sortType", sortType);
        model.addAttribute("sortTypes", sortTypes);
        // 将搜索条件编码成字符串，用于排序，分页的URL
        model.addAttribute("searchParams", Servlets.encodeParameterStringWithPrefix(searchParams, "search_"));

        return "system/deptList";
    }

    @RequestMapping(value = "create", method = RequestMethod.GET)
    public String createForm(Model model) {
        model.addAttribute("dept", new Department());
        model.addAttribute("action", "create");
        return "system/deptForm";
    }

    @RequestMapping(value = "create", method = RequestMethod.POST)
    public String create(@Valid Department dept, RedirectAttributes redirectAttributes) {
        departmentService.create(dept);
        redirectAttributes.addFlashAttribute("deptName", dept.getDeptName());
        return redirect("/system/dept");
    }

    @RequestMapping(value = "update/{id}", method = RequestMethod.GET)
    public String updateForm(@PathVariable("id") Long id, Model model) {
        model.addAttribute("dept", departmentService.getDepartment(id));
        model.addAttribute("action", "update");
        return "system/deptForm";
    }

    @RequestMapping(value = "update", method = RequestMethod.POST)
    public String update(@Valid @ModelAttribute("preloaddept") Department dept, RedirectAttributes redirectAttributes) {
        departmentService.update(dept);
        redirectAttributes.addFlashAttribute("message", "更新部门" + dept.getDeptName() + "成功");
        return redirect("/system/dept");
    }

    @RequestMapping(value = "delete/{id}")
    public String delete(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Department dept = departmentService.getDepartment(id);
        if(dept==null) {
            redirectAttributes.addFlashAttribute("error", String.format("不存在id为「%s」的部门", id));
            return redirect("/system/dept");
        }
        try {
            departmentService.depete(id);
        } catch (ServiceException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return redirect("/system/dept");
        }
        redirectAttributes.addFlashAttribute("message", "删除部门『" + dept.getDeptName() + "』成功");
        return redirect("/system/dept");
    }

    @RequestMapping(value = "active/{id}")
    public String active(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Department dept = departmentService.getDepartment(id);
        if(dept==null) {
            redirectAttributes.addFlashAttribute("error", String.format("不存在id为「%s」的部门", id));
            return redirect("/system/dept");
        }

        departmentService.active(id);
        redirectAttributes.addFlashAttribute("message", "激活部门『" + dept.getDeptName() + "』成功");
        return redirect("/system/dept");
    }

    @RequestMapping(value = "deactive/{id}")
    public String deactive(@PathVariable("id") Long id, RedirectAttributes redirectAttributes) {
        Department dept = departmentService.getDepartment(id);
        if(dept==null) {
            redirectAttributes.addFlashAttribute("error", String.format("不存在id为「%s」的部门", id));
            return redirect("/system/dept");
        }
        try {
            departmentService.deactive(id);
        } catch (ServiceException ex) {
            redirectAttributes.addFlashAttribute("error", ex.getMessage());
            return redirect("/system/dept");
        }
        redirectAttributes.addFlashAttribute("message", "禁用部门『" + dept.getDeptName() + "』成功");
        return redirect("/system/dept");
    }

    /**
     * 使用@ModelAttribute, 实现Struts2 Preparable二次部分绑定的效果,先根据form的id从数据库查出User对象,再把Form提交的内容绑定到该对象上。
     * 因为仅update()方法的form中有id属性，因此本方法在该方法中执行.
     */
    @ModelAttribute("preloadUser")
    public User getUser(@RequestParam(value = "id", required = false) Long id) {
        if (id != null) {
            return userService.getUser(id);
        }
        return null;
    }

    /**
     * Ajax请求校验loginName是否唯一。
     */
    @RequestMapping(value = "checkDeptName")
    @ResponseBody
    public String checkDeptName(@RequestParam("deptName") String deptName) {
        if (departmentService.findByDeptName(deptName) == null) {
            return "true";
        } else {
            return "false";
        }
    }
}
