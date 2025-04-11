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


import com.dao.ToupiaoDao;
import com.entity.ToupiaoEntity;
import com.service.ToupiaoService;
import com.entity.vo.ToupiaoVO;
import com.entity.view.ToupiaoView;

@Service("toupiaoService")
public class ToupiaoServiceImpl extends ServiceImpl<ToupiaoDao, ToupiaoEntity> implements ToupiaoService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<ToupiaoEntity> page = this.selectPage(
                new Query<ToupiaoEntity>(params).getPage(),
                new EntityWrapper<ToupiaoEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<ToupiaoEntity> wrapper) {
		  Page<ToupiaoView> page =new Query<ToupiaoView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<ToupiaoVO> selectListVO(Wrapper<ToupiaoEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public ToupiaoVO selectVO(Wrapper<ToupiaoEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<ToupiaoView> selectListView(Wrapper<ToupiaoEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public ToupiaoView selectView(Wrapper<ToupiaoEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
