package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.XunlianjiluEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.XunlianjiluVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.XunlianjiluView;


/**
 * 训练记录
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
public interface XunlianjiluService extends IService<XunlianjiluEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<XunlianjiluVO> selectListVO(Wrapper<XunlianjiluEntity> wrapper);
   	
   	XunlianjiluVO selectVO(@Param("ew") Wrapper<XunlianjiluEntity> wrapper);
   	
   	List<XunlianjiluView> selectListView(Wrapper<XunlianjiluEntity> wrapper);
   	
   	XunlianjiluView selectView(@Param("ew") Wrapper<XunlianjiluEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<XunlianjiluEntity> wrapper);

   	

}

