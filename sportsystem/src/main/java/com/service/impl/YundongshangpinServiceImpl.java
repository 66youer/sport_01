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


import com.dao.YundongshangpinDao;
import com.entity.YundongshangpinEntity;
import com.service.YundongshangpinService;
import com.entity.vo.YundongshangpinVO;
import com.entity.view.YundongshangpinView;

@Service("yundongshangpinService")
public class YundongshangpinServiceImpl extends ServiceImpl<YundongshangpinDao, YundongshangpinEntity> implements YundongshangpinService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<YundongshangpinEntity> page = this.selectPage(
                new Query<YundongshangpinEntity>(params).getPage(),
                new EntityWrapper<YundongshangpinEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<YundongshangpinEntity> wrapper) {
		  Page<YundongshangpinView> page =new Query<YundongshangpinView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<YundongshangpinVO> selectListVO(Wrapper<YundongshangpinEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public YundongshangpinVO selectVO(Wrapper<YundongshangpinEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<YundongshangpinView> selectListView(Wrapper<YundongshangpinEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public YundongshangpinView selectView(Wrapper<YundongshangpinEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
