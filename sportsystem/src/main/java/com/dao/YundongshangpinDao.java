package com.dao;

import com.entity.YundongshangpinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.YundongshangpinVO;
import com.entity.view.YundongshangpinView;


/**
 * 运动商品
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:38
 */
public interface YundongshangpinDao extends BaseMapper<YundongshangpinEntity> {
	
	List<YundongshangpinVO> selectListVO(@Param("ew") Wrapper<YundongshangpinEntity> wrapper);
	
	YundongshangpinVO selectVO(@Param("ew") Wrapper<YundongshangpinEntity> wrapper);
	
	List<YundongshangpinView> selectListView(@Param("ew") Wrapper<YundongshangpinEntity> wrapper);

	List<YundongshangpinView> selectListView(Pagination page,@Param("ew") Wrapper<YundongshangpinEntity> wrapper);

	
	YundongshangpinView selectView(@Param("ew") Wrapper<YundongshangpinEntity> wrapper);
	

}
