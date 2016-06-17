package com.auto;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import org.apache.commons.io.FileUtils;

import com.util.TmFileUtil;
import com.util.TmStringUtils;

import ch.qos.logback.core.util.FileUtil;

public class AutoProject {
	//制动创建类
    private static String beanName="Message";
    private static String smallBeanName=beanName.toLowerCase();
	//目录结构
	private static String  srcPath="src/";
	private static String  basePath="com/bean/";
	private static String  daoPath="com/dao/";
	private static String  servicePath="com/service/";
	private static String  serviceImplPath="com/service/"+smallBeanName+"/Impl/";
	private static String  webPath="com/web/"+smallBeanName+"/";
	private static String  pagePath="/WebContent/Web-INF/pages/";
	
	//模板目录
	private static String  beanTemplate="template/bean.txt";
	private static String  mapperTemplate="template/mapper.txt";
	private static String  xmlTemplate="template/sql.txt";
	private static String  serviceTemplate="template/service.txt";
	private static String  serviceImplTemplate="template/serviceImpl.txt";
	private static String   webTemplate="template/web.txt";
	private static String   pageTemplate="template/list.txt";
	//包名
	private static String  beanPackage="com.bean";
	private static String  daoPackage="com.dao";
	private static String  servicePackage="com.service" ;
	private static String  serviceImplPackage="com.service"+smallBeanName+".impl";
	private static String  webPackage="com.web";
	//注释
	private static String   description="信息管理";
	private static String   author="ksmile";
	private static String   telephone="13261814680";
	private static String   qq="1012474315";
	private static String   email="1012474315@qq.com";
	private static String   date=new  SimpleDateFormat("yyyy年MM月dd日  HH:mm:ss").format(new Date());
	
	//创建web
	public static void  createWeb() throws IOException{
		boolean flag=false;
		//获取bean 根目录
	    String path=getRoot(srcPath+webPath);
	    //自动创建根目录
		File  rootFile=new File(path);
		//判断根目录文件是否存在
		if(!rootFile.exists()) rootFile.mkdirs();
		//写入目标文件
		File  beanfile=new File(rootFile,beanName +"Controller.java");
		//获取模板页面路径
		String templete=getRoot(webTemplate);
		//读取模板内容
		String content=TmFileUtil.readFileByLines(templete);
		//替换模板内容
		content=replaceTemplate(content);
		//判断文件是否存在 并提示覆盖操作
		if(beanfile.exists()){
			System.out.println("[自动构建提示:]你当前创建的:["+templete+"创建已经存在,是否覆盖yes/no]");
			 //控制台输入对象
		    Scanner  scanner=new Scanner(System.in);
			 //获取控制台输入的值
			String  mark=scanner.nextLine();
			if(mark.equalsIgnoreCase("yes")){
				//替换写入目标文件
				FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");
			}
		}else{
				
			   System.out.println("[自动构建提示:]你当前创建的:【"+beanfile.getAbsolutePath()+"】写入到【"+webPackage+"】成功！！！");
			    //替换写入目标文件
				FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");	
		  }
	}
	
	
	
	
	//创建serviceImpl
   public static void  createServiceImpl() throws IOException{
			boolean flag=false;
			//获取bean 根目录
		    String path=getRoot(srcPath+serviceImplPath);
		    //自动创建根目录
			File  rootFile=new File(path);
			//判断根目录文件是否存在
			if(!rootFile.exists()) rootFile.mkdirs();
			//写入目标文件
			File  beanfile=new File(rootFile,beanName +"ServiceImpl.java");
			//获取模板页面路径
			String templete=getRoot(serviceImplTemplate);
			//读取模板内容
			String content=TmFileUtil.readFileByLines(templete);
			//替换模板内容
			content=replaceTemplate(content);
			//判断文件是否存在 并提示覆盖操作
			if(beanfile.exists()){
				System.out.println("[自动构建提示:]你当前创建的:["+templete+"创建已经存在,是否覆盖yes/no]");
				 //控制台输入对象
			    Scanner  scanner=new Scanner(System.in);
				 //获取控制台输入的值
				String  mark=scanner.nextLine();
				if(mark.equalsIgnoreCase("yes")){
					//替换写入目标文件
					FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");
				}
			}else{
					
				   System.out.println("[自动构建提示:]你当前创建的:【"+beanfile.getAbsolutePath()+"】写入到【"+serviceImplPackage+"】成功！！！");
				    //替换写入目标文件
					FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");	
			  }
		}

	
    	//创建service
	   public static void  createService() throws IOException{
				boolean flag=false;
				//获取bean 根目录
			    String path=getRoot(srcPath+servicePath+smallBeanName);
			    //自动创建根目录
				File  rootFile=new File(path);
				//判断根目录文件是否存在
				if(!rootFile.exists()) rootFile.mkdirs();
				//写入目标文件
				File  beanfile=new File(rootFile,"I"+beanName +"Service.java");
				//获取模板页面路径
				String templete=getRoot(serviceTemplate);
				//读取模板内容
				String content=TmFileUtil.readFileByLines(templete);
				//替换模板内容
				content=replaceTemplate(content);
				//判断文件是否存在 并提示覆盖操作
				if(beanfile.exists()){
					System.out.println("[自动构建提示:]你当前创建的:["+templete+"创建已经存在,是否覆盖yes/no]");
					 //控制台输入对象
				    Scanner  scanner=new Scanner(System.in);
					 //获取控制台输入的值
					String  mark=scanner.nextLine();
					if(mark.equalsIgnoreCase("yes")){
						//替换写入目标文件
						FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");
					}
				}else{
						
					   System.out.println("[自动构建提示:]你当前创建的:【"+beanfile.getAbsolutePath()+"】写入到【"+servicePackage+"】成功！！！");
					    //替换写入目标文件
						FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");	
				  }
			}
	
	
	
	
	
