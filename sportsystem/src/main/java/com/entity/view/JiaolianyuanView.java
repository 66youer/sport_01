package com.entity.view;

import com.entity.JiaolianyuanEntity;

import com.baomidou.mybatisplus.annotations.TableName;
import org.apache.commons.beanutils.BeanUtils;
import java.lang.reflect.InvocationTargetException;
import java.math.BigDecimal;

import java.io.Serializable;
import com.utils.EncryptUtil;
 

/**
 * 教练员
 * 后端返回视图实体辅助类   
 * （通常后端关联的表或者自定义的字段需要返回使用）
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
@TableName("jiaolianyuan")
public class JiaolianyuanView  extends JiaolianyuanEntity implements Serializable {
	private static final long serialVersionUID = 1L;

	public JiaolianyuanView(){
	}
 
 	public JiaolianyuanView(JiaolianyuanEntity jiaolianyuanEntity){
 	try {
			BeanUtils.copyProperties(this, jiaolianyuanEntity);
		} catch (IllegalAccessException | InvocationTargetException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
 		
	}


}
