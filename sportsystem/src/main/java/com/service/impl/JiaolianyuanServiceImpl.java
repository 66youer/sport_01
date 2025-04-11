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


import com.dao.JiaolianyuanDao;
import com.entity.JiaolianyuanEntity;
import com.service.JiaolianyuanService;
import com.entity.vo.JiaolianyuanVO;
import com.entity.view.JiaolianyuanView;

@Service("jiaolianyuanService")
public class JiaolianyuanServiceImpl extends ServiceImpl<JiaolianyuanDao, JiaolianyuanEntity> implements JiaolianyuanService {
	
	
    @Override
    public PageUtils queryPage(Map<String, Object> params) {
        Page<JiaolianyuanEntity> page = this.selectPage(
                new Query<JiaolianyuanEntity>(params).getPage(),
                new EntityWrapper<JiaolianyuanEntity>()
        );
        return new PageUtils(page);
    }
    
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<JiaolianyuanEntity> wrapper) {
		  Page<JiaolianyuanView> page =new Query<JiaolianyuanView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}

    
    @Override
	public List<JiaolianyuanVO> selectListVO(Wrapper<JiaolianyuanEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	
	@Override
	public JiaolianyuanVO selectVO(Wrapper<JiaolianyuanEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	
	@Override
	public List<JiaolianyuanView> selectListView(Wrapper<JiaolianyuanEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}

	@Override
	public JiaolianyuanView selectView(Wrapper<JiaolianyuanEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}


}