	//创建sql
		public static void  createSqlXml() throws IOException{
			boolean flag=false;
			//获取bean 根目录
		    String path=getRoot(srcPath+daoPath+smallBeanName);
		    //自动创建根目录
			File  rootFile=new File(path);
			//判断根目录文件是否存在
			if(!rootFile.exists()) rootFile.mkdirs();
			//写入目标文件
			File  beanfile=new File(rootFile,beanName+".xml");
			//获取模板页面路径
			String templete=getRoot(xmlTemplate);
			//读取模板内容
			String content=TmFileUtil.readFileByLines(templete);
			//替换模板内容
			content=replaceTemplate(content);
			//判断文件是否存在 并提示覆盖操作
			if(beanfile.exists()){
				System.out.println("[自动构建提示:]你当前创建的:["+templete+"创建已经存在,是否覆盖yes/no+]");
				 //控制台输入对象
			    Scanner  scanner=new Scanner(System.in);
				 //获取控制台输入的值
				String  mark=scanner.nextLine();
				if(mark.equalsIgnoreCase("yes")){
					//替换写入目标文件
					FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");
				}
			}else{
					
				   System.out.println("[自动构建提示:]你当前创建的:【"+beanfile.getAbsolutePath()+"】写入到【"+daoPackage+"】成功！！！");
				    //替换写入目标文件
					FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");	
			  }
		}
	//创建bean
	public static void  createBean() throws IOException{
		boolean flag=false;
		//获取bean 根目录
	    String path=getRoot(srcPath+basePath);
	    //自动创建根目录
		File  rootFile=new File(path);
		//判断根目录文件是否存在
		if(!rootFile.exists()) rootFile.mkdirs();
		//写入目标文件
		File  beanfile=new File(rootFile,beanName+".java");
		//获取模板页面路径
		String templete=getRoot(beanTemplate);
		//读取模板内容
		String content=TmFileUtil.readFileByLines(templete);
		//替换模板内容
		content=replaceTemplate(content);
		//判断文件是否存在 并提示覆盖操作
		if(beanfile.exists()){
			System.out.println("[自动构建提示:]你当前创建的:["+templete+"创建已经存在,是否覆盖yes/no+]");
			 //控制台输入对象
		    Scanner  scanner=new Scanner(System.in);
			 //获取控制台输入的值
			String  mark=scanner.nextLine();
			if(mark.equalsIgnoreCase("yes")){
				//替换写入目标文件
				FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");
			}
		}else{
				
			   System.out.println("[自动构建提示:]你当前创建的:【"+beanfile.getAbsolutePath()+"】写入到【"+beanPackage+"】成功！！！");
			    //替换写入目标文件
				FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");	
		  }
	}
	//创建dao
	public static void  createDao() throws IOException{
		boolean flag=false;
	
		//获取bean 根目录
	    String path=getRoot(srcPath+daoPath+smallBeanName);
	    //自动创建根目录
		File  rootFile=new File(path);
		//判断根目录文件是否存在
		if(!rootFile.exists()) rootFile.mkdirs();
		//写入目标文件
    	File  beanfile=new File(rootFile,"I"+beanName+"Mapper.java");
	    //获取模板页面路径
        String templete=getRoot(mapperTemplate);
		//读取模板内容
		String content=TmFileUtil.readFileByLines(templete);
		//替换模板内容
		content=replaceTemplate(content);
		//判断文件是否存在 并提示覆盖操作
		if(beanfile.exists()){
			System.out.println("[自动构建提示:]你当前创建的:["+templete+"创建已经存在,是否覆盖yes/no+]");
			 //控制台输入对象
		    Scanner  scanner=new Scanner(System.in);
			 //获取控制台输入的值
			String  mark=scanner.nextLine();
			if(mark.equalsIgnoreCase("yes")){
				//替换写入目标文件
				FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");
			}
		}else{
				
			   System.out.println("[自动构建提示:]你当前创建的:【"+beanfile.getAbsolutePath()+"】写入到【"+daoPackage+"】成功！！！");
			    //替换写入目标文件
				FileUtils.writeStringToFile(beanfile.getAbsoluteFile(),content,"UTF-8");	
		  }
	}
	//替换模板
	public  static String  replaceTemplate(String content){
		if(TmStringUtils.isNotEmpty(content)){
			content=content.replaceAll("\\[beanPackage\\]", beanPackage)
					.replaceAll("\\[daoPackage\\]", daoPackage)
					.replaceAll("\\[serviceImplPackage\\]", serviceImplPackage)
					.replaceAll("\\[servicePackage\\]", servicePackage)
					.replaceAll("\\[webPackage\\]", webPackage)
					.replaceAll("\\[description\\]", description)
					.replaceAll("\\[author\\]", author)
					.replaceAll("\\[date\\]", date)
					.replaceAll("\\[qq\\]", qq)
					.replaceAll("\\[email\\]", email)
					.replaceAll("\\[telephone\\]", telephone)
					.replaceAll("\\[smallBeanName\\]", smallBeanName)
					.replaceAll("\\[beanName\\]", beanName);
			return content;
		}else{
			return "";
		}
	}
	
	public static String getRoot(String path){
		
		  return new File(System.getProperty("user.dir"),path).getAbsolutePath();
	}
	
	
	public static void main(String[] args) throws IOException {
		 //createBean();
		 //createDao();
		 //createSqlXml();
		 // createService();
		 //createServiceImpl();
		   createWeb();
		
		
	}
//	//替换模板
//	public  static String  replaceTemplates(String content){
//		if(TmStringUtils.isNotEmpty(content)){
//			content=content.replaceAll("\\[beanPackage\\]", beanPackage)
//					.replaceAll("\\[description\\]", description)
//					.replaceAll("\\[author\\]", author)
//					.replaceAll("\\[date\\]", date)
//					.replaceAll("\\[qq\\]", qq)
//					.replaceAll("\\[email\\]", email)
//					.replaceAll("\\[beanName\\]", beanName);
//			return content;
//		}else{
//			return "";
//		}
//	}
//	
//	public static String getRoot(String path){
//		
//		  return new File(System.getProperty("user.dir"),path).getAbsolutePath();
//	}
//	
//	
//	public static void main(String[] args) throws IOException {
//		createBean();
//	}
//	

}
