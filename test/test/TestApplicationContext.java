package test;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import org.springframework.stereotype.Service;

import com.service.content.IContentService;



@Service
public class TestApplicationContext {
	
	@Autowired  IContentService  contentService;
	
	
	//@Test
	public  void handler(){
		ApplicationContext context=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
			/*IUserMapper  service=context.getBean(IUserMapper.class);
	    	System.out.println("=============="+service);*/
		/* IAdminUserService service=context.getBean(IAdminUserService.class);
		 System.out.println("=========="+service);
		  TzParams parames=new TzParams();
		  parames.setPassword("22");
	      parames.setEmail("222");     
	      AdminUser  users=service.getLogin(parames);
   	     System.out.println(users.getUsername()+"======="+users.getPassword());
		*/
	/*	TzParams  params=new TzParams();
		List<Content> 	contents=contentService.findContent(params);
		for (Content content : contents) {
			System.out.println(content.getTitle());
			
		}
		*/
		
	}
	
	public static void main(String[] args) {
/*		ApplicationContext context=new ClassPathXmlApplicationContext("classpath:spring/applicationContext.xml");
		IUserService service = context.getBean(IUserService.class);
		System.out.println("==========" + service);
		TzParams parames = new TzParams();
		parames.setPassword("22");
		parames.setAccount("222");
		User users = service.getLogin(parames);
		System.out.println(users.getUsername()+"======="+users.getPassword());*/
	}
	
	

} 
