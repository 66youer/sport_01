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

import com.entity.DiscussbisaijiluEntity;
import com.entity.view.DiscussbisaijiluView;

import com.service.DiscussbisaijiluService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;

/**
 * 比赛记录评论表
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:39
 */
@RestController
@RequestMapping("/discussbisaijilu")
public class DiscussbisaijiluController {
    @Autowired
    private DiscussbisaijiluService discussbisaijiluService;






    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,DiscussbisaijiluEntity discussbisaijilu,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<DiscussbisaijiluEntity> ew = new EntityWrapper<DiscussbisaijiluEntity>();


        //查询结果
		PageUtils page = discussbisaijiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbisaijilu), params), params));
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
    public R list(@RequestParam Map<String, Object> params,DiscussbisaijiluEntity discussbisaijilu, 
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<DiscussbisaijiluEntity> ew = new EntityWrapper<DiscussbisaijiluEntity>();

        //查询结果
		PageUtils page = discussbisaijiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbisaijilu), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( DiscussbisaijiluEntity discussbisaijilu){
       	EntityWrapper<DiscussbisaijiluEntity> ew = new EntityWrapper<DiscussbisaijiluEntity>();
      	ew.allEq(MPUtil.allEQMapPre( discussbisaijilu, "discussbisaijilu")); 
        return R.ok().put("data", discussbisaijiluService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(DiscussbisaijiluEntity discussbisaijilu){
        EntityWrapper< DiscussbisaijiluEntity> ew = new EntityWrapper< DiscussbisaijiluEntity>();
 		ew.allEq(MPUtil.allEQMapPre( discussbisaijilu, "discussbisaijilu")); 
		DiscussbisaijiluView discussbisaijiluView =  discussbisaijiluService.selectView(ew);
		return R.ok("查询比赛记录评论表成功").put("data", discussbisaijiluView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        DiscussbisaijiluEntity discussbisaijilu = discussbisaijiluService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(discussbisaijilu,deSens);
        return R.ok().put("data", discussbisaijilu);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        DiscussbisaijiluEntity discussbisaijilu = discussbisaijiluService.selectById(id);
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(discussbisaijilu,deSens);
        return R.ok().put("data", discussbisaijilu);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody DiscussbisaijiluEntity discussbisaijilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbisaijilu);
        discussbisaijiluService.insert(discussbisaijilu);
        return R.ok().put("data",discussbisaijilu.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody DiscussbisaijiluEntity discussbisaijilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbisaijilu);
        discussbisaijiluService.insert(discussbisaijilu);
        return R.ok().put("data",discussbisaijilu.getId());
    }



     /**
     * 获取用户密保
     */
    @RequestMapping("/security")
    @IgnoreAuth
    public R security(@RequestParam String username){
        DiscussbisaijiluEntity discussbisaijilu = discussbisaijiluService.selectOne(new EntityWrapper<DiscussbisaijiluEntity>().eq("", username));
        return R.ok().put("data", discussbisaijilu);
    }


    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    @IgnoreAuth
    public R update(@RequestBody DiscussbisaijiluEntity discussbisaijilu, HttpServletRequest request){
        //ValidatorUtils.validateEntity(discussbisaijilu);
        //全部更新
        discussbisaijiluService.updateById(discussbisaijilu);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        discussbisaijiluService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,DiscussbisaijiluEntity discussbisaijilu, HttpServletRequest request,String pre){
        EntityWrapper<DiscussbisaijiluEntity> ew = new EntityWrapper<DiscussbisaijiluEntity>();
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

		PageUtils page = discussbisaijiluService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, discussbisaijilu), params), params));
        return R.ok().put("data", page);
    }








}
