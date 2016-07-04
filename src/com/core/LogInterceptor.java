package com.core;
import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.context.ServletContextAware;
import com.bean.AdminStat;
import com.bean.AdminUser;
import com.dao.adminstat.IAdminStatMapper;
import com.util.TmStringUtils;
import com.util.ip.TmIpUtil;

@Aspect
public class LogInterceptor implements ServletContextAware {

    private ServletContext application;
	@Autowired
	private IAdminStatMapper adminStatMapper;
	@Around("execution(* com.service.*.*.*(..))")//环绕通知
	public Object doBasicProfiling(ProceedingJoinPoint point) throws Throwable {
		String methodName = point.getSignature().getName();
		if(TmStringUtils.isNotEmpty(methodName) && methodName.equals("getLogin")){
			return  point.proceed();
		}
		// 执行该方法
		Object classObj = point.getTarget();//拦截的类名
		long start = System.currentTimeMillis();
		Object object = point.proceed();
		long end = System.currentTimeMillis();
		long time = (end - start);
		Object[] params = point.getArgs();
		StringBuilder builder = new StringBuilder("");
		if(params.length>0){
			for (int i = 0; i < params.length; i++) {
				builder.append(String.valueOf(params[i]));
				if(i<params.length-1){
					builder.append(",");
				}
			}
		}
		//执行的类
		String className = classObj.getClass().getName();
		//返回类型
		String returnType = null;
		if(object!=null){
			returnType = object.getClass().getName();
		}
		
		//保存日记到数据库 
		try {
			saveLog(className,methodName,time);
		} catch (Exception e) {
		}
		System.out.println("【Tm】【Service AOP拦截】【Class："+className+"】【Method："+methodName+"】【ReturnType："+returnType+"】【Time："+time+"ms】");
		return object;
	}
	private void saveLog(String className,String methodName,long time){
		AdminStat adminStat = new AdminStat();
		AdminUser adminUser = (AdminUser) application.getAttribute("user_log");
		HttpServletRequest request = (HttpServletRequest) application.getAttribute("request_log");
		adminStat.setClassname(className);
		adminStat.setUserId(adminUser.getId());
		adminStat.setMethod(methodName);
		adminStat.setTime(time);
		adminStat.setIp(TmIpUtil.getIpAddress(request));
		adminStat.setIpAddress(TmIpUtil.ipLocation(request));
		adminStat.setUsername(adminUser.getUsername());
		adminStat.setModel("content");
		adminStat.setDescription("content");
		adminStatMapper.Save(adminStat);
	}
	
	@Override
	public void setServletContext(ServletContext application) {
		this.application = application;
	}

}
