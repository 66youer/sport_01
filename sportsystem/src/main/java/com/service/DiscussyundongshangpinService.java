package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.DiscussyundongshangpinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.DiscussyundongshangpinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.DiscussyundongshangpinView;


/**
 * 运动商品评论表
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:40
 */
public interface DiscussyundongshangpinService extends IService<DiscussyundongshangpinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<DiscussyundongshangpinVO> selectListVO(Wrapper<DiscussyundongshangpinEntity> wrapper);
   	
   	DiscussyundongshangpinVO selectVO(@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);
   	
   	List<DiscussyundongshangpinView> selectListView(Wrapper<DiscussyundongshangpinEntity> wrapper);
   	
   	DiscussyundongshangpinView selectView(@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<DiscussyundongshangpinEntity> wrapper);

   	

}

