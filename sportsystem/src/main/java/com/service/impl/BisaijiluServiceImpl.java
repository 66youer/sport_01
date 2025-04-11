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


import com.dao.BisaijiluDao;
import com.entity.BisaijiluEntity;
import com.service.BisaijiluService;
import com.entity.vo.BisaijiluVO;
import com.entity.view.BisaijiluView;

@Service("bisaijiluService")
public class BisaijiluServiceImpl extends ServiceImpl<BisaijiluDao, BisaijiluEntity> implements BisaijiluService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<BisaijiluEntity> page = this.selectPage(
                new Query<BisaijiluEntity>(params).getPage(),
                new EntityWrapper<BisaijiluEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<BisaijiluEntity> wrapper) {
		  Page<BisaijiluView> page =new Query<BisaijiluView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<BisaijiluVO> selectListVO(Wrapper<BisaijiluEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public BisaijiluVO selectVO(Wrapper<BisaijiluEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<BisaijiluView> selectListView(Wrapper<BisaijiluEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public BisaijiluView selectView(Wrapper<BisaijiluEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
