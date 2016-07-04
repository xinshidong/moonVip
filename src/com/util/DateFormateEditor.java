/**
 * tzdesk系统平台
 * tzupload
 * com.tz.util
 * DateFormateEditor.java
 * 创建人:xuchengfei 
 * 时间：2015年11月13日-下午8:56:36 
 * 2015潭州教育公司-版权所有
 */
package com.util;

import java.beans.PropertyEditorSupport;
import java.text.ParseException;
import java.text.SimpleDateFormat;

/**
 * 
 * DateFormateEditor
 * 创建人:xuchengfei 
 * 时间：2015年11月13日-下午8:56:36 
 * @version 1.0.0
 * 
 */
public class DateFormateEditor extends PropertyEditorSupport{

	@Override
	public void setAsText(String text) throws IllegalArgumentException {
		if(TmStringUtils.isNotEmpty(text)){
			String pattern = "yyyy-MM-dd";
			if(text.indexOf(":")!=-1)pattern = "yyyy-MM-dd HH:mm:ss";
			try {
				setValue(new SimpleDateFormat(pattern).parse(text));
			} catch (ParseException e) {
				setValue(null);
			}
		}else{
			setValue(null);
		}
	}
}
