package controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import entity.Type;
import service.Type_service;
import util.SearchInfo;
import util.jsonInfo;

@Controller
@RequestMapping("Type")
public class Type_controller {
@Autowired
Type_service service;
@RequestMapping("index")
public void index(ModelMap m, String txt, SearchInfo info,Integer select) {
   
	String where = "";
	if (txt == null)
		txt = "";
	if ( select == null) select =0;
	if (txt != null && txt.length() > 0) {
		switch (select) {
		case 1:
			where = " where type.id like '%" + txt + "%' ";
			break;
        case 2:
        	where = " where type.parentid like '%" + txt + "%' ";
			break;

		default:
			where = " where type.name like '%" + txt + "%' ";
			break;
		}
		
	}
	info.setWhere(where);
	m.put("search", info);
	m.put("list", service.select(info));
}

@RequestMapping("insert")
protected @ResponseBody jsonInfo insert(Type a) {
	service.insert(a);
	return new jsonInfo(1, "");
}

@RequestMapping("add")
protected String add(ModelMap m) {
	return "Type/edit";
}

@RequestMapping("update")
protected @ResponseBody jsonInfo update(Type t) { // 返回值是jsonInfo类内的数据组成的json字符串{"status":"属性值","text":"属性值"}
	service.update(t);
	return new jsonInfo(1, "");
}

@RequestMapping("edit")
protected String edit(ModelMap m, int id) {
	m.put("info", service.getById(id));
	return add(m);
}

@RequestMapping("delete")
protected String delete(int id) {
	service.delete(id);
	return "redirect:index";
}

}
