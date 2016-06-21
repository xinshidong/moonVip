package com.bean;
import java.util.Date;

/**
 *信息管理
 *作者 ksmile
 *日期 2016年05月31日  22:49:48
 *Message
 *qq 1012474315
 *email 1012474315@qq.com
 */

//栏目模板 beanName
public class Message implements java.io.Serializable{
	private static final long serialVersionUID = 1L;
	private Integer id;/* 主键 */
	private String name; //名称
	private Date createTime;// 创建时间
	private Integer userId;// 用户ID
	private Integer isDelete;// 0删除1未删除
	private Integer status;// 0未发布1发布
	
	public  Message(){
	  super();	
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Date getCreateTime() {
		return createTime;
	}
	public void setCreateTime(Date createTime) {
		this.createTime = createTime;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getIsDelete() {
		return isDelete;
	}
	public void setIsDelete(Integer isDelete) {
		this.isDelete = isDelete;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
    
	
	
}
