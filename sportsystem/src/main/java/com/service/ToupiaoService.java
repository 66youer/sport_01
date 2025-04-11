package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.ToupiaoEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.ToupiaoVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.ToupiaoView;


/**
 * 投票
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:38
 */
public interface ToupiaoService extends IService<ToupiaoEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<ToupiaoVO> selectListVO(Wrapper<ToupiaoEntity> wrapper);
   	
   	ToupiaoVO selectVO(@Param("ew") Wrapper<ToupiaoEntity> wrapper);
   	
   	List<ToupiaoView> selectListView(Wrapper<ToupiaoEntity> wrapper);
   	
   	ToupiaoView selectView(@Param("ew") Wrapper<ToupiaoEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<ToupiaoEntity> wrapper);

   	

}

