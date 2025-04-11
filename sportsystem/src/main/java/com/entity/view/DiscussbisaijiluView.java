package com.entity.view;

import com.entity.DiscussbisaijiluEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 比赛记录评论表
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-03-24 22:21:39
 */
@TableName("discussbisaijilu")
public class DiscussbisaijiluView  extends DiscussbisaijiluEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public DiscussbisaijiluView(){
	}
 
 	public DiscussbisaijiluView(DiscussbisaijiluEntity discussbisaijiluEntity){
 	try {
			BeanUtils.copyProperties(this, discussbisaijiluEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
