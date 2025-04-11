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


import com.dao.AddressDao;
import com.entity.AddressEntity;
import com.service.AddressService;
import com.entity.vo.AddressVO;
import com.entity.view.AddressView;

@Service("addressService")
public class AddressServiceImpl extends ServiceImpl<AddressDao,
		AddressEntity> implements AddressService {
    @Override    //分页查询地址信息
    public PageUtils queryPage(Map<String, Object> params) {
        Page<AddressEntity> page = this.selectPage(
                new Query<AddressEntity>(params).getPage(),
                new EntityWrapper<AddressEntity>()
        );
        return new PageUtils(page);
    }
    @Override
	public PageUtils queryPage(Map<String, Object> params, Wrapper<AddressEntity> wrapper) {
    	//创建分页对象
		  Page<AddressView> page =new Query<AddressView>(params).getPage();
	        page.setRecords(baseMapper.selectListView(page,wrapper));
	    	PageUtils pageUtil = new PageUtils(page);
	    	return pageUtil;
 	}
    @Override
	public List<AddressVO> selectListVO(Wrapper<AddressEntity> wrapper) {
 		return baseMapper.selectListVO(wrapper);
	}
	@Override
	public AddressVO selectVO(Wrapper<AddressEntity> wrapper) {
 		return baseMapper.selectVO(wrapper);
	}
	@Override
	public List<AddressView> selectListView(Wrapper<AddressEntity> wrapper) {
		return baseMapper.selectListView(wrapper);
	}
	@Override
	public AddressView selectView(Wrapper<AddressEntity> wrapper) {
		return baseMapper.selectView(wrapper);
	}
}
