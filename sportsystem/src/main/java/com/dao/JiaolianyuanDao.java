package com.dao;

import com.entity.JiaolianyuanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.JiaolianyuanVO;
import com.entity.view.JiaolianyuanView;


/**
 * 教练员
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
public interface JiaolianyuanDao extends BaseMapper<JiaolianyuanEntity> {
	
	List<JiaolianyuanVO> selectListVO(@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);
	
	JiaolianyuanVO selectVO(@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);
	
	List<JiaolianyuanView> selectListView(@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);

	List<JiaolianyuanView> selectListView(Pagination page,@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);

	
	JiaolianyuanView selectView(@Param("ew") Wrapper<JiaolianyuanEntity> wrapper);
	

}
