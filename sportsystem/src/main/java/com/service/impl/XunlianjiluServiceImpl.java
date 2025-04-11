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


import com.dao.XunlianjiluDao;
import com.entity.XunlianjiluEntity;
import com.service.XunlianjiluService;
import com.entity.vo.XunlianjiluVO;
import com.entity.view.XunlianjiluView;

@Service("xunlianjiluService")
public class XunlianjiluServiceImpl extends ServiceImpl<XunlianjiluDao, XunlianjiluEntity> implements XunlianjiluService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<XunlianjiluEntity> page = this.selectPage(
                new Query<XunlianjiluEntity>(params).getPage(),
                new EntityWrapper<XunlianjiluEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<XunlianjiluEntity> wrapper) {
		  Page<XunlianjiluView> page =new Query<XunlianjiluView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<XunlianjiluVO> selectListVO(Wrapper<XunlianjiluEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public XunlianjiluVO selectVO(Wrapper<XunlianjiluEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<XunlianjiluView> selectListView(Wrapper<XunlianjiluEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public XunlianjiluView selectView(Wrapper<XunlianjiluEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
