/**
 * tzdeskϵͳƽ̨
 * tzupload
 * com.tz.core
 * BasePathExpsoer.java
 * ������:xuchengfei 
 * ʱ�䣺2015��11��13��-����10:27:57 
 * 2015̶�ݽ���˾-��Ȩ����
 */
package com.core;

import javax.servlet.ServletContext;

import org.springframework.context.ApplicationContext;
import org.springframework.web.context.ServletContextAware;

import com.util.TmStringUtils;

/**
 * 
 * BasePathExpsoer
 * ������:xuchengfei 
 * ʱ�䣺2015��11��13��-����10:27:57 
 * @version 1.0.0
 * 
 */
public class BasePathExpsoer  implements ServletContextAware{

	private ServletContext application;
	private ApplicationContext context;

	private String rootPath;
	public void init(){
		if(TmStringUtils.isEmpty(rootPath)){
			rootPath = application.getContextPath();
		}
		application.setAttribute("rootPath", rootPath);
		application.setAttribute("resPath", rootPath+"/resources");
	}
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}

	public void setRootPath(String rootPath) {
		this.rootPath = rootPath;
	}
	
}
