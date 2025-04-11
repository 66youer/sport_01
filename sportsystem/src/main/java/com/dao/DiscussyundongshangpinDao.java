package com.dao;

import com.entity.DiscussyundongshangpinEntity;
import com.baomidou.mybatisplus.mapper.BaseMapper;
import java.util.List;
import java.util.Map;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.plugins.pagination.Pagination;

import org.apache.ibatis.annotations.Param;
import com.entity.vo.DiscussyundongshangpinVO;
import com.entity.view.DiscussyundongshangpinView;


/**
 * 运动商品评论表
 * 
 * @author 
 * @email 
 * @date 2025-03-24 22:21:40
 */
public interface DiscussyundongshangpinDao extends BaseMapper<DiscussyundongshangpinEntity> {
	
	List<DiscussyundongshangpinVO> selectListVO(@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);
	
	DiscussyundongshangpinVO selectVO(@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);
	
	List<DiscussyundongshangpinView> selectListView(@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);

	List<DiscussyundongshangpinView> selectListView(Pagination page,@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);

	
	DiscussyundongshangpinView selectView(@Param("ew") Wrapper<DiscussyundongshangpinEntity> wrapper);
	

}
