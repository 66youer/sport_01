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

import com.entity.XunlianjihuaEntity;
import com.entity.view.XunlianjihuaView;

import com.service.XunlianjihuaService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 训练计划
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:37
 */
@RestController
@RequestMapping("/xunlianjihua")
public class XunlianjihuaController {
    @Autowired
    private XunlianjihuaService xunlianjihuaService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,XunlianjihuaEntity xunlianjihua,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("jiaolianyuan")) {
			xunlianjihua.setJiaoliangonghao((String)request.getSession().getAttribute("username"));
		}
        //设置查询条件
        EntityWrapper<XunlianjihuaEntity> ew = new EntityWrapper<XunlianjihuaEntity>();


        //查询结果
		PageUtils page = xunlianjihuaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xunlianjihua), params), params));
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
    public R list(@RequestParam Map<String, Object> params,XunlianjihuaEntity xunlianjihua, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<XunlianjihuaEntity> ew = new EntityWrapper<XunlianjihuaEntity>();

        //查询结果
		PageUtils page = xunlianjihuaService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, xunlianjihua), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( XunlianjihuaEntity xunlianjihua){
       	EntityWrapper<XunlianjihuaEntity> ew = new EntityWrapper<XunlianjihuaEntity>();
      	ew.allEq(MPUtil.allEQMapPre( xunlianjihua, "xunlianjihua")); 
        return R.ok().put("data", xunlianjihuaService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(XunlianjihuaEntity xunlianjihua){
        EntityWrapper< XunlianjihuaEntity> ew = new EntityWrapper< XunlianjihuaEntity>();
 		ew.allEq(MPUtil.allEQMapPre( xunlianjihua, "xunlianjihua")); 
		XunlianjihuaView xunlianjihuaView =  xunlianjihuaService.selectView(ew);
		return R.ok("查询训练计划成功").put("data", xunlianjihuaView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        XunlianjihuaEntity xunlianjihua = xunlianjihuaService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xunlianjihua,deSens);
        return R.ok().put("data", xunlianjihua);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        XunlianjihuaEntity xunlianjihua = xunlianjihuaService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(xunlianjihua,deSens);
        return R.ok().put("data", xunlianjihua);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody XunlianjihuaEntity xunlianjihua, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xunlianjihua);
        xunlianjihuaService.insert(xunlianjihua);
        return R.ok().put("data",xunlianjihua.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody XunlianjihuaEntity xunlianjihua, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xunlianjihua);
        xunlianjihuaService.insert(xunlianjihua);
        return R.ok().put("data",xunlianjihua.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody XunlianjihuaEntity xunlianjihua, HttpServletRequest request){
        //ValidatorUtils.validateEntity(xunlianjihua);
        //全部更新
        xunlianjihuaService.updateById(xunlianjihua);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        xunlianjihuaService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    








}
