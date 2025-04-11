package com.dao;

import com.entity.BisaijiluEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.BisaijiluVO;
import com.entity.view.BisaijiluView;


/**
 * 比赛记录
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
public interface BisaijiluDao extends BaseMapper<BisaijiluEntity> {
	
	List<BisaijiluVO> selectListVO(@Param("ew") Wrapper<BisaijiluEntity> wrapper);
	
	BisaijiluVO selectVO(@Param("ew") Wrapper<BisaijiluEntity> wrapper);
	
	List<BisaijiluView> selectListView(@Param("ew") Wrapper<BisaijiluEntity> wrapper);

	List<BisaijiluView> selectListView(Pagination page,@Param("ew") Wrapper<BisaijiluEntity> wrapper);

	
	BisaijiluView selectView(@Param("ew") Wrapper<BisaijiluEntity> wrapper);
	

}
