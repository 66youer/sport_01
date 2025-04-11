import Vue from 'vue';
//配置路由
import VueRouter from 'vue-router'
Vue.use(VueRouter);
//1.创建组件
import Index from '@/views/index'
import Home from '@/views/home'
import Login from '@/views/login'
import NotFound from '@/views/404'
import UpdatePassword from '@/views/update-password'
import pay from '@/views/pay'
import register from '@/views/register'
import center from '@/views/center'
	import news from '@/views/modules/news/list'
	import discussbisaixinxi from '@/views/modules/discussbisaixinxi/list'
	import toupiao from '@/views/modules/toupiao/list'
	import bisaijilu from '@/views/modules/bisaijilu/list'
	import yundongyuan from '@/views/modules/yundongyuan/list'
	import discussyundongshangpin from '@/views/modules/discussyundongshangpin/list'
	import forum from '@/views/modules/forum/list'
	import bisaixinxi from '@/views/modules/bisaixinxi/list'
	import forumtype from '@/views/modules/forumtype/list'
	import jiaolianyuan from '@/views/modules/jiaolianyuan/list'
	import yonghu from '@/views/modules/yonghu/list'
	import bisaileixing from '@/views/modules/bisaileixing/list'
	import xunlianjihua from '@/views/modules/xunlianjihua/list'
	import shangpinfenlei from '@/views/modules/shangpinfenlei/list'
	import discussbisaijilu from '@/views/modules/discussbisaijilu/list'
	import forumreport from '@/views/modules/forumreport/list'
	import orders from '@/views/modules/orders/list'
	import bisaibaoming from '@/views/modules/bisaibaoming/list'
	import xunlianjilu from '@/views/modules/xunlianjilu/list'
	import config from '@/views/modules/config/list'
	import yundongshangpin from '@/views/modules/yundongshangpin/list'
	import newstype from '@/views/modules/newstype/list'


//2.配置路由   注意：名字
export const routes = [{
	path: '/',
	name: '系统首页',
	component: Index,
	children: [{
		// 这里不设置值，是把main作为默认页面
		path: '/',
		name: '系统首页',
		component: Home,
		meta: {icon:'', title:'center', affix: true}
	}, {
		path: '/updatePassword',
		name: '修改密码',
		component: UpdatePassword,
		meta: {icon:'', title:'updatePassword'}
	}, {
		path: '/pay',
		name: '支付',
		component: pay,
		meta: {icon:'', title:'pay'}
	}, {
		path: '/center',
		name: '个人信息',
		component: center,
		meta: {icon:'', title:'center'}
	}
	,{
		path: '/news',
		name: '体育资讯',
		component: news
	}
	,{
		path: '/discussbisaixinxi',
		name: '比赛信息评论',
		component: discussbisaixinxi
	}
	,{
		path: '/toupiao',
		name: '投票',
		component: toupiao
	}
	,{
		path: '/bisaijilu',
		name: '比赛记录',
		component: bisaijilu
	}
	,{
		path: '/yundongyuan',
		name: '运动员',
		component: yundongyuan
	}
	,{
		path: '/discussyundongshangpin',
		name: '运动商品评论',
		component: discussyundongshangpin
	}
	,{
		path: '/forum',
		name: '社区互动',
		component: forum
	}
	,{
		path: '/bisaixinxi',
		name: '比赛信息',
		component: bisaixinxi
	}
	,{
		path: '/forumtype',
		name: '论坛分类',
		component: forumtype
	}
	,{
		path: '/jiaolianyuan',
		name: '教练员',
		component: jiaolianyuan
	}
	,{
		path: '/yonghu',
		name: '用户',
		component: yonghu
	}
	,{
		path: '/bisaileixing',
		name: '比赛类型',
		component: bisaileixing
	}
	,{
		path: '/xunlianjihua',
		name: '训练计划',
		component: xunlianjihua
	}
	,{
		path: '/shangpinfenlei',
		name: '商品分类',
		component: shangpinfenlei
	}
	,{
		path: '/discussbisaijilu',
		name: '比赛记录评论',
		component: discussbisaijilu
	}
	,{
		path: '/forumreport',
		name: '举报记录',
		component: forumreport
	}
	,{
		path: '/orders/:status',
		name: '订单管理',
		component: orders
	}
	,{
		path: '/bisaibaoming',
		name: '比赛报名',
		component: bisaibaoming
	}
	,{
		path: '/xunlianjilu',
		name: '训练记录',
		component: xunlianjilu
	}
	,{
		path: '/config',
		name: '轮播图管理',
		component: config
	}
	,{
		path: '/yundongshangpin',
		name: '运动商品',
		component: yundongshangpin
	}
	,{
		path: '/newstype',
		name: '体育资讯分类',
		component: newstype
	}
	]
	},
	{
		path: '/login',
		name: 'login',
		component: Login,
		meta: {icon:'', title:'login'}
	},
	{
		path: '/register',
		name: 'register',
		component: register,
		meta: {icon:'', title:'register'}
	},
	{
		path: '*',
		component: NotFound
	}
]
//3.实例化VueRouter  注意：名字
const router = new VueRouter({
	mode: 'hash',
	/*hash模式改为history*/
	routes // （缩写）相当于 routes: routes
})
const originalPush = VueRouter.prototype.push
//修改原型对象中的push方法
VueRouter.prototype.push = function push(location) {
	return originalPush.call(this, location).catch(err => err)
}
export default router;
