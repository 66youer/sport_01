package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussbisaijiluEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussbisaijiluVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussbisaijiluView;


/**
 * 比赛记录评论表
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:39
 */
public interface DiscussbisaijiluService extends IService<DiscussbisaijiluEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussbisaijiluVO> selectListVO(Wrapper<DiscussbisaijiluEntity> wrapper);
   	
   	DiscussbisaijiluVO selectVO(@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);
   	
   	List<DiscussbisaijiluView> selectListView(Wrapper<DiscussbisaijiluEntity> wrapper);
   	
   	DiscussbisaijiluView selectView(@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussbisaijiluEntity> wrapper);

   	

}

