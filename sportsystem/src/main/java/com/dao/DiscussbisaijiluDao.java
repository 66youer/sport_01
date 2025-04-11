package com.dao;

import com.entity.DiscussbisaijiluEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussbisaijiluVO;
import com.entity.view.DiscussbisaijiluView;


/**
 * 比赛记录评论表
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:39
 */
public interface DiscussbisaijiluDao extends BaseMapper<DiscussbisaijiluEntity> {
	
	List<DiscussbisaijiluVO> selectListVO(@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);
	
	DiscussbisaijiluVO selectVO(@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);
	
	List<DiscussbisaijiluView> selectListView(@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);

	List<DiscussbisaijiluView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);

	
	DiscussbisaijiluView selectView(@Param("ew") Wrapper<DiscussbisaijiluEntity> wrapper);
	

}
