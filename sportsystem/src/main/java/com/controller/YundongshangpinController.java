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

import com.entity.YundongshangpinEntity;
import com.entity.view.YundongshangpinView;

import com.service.YundongshangpinService;
import com.service.TokenService;
import com.utils.PageUtils;
import com.utils.R;
import com.utils.MPUtil;
import com.utils.MapUtils;
import com.utils.CommonUtil;
import java.io.IOException;
import com.service.StoreupService;
import com.entity.StoreupEntity;

/**
 * 运动商品
 * 后端接口
 * @author 
 * @email 
 * @date 2025-03-24 22:21:38
 */
@RestController
@RequestMapping("/yundongshangpin")
public class YundongshangpinController {
    @Autowired
    private YundongshangpinService yundongshangpinService;

    @Autowired
    private StoreupService storeupService;





    



    /**
     * 后台列表
     */
    @RequestMapping("/page")
    public R page(@RequestParam Map<String, Object> params,YundongshangpinEntity yundongshangpin,
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<YundongshangpinEntity> ew = new EntityWrapper<YundongshangpinEntity>();
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);


        //查询结果
		PageUtils page = yundongshangpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yundongshangpin), params), params));
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
    public R list(@RequestParam Map<String, Object> params,YundongshangpinEntity yundongshangpin, 
                @RequestParam(required = false) Double pricestart,
                @RequestParam(required = false) Double priceend,
		HttpServletRequest request){
        //设置查询条件
        EntityWrapper<YundongshangpinEntity> ew = new EntityWrapper<YundongshangpinEntity>();
        if(pricestart!=null) ew.ge("price", pricestart);
        if(priceend!=null) ew.le("price", priceend);

        //查询结果
		PageUtils page = yundongshangpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yundongshangpin), params), params));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(page,deSens);
        return R.ok().put("data", page);
    }



	/**
     * 列表
     */
    @RequestMapping("/lists")
    public R list( YundongshangpinEntity yundongshangpin){
       	EntityWrapper<YundongshangpinEntity> ew = new EntityWrapper<YundongshangpinEntity>();
      	ew.allEq(MPUtil.allEQMapPre( yundongshangpin, "yundongshangpin")); 
        return R.ok().put("data", yundongshangpinService.selectListView(ew));
    }

	 /**
     * 查询
     */
    @RequestMapping("/query")
    public R query(YundongshangpinEntity yundongshangpin){
        EntityWrapper< YundongshangpinEntity> ew = new EntityWrapper< YundongshangpinEntity>();
 		ew.allEq(MPUtil.allEQMapPre( yundongshangpin, "yundongshangpin")); 
		YundongshangpinView yundongshangpinView =  yundongshangpinService.selectView(ew);
		return R.ok("查询运动商品成功").put("data", yundongshangpinView);
    }
	
    /**
     * 后台详情
     */
    @RequestMapping("/info/{id}")
    public R info(@PathVariable("id") Long id){
        YundongshangpinEntity yundongshangpin = yundongshangpinService.selectById(id);
        if(null==yundongshangpin.getClicknum()){
            yundongshangpin.setClicknum(0);
        }
		yundongshangpin.setClicknum(yundongshangpin.getClicknum()+1);
		yundongshangpin.setClicktime(new Date());
		yundongshangpinService.updateById(yundongshangpin);
        yundongshangpin = yundongshangpinService.selectView(new EntityWrapper<YundongshangpinEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(yundongshangpin,deSens);
        return R.ok().put("data", yundongshangpin);
    }

    /**
     * 前台详情
     */
	@IgnoreAuth
    @RequestMapping("/detail/{id}")
    public R detail(@PathVariable("id") Long id){
        YundongshangpinEntity yundongshangpin = yundongshangpinService.selectById(id);
        if(null==yundongshangpin.getClicknum()){
            yundongshangpin.setClicknum(0);
        }
		yundongshangpin.setClicknum(yundongshangpin.getClicknum()+1);
		yundongshangpin.setClicktime(new Date());
		yundongshangpinService.updateById(yundongshangpin);
        yundongshangpin = yundongshangpinService.selectView(new EntityWrapper<YundongshangpinEntity>().eq("id", id));
        Map<String, String> deSens = new HashMap<>();
        //给需要脱敏的字段脱敏
        DeSensUtil.desensitize(yundongshangpin,deSens);
        return R.ok().put("data", yundongshangpin);
    }
    



    /**
     * 后台保存
     */
    @RequestMapping("/save")
    public R save(@RequestBody YundongshangpinEntity yundongshangpin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yundongshangpin);
        yundongshangpinService.insert(yundongshangpin);
        return R.ok().put("data",yundongshangpin.getId());
    }
    
    /**
     * 前台保存
     */
    @RequestMapping("/add")
    public R add(@RequestBody YundongshangpinEntity yundongshangpin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yundongshangpin);
        yundongshangpinService.insert(yundongshangpin);
        return R.ok().put("data",yundongshangpin.getId());
    }





    /**
     * 修改
     */
    @RequestMapping("/update")
    @Transactional
    public R update(@RequestBody YundongshangpinEntity yundongshangpin, HttpServletRequest request){
        //ValidatorUtils.validateEntity(yundongshangpin);
        //全部更新
        yundongshangpinService.updateById(yundongshangpin);
        return R.ok();
    }



    

    /**
     * 删除
     */
    @RequestMapping("/delete")
    public R delete(@RequestBody Long[] ids){
        yundongshangpinService.deleteBatchIds(Arrays.asList(ids));
        return R.ok();
    }
    
	/**
     * 前台智能排序
     */
	@IgnoreAuth
    @RequestMapping("/autoSort")
    public R autoSort(@RequestParam Map<String, Object> params,YundongshangpinEntity yundongshangpin, HttpServletRequest request,String pre){
        EntityWrapper<YundongshangpinEntity> ew = new EntityWrapper<YundongshangpinEntity>();
        ew.eq("onshelves","1");
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
		params.put("sort", "clicknum");
        params.put("order", "desc");

		PageUtils page = yundongshangpinService.queryPage(params, MPUtil.sort(MPUtil.between(MPUtil.likeOrEq(ew, yundongshangpin), params), params));
        return R.ok().put("data", page);
    }








}
