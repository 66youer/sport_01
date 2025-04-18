package com.dao;

import com.entity.YundongyuanEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YundongyuanVO;
import com.entity.view.YundongyuanView;


/**
 * 运动员
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:36
 */
public interface YundongyuanDao extends BaseMapper<YundongyuanEntity> {
	
	List<YundongyuanVO> selectListVO(@Param("ew") Wrapper<YundongyuanEntity> wrapper);
	
	YundongyuanVO selectVO(@Param("ew") Wrapper<YundongyuanEntity> wrapper);
	
	List<YundongyuanView> selectListView(@Param("ew") Wrapper<YundongyuanEntity> wrapper);

	List<YundongyuanView> selectListView(Pagination page,@Param("ew") Wrapper<YundongyuanEntity> wrapper);

	
	YundongyuanView selectView(@Param("ew") Wrapper<YundongyuanEntity> wrapper);
	

}
