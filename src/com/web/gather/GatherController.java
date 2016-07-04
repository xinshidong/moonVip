//package com.web.gather;
//
//import java.io.BufferedReader;
//import java.io.IOException;
//import java.io.InputStream;
//import java.io.InputStreamReader;
//import java.net.MalformedURLException;
//import java.net.URL;
//import java.net.URLConnection;
//import java.util.HashSet;
//import java.util.Set;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.stereotype.Controller;
//import org.springframework.web.bind.annotation.RequestMapping;
//import org.springframework.web.bind.annotation.ResponseBody;
//import org.w3c.dom.Document;
//
//import com.bean.Content;
//import com.bean.Gather;
//import com.bean.TzParams;
//import com.core.BaseController;
//import com.opensymphony.xwork2.util.Element;
//import com.service.content.IContentService;
//import com.sun.xml.internal.ws.developer.MemberSubmissionEndpointReference.Elements;
//import com.util.TmStringUtils;
//
///**
// * 数据抓取管理web
// * GatherController
// * 创建人:柯柯
// * 时间：2015年12月27日 22:38:27
// * @version 1.0.0
// * 
// */
//@Controller
//@RequestMapping("/admin/gather")
//public class GatherController extends BaseController{
//	
//	@Autowired
//	private IContentService contentService;
//	
//	/*列表查询*/
//	@RequestMapping("/list")
//	public String list(TzParams params){
//		return "gather/list";
//	}
//	
//	
//	@RequestMapping("/data")
//	@ResponseBody
//	public String gather(){
//		
////		Gather gather = new Gather();
////		gather.setName("腾讯新闻");
////		gather.setUrl("http://www.qq.com");
////		gather.setCharset("gbk");
////		gather.setUserName("keke");
////		gather.setPrefix("http://news.qq.com/a/");
////		gather.setTitleRegex("h1");
////		gather.setTitleMark(2);//根据标签名称
////		gather.setContentMark(1);
////		gather.setContentRegex("Cnt-Main-Article-QQ");
////		gather.setImgMark(2);
////		gather.setImgRegex("img");
//		
//		
//		Gather gather = new Gather();
//		gather.setName("网易新闻");
//		gather.setUrl("http://www.163.com/");
//		gather.setCharset("gbk");
//		gather.setUserName("keke");
//		gather.setPrefix("http://news.163.com/15/");
//		gather.setTitleMark(1);//根据标签名称
//		gather.setTitleRegex("h1title");
//		gather.setContentMark(1);
//		gather.setContentRegex("endText");
//		gather.setImgMark(2);
//		gather.setImgRegex("img");
//		
//		
////		//2：获取网页源代码
//		String htmlsource = getHtmlSource(gather.getUrl(),gather.getCharset());
//		Document document = Jsoup.parse(htmlsource);
////		Element e = document.getElementById(id);
//		Set<String> set = new HashSet<>();
//		Elements elements = document.getElementsByTag("a");
//		for (Element element : elements) {
//			String href = element.attr("href");
//			if(TmStringUtils.isNotEmpty(href)&& href.startsWith(gather.getPrefix())){
//				set.add(href);
//			}
//		}
//		
//		//URL地址循环，进行抓取
//		for (String url:set) {
//			try {
//				Document doc = Jsoup.connect(url).get();
//				if(doc!=null){
//					String title  = null;
//					if(gather.getTitleMark()==1){
//						title= doc.getElementById(gather.getTitleRegex()).text();
//					}else if(gather.getTitleMark()==2){
//						title= doc.getElementsByTag(gather.getTitleRegex()).eq(0).text();
//					}else if(gather.getTitleMark()==3){
//						title= doc.getElementsByClass(gather.getTitleRegex()).eq(0).text();
//					}
//					
//					Element contentDom = null;
//					if(gather.getContentMark()==1){
//						contentDom= doc.getElementById(gather.getContentRegex());
//					}else if(gather.getContentMark()==2){
//						contentDom= doc.getElementsByTag(gather.getContentRegex()).first();
//					}else if(gather.getContentMark()==3){
//						contentDom= doc.getElementsByClass(gather.getTitleRegex()).first();
//					}
//					
//					String desc = contentDom.html();
//					//抓取内容
//					//抓取图片
//					String img = contentDom.getElementsByTag("img").eq(0).attr("src");
//					//根据图片的大小，后缀进一步的过滤
//					Content content = new Content();
//					setContentData(content);
//					content.setTitle(title);
//					content.setContent(desc);
//					content.setImg(img);
//					contentService.save(content);
//				}
//				
//			} catch (Exception e) {
//				continue;
//			}
//		}
//		return "success";
//	}
//	
//	private void setContentData(Content content){
//		content.setStaticLink(null);
//		content.setIsTop(0);
//		content.setIsDelete(0);
//		content.setStatus(0);
//		content.setType(1);	
//		content.setPush(0);
//		content.setIsComment(1);
//		content.setHits(0);
//		content.setLoves(0);
//		content.setCollections(0);
//		content.setComments(0);
//		content.setHtmlCode("");
//		content.setJsCode("");
//		content.setCssCode("");
//		content.setIsCode(0);
//		content.setKeywords(content.getTag());
//	}
//	
//	
//	public static String getHtmlSource(String netLink,String charset){
//		StringBuffer buffer = new StringBuffer();
//		try {
//			URL url = new URL(netLink);
//			URLConnection connection = url.openConnection();
//			connection.setRequestProperty("User-Agent", "Mozilla/5.0 (Windows NT 6.1; WOW64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/48.0.2547.0 Safari/537.36");
//			InputStream inputStream = connection.getInputStream();
//			InputStreamReader reader = new InputStreamReader(inputStream, charset);
//			BufferedReader bufferedReader = new BufferedReader(reader);
//			String line = null;
//			while((line =bufferedReader.readLine())!=null){
//				buffer.append(line+"\n");
//			}
//			bufferedReader.close();
//			reader.close();
//			inputStream.close();
//			return buffer.toString();
//		} catch (Exception e) {
//			return "error";
//		}
//	}
//	
//	
//	public static void main(String[] args) throws MalformedURLException, IOException {
//		
//		String htmlsource = getHtmlSource("http://news.163.com/","gbk");
////		System.out.println(htmlsource);
//		
////		//1：导入jsoup.jar + javascript+jquery
//		Document document = Jsoup.parse(htmlsource);
////		Document document = Jsoup.parse(new URL("http://www.qq.com"),3000);
//////		System.out.println(document.html());
//////		System.out.println(document.text());
//////		System.out.println(document.outerHtml());
////		
//////		var dom = document.getElementById("div");
//////		dom.innerHTML
////		//2：获取网页源代码
////		Element e = document.getElementById(id);
//		Set<String> set = new HashSet<>();
//		Elements elements = document.getElementsByTag("a");
//		for (Element element : elements) {
//			String href = element.attr("href");
//			if(TmStringUtils.isNotEmpty(href)&& href.startsWith("http://news.163.com/15/")){
//				set.add(href);
//			}
//		}
//		
//		//URL地址循环，进行抓取
//		for (String url:set) {
////			System.out.println(url);
//			try {
//				Document doc = Jsoup.connect(url).get();
//				if(doc!=null){
//					//标题
//					//			String title = doc.title();
//					String title = doc.getElementById("h1title").text();
//					//抓取内容
//					Element contentDom = doc.getElementById("endText");
//					String content = contentDom.html();
//					//抓取图片
////					String img = contentDom.getElementsByTag("img").eq(0).attr("src");
//					//抓取时间
////					String time = doc.getElementsByClass("article-time").eq(0).text();
//					System.out.println("标题是:"+title);
//					System.out.println("内容是:"+content);
////					System.out.println("图片:"+img);
////					System.out.println("时间:"+time);
//					System.out.println("==================================");
//				}
//			} catch (Exception e) {
//				continue;
//			}
//		}
////		document.getElementsByAttributeValue("id", "tt")
////		//3：匹配源代码中的URL地址,img,文本
////		//4: 获取URL中的内容，保存到数据库中。
//
//		
//	}
//}
