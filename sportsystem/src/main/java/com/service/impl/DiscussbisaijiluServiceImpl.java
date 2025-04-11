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


import com.dao.DiscussbisaijiluDao;
import com.entity.DiscussbisaijiluEntity;
import com.service.DiscussbisaijiluService;
import com.entity.vo.DiscussbisaijiluVO;
import com.entity.view.DiscussbisaijiluView;

@Service("discussbisaijiluService")
public class DiscussbisaijiluServiceImpl extends ServiceImpl<DiscussbisaijiluDao, DiscussbisaijiluEntity> implements DiscussbisaijiluService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<DiscussbisaijiluEntity> page = this.selectPage(
                new Query<DiscussbisaijiluEntity>(params).getPage(),
                new EntityWrapper<DiscussbisaijiluEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<DiscussbisaijiluEntity> wrapper) {
		  Page<DiscussbisaijiluView> page =new Query<DiscussbisaijiluView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<DiscussbisaijiluVO> selectListVO(Wrapper<DiscussbisaijiluEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public DiscussbisaijiluVO selectVO(Wrapper<DiscussbisaijiluEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<DiscussbisaijiluView> selectListView(Wrapper<DiscussbisaijiluEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public DiscussbisaijiluView selectView(Wrapper<DiscussbisaijiluEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
