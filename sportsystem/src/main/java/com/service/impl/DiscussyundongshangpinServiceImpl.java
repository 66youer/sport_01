package com.service.impl;

import org.springframework.stereotype.Service;
import java.util.Map;
import java.util.List;

import com.baomidou.mybatisplus.mapper.Wrapper;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.plugins.Page;
import com.baomidou.mybatisplus.service.impl.ServiceImpl;
import com.utils.PageUtils;
import com.utils.Query;


import com.dao.DiscussyundongshangpinDao;
import com.entity.DiscussyundongshangpinEntity;
import com.service.DiscussyundongshangpinService;
import com.entity.vo.DiscussyundongshangpinVO;
import com.entity.view.DiscussyundongshangpinView;

@Service("discussyundongshangpinService")
public class DiscussyundongshangpinServiceImpl extends ServiceImpl<DiscussyundongshangpinDao, DiscussyundongshangpinEntity> implements DiscussyundongshangpinService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussyundongshangpinEntity> page = this.selectPage(
                new Query<DiscussyundongshangpinEntity>(params).getPage(),
                new EntityWrapper<DiscussyundongshangpinEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussyundongshangpinEntity> wrapper) {
		  Page<DiscussyundongshangpinView> page =new Query<DiscussyundongshangpinView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<DiscussyundongshangpinVO> selectListVO(Wrapper<DiscussyundongshangpinEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussyundongshangpinVO selectVO(Wrapper<DiscussyundongshangpinEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussyundongshangpinView> selectListView(Wrapper<DiscussyundongshangpinEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussyundongshangpinView selectView(Wrapper<DiscussyundongshangpinEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
