package com.service;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.service.IService;
import com.utils.PageUtils;
import com.entity.JiaolianyuanEntity;
import java.util.List;
import java.util.Map;
import com.entity.vo.JiaolianyuanVO;
import org.apache.ibatis.annotations.Param;
import com.entity.view.JiaolianyuanView;


/**
 * 教练员
 *
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
public interface JiaolianyuanService extends IService<JiaolianyuanEntity> {

    PageUtils queryPage(Map<String, Object> params);
    
   	List<JiaolianyuanVO> selectListVO(Wrapper<JiaolianyuanEntity> wrapper);
   	
   	JiaolianyuanVO selectVO(@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);
   	
   	List<JiaolianyuanView> selectListView(Wrapper<JiaolianyuanEntity> wrapper);
   	
   	JiaolianyuanView selectView(@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);
   	
   	PageUtils queryPage(Map<String, Object> params,Wrapper<JiaolianyuanEntity> wrapper);

   	

}

