package com.bean;
import java.util.Date;
public class Gather {

	private String name;
	private String url;
	private String charset;
	private String userName;
	private String prefix;
	private String titleRegex;
	private Integer titleMark;//1 id 2tagName 3 class 
	private String contentRegex;
	private Integer contentMark;//1 id 2tagName 3 class 
	private String imgRegex;
	private Integer imgMark;//1 id 2tagName 3 class 
	private Date createTime;
	private Date updateTime;
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getCharset() {
		return charset;
	}
	public void setCharset(String charset) {
		this.charset = charset;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPrefix() {
		return prefix;
	}
	public void setPrefix(String prefix) {
		this.prefix = prefix;
	}
	public String getTitleRegex() {
		return titleRegex;
	}
	public void setTitleRegex(String titleRegex) {
		this.titleRegex = titleRegex;
	}
	public Integer getTitleMark() {
		return titleMark;
	}
	public void setTitleMark(Integer titleMark) {
		this.titleMark = titleMark;
	}
	public String getContentRegex() {
		return contentRegex;
	}
	public void setContentRegex(String contentRegex) {
		this.contentRegex = contentRegex;
	}
	public Integer getContentMark() {
		return contentMark;
	}
	public void setContentMark(Integer contentMark) {
		this.contentMark = contentMark;
	}
	public String getImgRegex() {
		return imgRegex;
	}
	public void setImgRegex(String imgRegex) {
		this.imgRegex = imgRegex;
	}
	public Integer getImgMark() {
		return imgMark;
	}
	public void setImgMark(Integer imgMark) {
		this.imgMark = imgMark;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdateTime() {
		return updateTime;
	}
	public void setUpdateTime(Date updateTime) {
		this.updateTime = updateTime;
	}

	
}
