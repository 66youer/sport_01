package com.entity.view;

import com.entity.XunlianjiluEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 训练记录
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
@TableName("xunlianjilu")
public class XunlianjiluView  extends XunlianjiluEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public XunlianjiluView(){
	}
 
 	public XunlianjiluView(XunlianjiluEntity xunlianjiluEntity){
 	try {
			BeanUtils.copyProperties(this, xunlianjiluEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
