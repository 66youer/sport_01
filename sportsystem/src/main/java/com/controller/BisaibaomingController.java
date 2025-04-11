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

import com.entity.BisaibaomingEntity;
import com.entity.view.BisaibaomingView;

import com.service.BisaibaomingService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 比赛报名
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
@RestController
@RequestMapping("/bisaibaoming")
public class BisaibaomingController {
    @Autowired
    private BisaibaomingService bisaibaomingService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,BisaibaomingEntity bisaibaoming,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yundongyuan")) {
			bisaibaoming.setZhanghao((String)request.getSession().getAttribute("username"));
		}
        //设置查询条件
        EntityWrapper<BisaibaomingEntity> ew = new EntityWrapper<BisaibaomingEntity>();


        //查询结果
		PageUtils page = bisaibaomingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bisaibaoming), params), params));
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
    public R list(@RequestParam Map<String, Object> params,BisaibaomingEntity bisaibaoming, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<BisaibaomingEntity> ew = new EntityWrapper<BisaibaomingEntity>();

        //查询结果
		PageUtils page = bisaibaomingService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, bisaibaoming), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( BisaibaomingEntity bisaibaoming){
       	EntityWrapper<BisaibaomingEntity> ew = new EntityWrapper<BisaibaomingEntity>();
      	ew.allEq(MPUtil.allEQMapPre( bisaibaoming, "bisaibaoming")); 
        return R.ok().put("data", bisaibaomingService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(BisaibaomingEntity bisaibaoming){
        EntityWrapper< BisaibaomingEntity> ew = new EntityWrapper< BisaibaomingEntity>();
 		ew.allEq(MPUtil.allEQMapPre( bisaibaoming, "bisaibaoming")); 
		BisaibaomingView bisaibaomingView =  bisaibaomingService.selectView(ew);
		return R.ok("查询比赛报名成功").put("data", bisaibaomingView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        BisaibaomingEntity bisaibaoming = bisaibaomingService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bisaibaoming,deSens);
        return R.ok().put("data", bisaibaoming);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        BisaibaomingEntity bisaibaoming = bisaibaomingService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(bisaibaoming,deSens);
        return R.ok().put("data", bisaibaoming);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody BisaibaomingEntity bisaibaoming, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bisaibaoming);
        bisaibaomingService.insert(bisaibaoming);
        return R.ok().put("data",bisaibaoming.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody BisaibaomingEntity bisaibaoming, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bisaibaoming);
        bisaibaomingService.insert(bisaibaoming);
        return R.ok().put("data",bisaibaoming.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody BisaibaomingEntity bisaibaoming, HttpServletRequest request){
        //ValidatorUtils.validateEntity(bisaibaoming);
        //全部更新
        bisaibaomingService.updateById(bisaibaoming);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        bisaibaomingService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    








}
