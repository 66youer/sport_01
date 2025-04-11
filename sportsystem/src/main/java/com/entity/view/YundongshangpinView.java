package com.entity.view;

import com.entity.YundongshangpinEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 运动商品
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-03-24 22:21:38
 */
@TableName("yundongshangpin")
public class YundongshangpinView  extends YundongshangpinEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public YundongshangpinView(){
	}
 
 	public YundongshangpinView(YundongshangpinEntity yundongshangpinEntity){
 	try {
			BeanUtils.copyProperties(this, yundongshangpinEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
