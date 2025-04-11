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

import com.entity.ToupiaoEntity;
import com.entity.view.ToupiaoView;

import com.service.ToupiaoService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 投票
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:38
 */
@RestController
@RequestMapping("/toupiao")
public class ToupiaoController {
    @Autowired
    private ToupiaoService toupiaoService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,ToupiaoEntity toupiao,
		HttpServletRequest request){
		String tableName = request.getSession().getAttribute("tableName").toString();
		if(tableName.equals("yonghu")) {
			toupiao.setYonghuzhanghao((String)request.getSession().getAttribute("username"));
		}
        //设置查询条件
        EntityWrapper<ToupiaoEntity> ew = new EntityWrapper<ToupiaoEntity>();


        //查询结果
		PageUtils page = toupiaoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, toupiao), params), params));
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
    public R list(@RequestParam Map<String, Object> params,ToupiaoEntity toupiao, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<ToupiaoEntity> ew = new EntityWrapper<ToupiaoEntity>();

        //查询结果
		PageUtils page = toupiaoService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, toupiao), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( ToupiaoEntity toupiao){
       	EntityWrapper<ToupiaoEntity> ew = new EntityWrapper<ToupiaoEntity>();
      	ew.allEq(MPUtil.allEQMapPre( toupiao, "toupiao")); 
        return R.ok().put("data", toupiaoService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(ToupiaoEntity toupiao){
        EntityWrapper< ToupiaoEntity> ew = new EntityWrapper< ToupiaoEntity>();
 		ew.allEq(MPUtil.allEQMapPre( toupiao, "toupiao")); 
		ToupiaoView toupiaoView =  toupiaoService.selectView(ew);
		return R.ok("查询投票成功").put("data", toupiaoView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        ToupiaoEntity toupiao = toupiaoService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(toupiao,deSens);
        return R.ok().put("data", toupiao);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        ToupiaoEntity toupiao = toupiaoService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(toupiao,deSens);
        return R.ok().put("data", toupiao);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody ToupiaoEntity toupiao, HttpServletRequest request){
        //ValidatorUtils.validateEntity(toupiao);
        toupiaoService.insert(toupiao);
        return R.ok().put("data",toupiao.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody ToupiaoEntity toupiao, HttpServletRequest request){
        //ValidatorUtils.validateEntity(toupiao);
        toupiaoService.insert(toupiao);
        return R.ok().put("data",toupiao.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody ToupiaoEntity toupiao, HttpServletRequest request){
        //ValidatorUtils.validateEntity(toupiao);
        //全部更新
        toupiaoService.updateById(toupiao);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        toupiaoService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    








}
