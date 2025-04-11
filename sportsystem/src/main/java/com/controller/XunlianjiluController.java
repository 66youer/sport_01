package com.controller;

import java.math.BigDecimal;
import java.text.SimpleDateFormat;
import java.text.ParseException;
import java.util.*;
import java.lang.*;
import java.math.*;
import java.util.stream.Collectors;
import javax.servlet.http.HttpServletRequest;
import com.utils.ValidatorUtils;
import com.utils.DeSensUtil;
import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.baomidou.mybatisplus.mapper.EntityWrapper;
import com.baomidou.mybatisplus.mapper.Wrapper;
import com.annotation.IgnoreAuth;

import com.entity.XunlianjiluEntity;
import com.entity.view.XunlianjiluView;

import com.service.XunlianjiluService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 训练记录
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
@RestController
@RequestMapping("/xunlianjilu")
public class XunlianjiluController {
    @Autowired
    private XunlianjiluService xunlianjiluService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XunlianjiluEntity xunlianjilu,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yundongyuan")) {
			xunlianjilu.setZhanghao((String)request.getSession().getAttribute("username"));
		}
		if(tableName.equals("jiaolianyuan")) {
			xunlianjilu.setJiaoliangonghao((String)request.getSession().getAttribute("username"));
		}
        //设置查询条件
        EntityWrapper<XunlianjiluEntity> ew = new EntityWrapper<XunlianjiluEntity>();


        //查询结果
		PageUtils page = xunlianjiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xunlianjilu), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }
    
    /**
     * 前台列表
     */
	@IgnoreAuth
    @RequestMapping("/list")
    public R list(@RequestParam Map<String, Object> params,XunlianjiluEntity xunlianjilu, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XunlianjiluEntity> ew = new EntityWrapper<XunlianjiluEntity>();

        //查询结果
		PageUtils page = xunlianjiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xunlianjilu), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XunlianjiluEntity xunlianjilu){
       	EntityWrapper<XunlianjiluEntity> ew = new EntityWrapper<XunlianjiluEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xunlianjilu, "xunlianjilu")); 
        return R.ok().put("data", xunlianjiluService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XunlianjiluEntity xunlianjilu){
        EntityWrapper< XunlianjiluEntity> ew = new EntityWrapper< XunlianjiluEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xunlianjilu, "xunlianjilu")); 
		XunlianjiluView xunlianjiluView =  xunlianjiluService.selectView(ew);
		return R.ok("查询训练记录成功").put("data", xunlianjiluView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XunlianjiluEntity xunlianjilu = xunlianjiluService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xunlianjilu,deSens);
        return R.ok().put("data", xunlianjilu);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XunlianjiluEntity xunlianjilu = xunlianjiluService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xunlianjilu,deSens);
        return R.ok().put("data", xunlianjilu);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XunlianjiluEntity xunlianjilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xunlianjilu);
        xunlianjiluService.insert(xunlianjilu);
        return R.ok().put("data",xunlianjilu.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XunlianjiluEntity xunlianjilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xunlianjilu);
        xunlianjiluService.insert(xunlianjilu);
        return R.ok().put("data",xunlianjilu.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XunlianjiluEntity xunlianjilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xunlianjilu);
        //全部更新
        xunlianjiluService.updateById(xunlianjilu);
        return R.ok();
    }

    /**
     * 审核
     */
    @RequestMapping("/shBatch")
    @Transactional
    public R update(@RequestBody Long[] ids, @RequestParam String sfsh, @RequestParam String shhf){
        List<XunlianjiluEntity> list = new ArrayList<XunlianjiluEntity>();
        for(Long id : ids) {
            XunlianjiluEntity xunlianjilu = xunlianjiluService.selectById(id);
            xunlianjilu.setSfsh(sfsh);
            xunlianjilu.setShhf(shhf);
            list.add(xunlianjilu);
        }
        xunlianjiluService.updateBatchById(list);
        return R.ok();
    }


    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xunlianjiluService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    








}
