import VueRouter from 'vue-router'
//引入组件
import Index from '../pages'
import Home from '../pages/home/home'
import Login from '../pages/login/login'
import Register from '../pages/register/register'
import Center from '../pages/center/center'
import Forum from '../pages/forum/list'
import ForumAdd from '../pages/forum/add'
import ForumDetail from '../pages/forum/detail'
import MyForumList from '../pages/forum/myForumList'
import Storeup from '../pages/storeup/list'
import AddrList from '../pages/shop-address/list'
import AddrAdd from '../pages/shop-address/addOrUpdate'
import Order from '../pages/shop-order/list'
import OrderConfirm from '../pages/shop-order/confirm'
import Cart from '../pages/shop-cart/list'
import News from '../pages/news/news-list'
import NewsDetail from '../pages/news/news-detail'
import payList from '../pages/pay'

import yonghuList from '../pages/yonghu/list'
import yonghuDetail from '../pages/yonghu/detail'
import yonghuAdd from '../pages/yonghu/add'
import yundongyuanList from '../pages/yundongyuan/list'
import yundongyuanDetail from '../pages/yundongyuan/detail'
import yundongyuanAdd from '../pages/yundongyuan/add'
import jiaolianyuanList from '../pages/jiaolianyuan/list'
import jiaolianyuanDetail from '../pages/jiaolianyuan/detail'
import jiaolianyuanAdd from '../pages/jiaolianyuan/add'
import bisaixinxiList from '../pages/bisaixinxi/list'
import bisaixinxiDetail from '../pages/bisaixinxi/detail'
import bisaixinxiAdd from '../pages/bisaixinxi/add'
import bisaileixingList from '../pages/bisaileixing/list'
import bisaileixingDetail from '../pages/bisaileixing/detail'
import bisaileixingAdd from '../pages/bisaileixing/add'
import bisaibaomingList from '../pages/bisaibaoming/list'
import bisaibaomingDetail from '../pages/bisaibaoming/detail'
import bisaibaomingAdd from '../pages/bisaibaoming/add'
import bisaijiluList from '../pages/bisaijilu/list'
import bisaijiluDetail from '../pages/bisaijilu/detail'
import bisaijiluAdd from '../pages/bisaijilu/add'
import xunlianjihuaList from '../pages/xunlianjihua/list'
import xunlianjihuaDetail from '../pages/xunlianjihua/detail'
import xunlianjihuaAdd from '../pages/xunlianjihua/add'
import xunlianjiluList from '../pages/xunlianjilu/list'
import xunlianjiluDetail from '../pages/xunlianjilu/detail'
import xunlianjiluAdd from '../pages/xunlianjilu/add'
import shangpinfenleiList from '../pages/shangpinfenlei/list'
import shangpinfenleiDetail from '../pages/shangpinfenlei/detail'
import shangpinfenleiAdd from '../pages/shangpinfenlei/add'
import yundongshangpinList from '../pages/yundongshangpin/list'
import yundongshangpinDetail from '../pages/yundongshangpin/detail'
import yundongshangpinAdd from '../pages/yundongshangpin/add'
import toupiaoList from '../pages/toupiao/list'
import toupiaoDetail from '../pages/toupiao/detail'
import toupiaoAdd from '../pages/toupiao/add'
import forumtypeList from '../pages/forumtype/list'
import forumtypeDetail from '../pages/forumtype/detail'
import forumtypeAdd from '../pages/forumtype/add'
import forumreportList from '../pages/forumreport/list'
import forumreportDetail from '../pages/forumreport/detail'
import forumreportAdd from '../pages/forumreport/add'
import chargerecordList from '../pages/chargerecord/list'
import chargerecordDetail from '../pages/chargerecord/detail'
import chargerecordAdd from '../pages/chargerecord/add'
import newstypeList from '../pages/newstype/list'
import newstypeDetail from '../pages/newstype/detail'
import newstypeAdd from '../pages/newstype/add'
import discussbisaixinxiList from '../pages/discussbisaixinxi/list'
import discussbisaixinxiDetail from '../pages/discussbisaixinxi/detail'
import discussbisaixinxiAdd from '../pages/discussbisaixinxi/add'
import discussbisaijiluList from '../pages/discussbisaijilu/list'
import discussbisaijiluDetail from '../pages/discussbisaijilu/detail'
import discussbisaijiluAdd from '../pages/discussbisaijilu/add'
import discussyundongshangpinList from '../pages/discussyundongshangpin/list'
import discussyundongshangpinDetail from '../pages/discussyundongshangpin/detail'
import discussyundongshangpinAdd from '../pages/discussyundongshangpin/add'

const originalPush = VueRouter.prototype.push
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}

