package com.dao;

import com.entity.XunlianjiluEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.XunlianjiluVO;
import com.entity.view.XunlianjiluView;


/**
 * 训练记录
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
public interface XunlianjiluDao extends BaseMapper<XunlianjiluEntity> {
	
	List<XunlianjiluVO> selectListVO(@Param("ew") Wrapper<XunlianjiluEntity> wrapper);
	
	XunlianjiluVO selectVO(@Param("ew") Wrapper<XunlianjiluEntity> wrapper);
	
	List<XunlianjiluView> selectListView(@Param("ew") Wrapper<XunlianjiluEntity> wrapper);

	List<XunlianjiluView> selectListView(Pagination page,@Param("ew") Wrapper<XunlianjiluEntity> wrapper);

	
	XunlianjiluView selectView(@Param("ew") Wrapper<XunlianjiluEntity> wrapper);
	

}
