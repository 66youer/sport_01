package com.entity.view;

import com.entity.YundongyuanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 运动员
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-03-24 22:21:36
 */
@TableName("yundongyuan")
public class YundongyuanView  extends YundongyuanEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public YundongyuanView(){
	}
 
 	public YundongyuanView(YundongyuanEntity yundongyuanEntity){
 	try {
			BeanUtils.copyProperties(this, yundongyuanEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
