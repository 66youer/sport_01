package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.YundongshangpinEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.YundongshangpinVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.YundongshangpinView;


/**
 * 运动商品
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:38
 */
public interface YundongshangpinService extends IService<YundongshangpinEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<YundongshangpinVO> selectListVO(Wrapper<YundongshangpinEntity> wrapper);
   	
   	YundongshangpinVO selectVO(@Param("ew") Wrapper<YundongshangpinEntity> wrapper);
   	
   	List<YundongshangpinView> selectListView(Wrapper<YundongshangpinEntity> wrapper);
   	
   	YundongshangpinView selectView(@Param("ew") Wrapper<YundongshangpinEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<YundongshangpinEntity> wrapper);

   	

}