//配置路由
export default new VueRouter({
	routes:[
		{
      path: '/',
      redirect: '/index/home'
    },
		{
			path: '/index',
			component: Index,
			children:[
				{
					path: 'home',
					component: Home
				},
				{
					path: 'center',
					component: Center,
				},
				{
					path: 'pay',
					component: payList,
				},
				{
					path: 'forum',
					component: Forum
				},
				{
					path: 'forumAdd',
					component: ForumAdd
				},
				{
					path: 'forumDetail',
					component: ForumDetail
				},
				{
					path: 'myForumList',
					component: MyForumList
				},
				{
					path: 'storeup',
					component: Storeup
				},
                {
                    path: 'shop-address/list',
                    component: AddrList
                },
                {
                    path: 'shop-address/addOrUpdate',
                    component: AddrAdd
                },
				{
					path: 'shop-order/order',
					component: Order
				},
				{
					path: 'cart',
					component: Cart
				},
				{
					path: 'shop-order/orderConfirm',
					component: OrderConfirm
				},
				{
					path: 'news',
					component: News
				},
				{
					path: 'newsDetail',
					component: NewsDetail
				},
				{
					path: 'yonghu',
					component: yonghuList
				},
				{
					path: 'yonghuDetail',
					component: yonghuDetail
				},
				{
					path: 'yonghuAdd',
					component: yonghuAdd
				},
				{
					path: 'yundongyuan',
					component: yundongyuanList
				},
				{
					path: 'yundongyuanDetail',
					component: yundongyuanDetail
				},
				{
					path: 'yundongyuanAdd',
					component: yundongyuanAdd
				},
				{
					path: 'jiaolianyuan',
					component: jiaolianyuanList
				},
				{
					path: 'jiaolianyuanDetail',
					component: jiaolianyuanDetail
				},
				{
					path: 'jiaolianyuanAdd',
					component: jiaolianyuanAdd
				},
				{
					path: 'bisaixinxi',
					component: bisaixinxiList
				},
				{
					path: 'bisaixinxiDetail',
					component: bisaixinxiDetail
				},
				{
					path: 'bisaixinxiAdd',
					component: bisaixinxiAdd
				},
				{
					path: 'bisaileixing',
					component: bisaileixingList
				},
				{
					path: 'bisaileixingDetail',
					component: bisaileixingDetail
				},
				{
					path: 'bisaileixingAdd',
					component: bisaileixingAdd
				},
				{
					path: 'bisaibaoming',
					component: bisaibaomingList
				},
				{
					path: 'bisaibaomingDetail',
					component: bisaibaomingDetail
				},
				{
					path: 'bisaibaomingAdd',
					component: bisaibaomingAdd
				},
				{
					path: 'bisaijilu',
					component: bisaijiluList
				},
				{
					path: 'bisaijiluDetail',
					component: bisaijiluDetail
				},
				{
					path: 'bisaijiluAdd',
					component: bisaijiluAdd
				},
				{
					path: 'xunlianjihua',
					component: xunlianjihuaList
				},
				{
					path: 'xunlianjihuaDetail',
					component: xunlianjihuaDetail
				},
				{
					path: 'xunlianjihuaAdd',
					component: xunlianjihuaAdd
				},
				{
					path: 'xunlianjilu',
					component: xunlianjiluList
				},
				{
					path: 'xunlianjiluDetail',
					component: xunlianjiluDetail
				},
				{
					path: 'xunlianjiluAdd',
					component: xunlianjiluAdd
				},
				{
					path: 'shangpinfenlei',
					component: shangpinfenleiList
				},
				{
					path: 'shangpinfenleiDetail',
					component: shangpinfenleiDetail
				},
				{
					path: 'shangpinfenleiAdd',
					component: shangpinfenleiAdd
				},
				{
					path: 'yundongshangpin',
					component: yundongshangpinList
				},
				{
					path: 'yundongshangpinDetail',
					component: yundongshangpinDetail
				},
				{
					path: 'yundongshangpinAdd',
					component: yundongshangpinAdd
				},
				{
					path: 'toupiao',
					component: toupiaoList
				},
				{
					path: 'toupiaoDetail',
					component: toupiaoDetail
				},
				{
					path: 'toupiaoAdd',
					component: toupiaoAdd
				},
				{
					path: 'forumtype',
					component: forumtypeList
				},
				{
					path: 'forumtypeDetail',
					component: forumtypeDetail
				},
				{
					path: 'forumtypeAdd',
					component: forumtypeAdd
				},
				{
					path: 'forumreport',
					component: forumreportList
				},
				{
					path: 'forumreportDetail',
					component: forumreportDetail
				},
				{
					path: 'forumreportAdd',
					component: forumreportAdd
				},
				{
					path: 'chargerecord',
					component: chargerecordList
				},
				{
					path: 'chargerecordDetail',
					component: chargerecordDetail
				},
				{
					path: 'chargerecordAdd',
					component: chargerecordAdd
				},
				{
					path: 'newstype',
					component: newstypeList
				},
				{
					path: 'newstypeDetail',
					component: newstypeDetail
				},
				{
					path: 'newstypeAdd',
					component: newstypeAdd
				},
				{
					path: 'discussbisaixinxi',
					component: discussbisaixinxiList
				},
				{
					path: 'discussbisaixinxiDetail',
					component: discussbisaixinxiDetail
				},
				{
					path: 'discussbisaixinxiAdd',
					component: discussbisaixinxiAdd
				},
				{
					path: 'discussbisaijilu',
					component: discussbisaijiluList
				},
				{
					path: 'discussbisaijiluDetail',
					component: discussbisaijiluDetail
				},
				{
					path: 'discussbisaijiluAdd',
					component: discussbisaijiluAdd
				},
				{
					path: 'discussyundongshangpin',
					component: discussyundongshangpinList
				},
				{
					path: 'discussyundongshangpinDetail',
					component: discussyundongshangpinDetail
				},
				{
					path: 'discussyundongshangpinAdd',
					component: discussyundongshangpinAdd
				},
			]
		},
		{
			path: '/login',
			component: Login
		},
		{
			path: '/register',
			component: Register
		},
	]
})
