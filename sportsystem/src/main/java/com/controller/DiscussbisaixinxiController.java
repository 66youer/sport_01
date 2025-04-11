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

import com.entity.DiscussbisaixinxiEntity;
import com.entity.view.DiscussbisaixinxiView;

import com.service.DiscussbisaixinxiService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 比赛信息评论表
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:39
 */
@RestController
@RequestMapping("/discussbisaixinxi")
public class DiscussbisaixinxiController {
    @Autowired
    private DiscussbisaixinxiService discussbisaixinxiService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscussbisaixinxiEntity discussbisaixinxi,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<DiscussbisaixinxiEntity> ew = new EntityWrapper<DiscussbisaixinxiEntity>();


        //查询结果
		PageUtils page = discussbisaixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbisaixinxi), params), params));
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
    public R list(@RequestParam Map<String, Object> params,DiscussbisaixinxiEntity discussbisaixinxi, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<DiscussbisaixinxiEntity> ew = new EntityWrapper<DiscussbisaixinxiEntity>();

        //查询结果
		PageUtils page = discussbisaixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbisaixinxi), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscussbisaixinxiEntity discussbisaixinxi){
       	EntityWrapper<DiscussbisaixinxiEntity> ew = new EntityWrapper<DiscussbisaixinxiEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discussbisaixinxi, "discussbisaixinxi")); 
        return R.ok().put("data", discussbisaixinxiService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscussbisaixinxiEntity discussbisaixinxi){
        EntityWrapper< DiscussbisaixinxiEntity> ew = new EntityWrapper< DiscussbisaixinxiEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discussbisaixinxi, "discussbisaixinxi")); 
		DiscussbisaixinxiView discussbisaixinxiView =  discussbisaixinxiService.selectView(ew);
		return R.ok("查询比赛信息评论表成功").put("data", discussbisaixinxiView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscussbisaixinxiEntity discussbisaixinxi = discussbisaixinxiService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(discussbisaixinxi,deSens);
        return R.ok().put("data", discussbisaixinxi);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscussbisaixinxiEntity discussbisaixinxi = discussbisaixinxiService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(discussbisaixinxi,deSens);
        return R.ok().put("data", discussbisaixinxi);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiscussbisaixinxiEntity discussbisaixinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbisaixinxi);
        discussbisaixinxiService.insert(discussbisaixinxi);
        return R.ok().put("data",discussbisaixinxi.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiscussbisaixinxiEntity discussbisaixinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbisaixinxi);
        discussbisaixinxiService.insert(discussbisaixinxi);
        return R.ok().put("data",discussbisaixinxi.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        DiscussbisaixinxiEntity discussbisaixinxi = discussbisaixinxiService.selectOne(new EntityWrapper<DiscussbisaixinxiEntity>().eq("", username));
        return R.ok().put("data", discussbisaixinxi);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody DiscussbisaixinxiEntity discussbisaixinxi, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbisaixinxi);
        //全部更新
        discussbisaixinxiService.updateById(discussbisaixinxi);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        discussbisaixinxiService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,DiscussbisaixinxiEntity discussbisaixinxi, HttpServletRequest request,String pre){
        EntityWrapper<DiscussbisaixinxiEntity> ew = new EntityWrapper<DiscussbisaixinxiEntity>();
        Map<String, Object> newMap = new HashMap<String, Object>();
        Map<String, Object> param = new HashMap<String, Object>();
        // 组装参数
		Iterator<Map.Entry<String, Object>> it = param.entrySet().iterator();
		while (it.hasNext()) {
			Map.Entry<String, Object> entry = it.next();
			String key = entry.getKey();
			String newKey = entry.getKey();
			if (pre.endsWith(".")) {
				newMap.put(pre + newKey, entry.getValue());
			} else if (StringUtils.isEmpty(pre)) {
				newMap.put(newKey, entry.getValue());
			} else {
				newMap.put(pre + "." + newKey, entry.getValue());
			}
		}
		params.put("sort", "clicktime");
        params.put("order", "desc");

		PageUtils page = discussbisaixinxiService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbisaixinxi), params), params));
        return R.ok().put("data", page);
    }








}
