package com.service.permission;
import java.util.HashMap;

import com.bean.Permission;
import com.bean.TzParams;

public interface IPermissionService {

	//我们要学习json---前后台数据交互的---基础简单的文本---文本和流的输出
	//java----json--js/ajax---dom页面中 responseText
	//就是因为js无法调用java中类型和集合，所有说我们要通过一些工具json把java中的对象和数据类型转换成json字符串或者xml字符
	//JSON.parse();json-js中的对象
	//fastjson.jackjson.jsonutil.net.sf.jsonArray
	
//	 [ ===list<map/bean>
//		{name : "内容管理",url : "",opid : 1,pid : "root1"}, map/bean
//		{name : "日记管理",url : "",opid : 2,pid : "root2"}, map/bean
//		{name : "主题框架3",url : "",opid : 3,pid : "root3"}, map/bean
//		{name : "主题框架4",url : "",opid : 4,pid : "root4"}, map/bean
//		{name : "主题框架5",url : "",opid : 5,pid : "root5"}, map/bean
//		{name : "主题框架6",url : "",opid : 6,pid : "root6"} map/bean
//	]
	public HashMap<String,Object> findPermissions(TzParams params);
	
	public int count(TzParams params);
	
	
	public Permission get(Integer id);
	
	
	public int save(Permission permission);
	
	
	public int update(Permission permission);
	
	
	public int delete(TzParams params);
}
