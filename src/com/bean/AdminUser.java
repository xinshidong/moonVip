/**
 * Project Name:tzupload
 * File Name:User.java
 * Package Name:bean
 * Date:2015骞�11鏈�6鏃ヤ笅鍗�9:04:29
 * Copyright (c) 2015, chenzhou1025@126.com All Rights Reserved.
 *
 */

package com.bean;

import java.util.Date;

/**
 * ClassName:User <br/>
 * Function: TODO ADD FUNCTION. <br/>
 * Reason: TODO ADD REASON. <br/>
 * Date: 2015骞�11鏈�6鏃� 涓嬪崍9:04:29 <br/>
 * 
 * @author Administrator
 * @version
 * @since JDK 1.6
 * @see
 */
public class AdminUser {
	
	//主键
	private int id;
	// 用户名
	private String username;
	//密码
	private String password;
	// 邮件
	private String email;
	// 年龄
	private Integer age;
	// 1男0女
	private Integer male;
	//创建时间
	private Date time;
	//地址
	private String addres;
	//电话
	private String telephone;
	//创建时间
	private Date createTime;
	//更新时间
	private Date updaeTime;
	//生日
	private Date birthday;
	//1允许登录0 不允许登录
	private Integer forbiden;
	//0代表未删除 1代表删除
	private Boolean isDelete;
	public AdminUser(){
		super();
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
	public Integer getMale() {
		return male;
	}
	public void setMale(Integer male) {
		this.male = male;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	} 
	public String getAddres() {
		return addres;
	}
	public void setAddres(String addres) {
		this.addres = addres;
	}
	public String getTelephone() {
		return telephone;
	}
	public void setTelephone(String telephone) {
		this.telephone = telephone;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Date getUpdaeTime() {
		return updaeTime;
	}
	public void setUpdaeTime(Date updaeTime) {
		this.updaeTime = updaeTime;
	}
	public Date getBirthday() {
		return birthday;
	}
	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}
	public Integer getForbiden() {
		return forbiden;
	}
	public void setForbiden(Integer forbiden) {
		this.forbiden = forbiden;
	}
	public Boolean getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Boolean isDelete) {
		this.isDelete = isDelete;
	}

	
}
