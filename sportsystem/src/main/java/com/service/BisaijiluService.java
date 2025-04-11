package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.BisaijiluEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.BisaijiluVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.BisaijiluView;


/**
 * 比赛记录
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
public interface BisaijiluService extends IService<BisaijiluEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<BisaijiluVO> selectListVO(Wrapper<BisaijiluEntity> wrapper);
   	
   	BisaijiluVO selectVO(@Param("ew") Wrapper<BisaijiluEntity> wrapper);
   	
   	List<BisaijiluView> selectListView(Wrapper<BisaijiluEntity> wrapper);
   	
   	BisaijiluView selectView(@Param("ew") Wrapper<BisaijiluEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<BisaijiluEntity> wrapper);

   	

}

