export default {
	baseUrl: 'http://localhost:8080/sportsystem/',
	name: '/sportsystem',
	indexNav: [
		{
			name: '运动员',
			url: '/index/yundongyuan',
		},
		{
			name: '比赛信息',
			url: '/index/bisaixinxi',
		},
		{
			name: '运动商品',
			url: '/index/yundongshangpin',
		},
		{
			name: '社区互动',
			url: '/index/forum'
		}, 
		{
			name: '体育资讯',
			url: '/index/news'
		},
	],
	cateList: [
		{
			name: '比赛信息',
			refTable: 'bisaileixing',
			refColumn: 'bisaileixing',
		},
		{
			name: '比赛记录',
			refTable: 'bisaileixing',
			refColumn: 'bisaileixing',
		},
		{
			name: '运动商品',
			refTable: 'shangpinfenlei',
			refColumn: 'shangpinfenlei',
		},
		{
			name: '社区互动',
			refTable: 'forumtype',
			refColumn: 'typename',
		},
		{
			name: '体育资讯',
			refTable: 'newstype',
			refColumn: 'typename',
		},
	]
}
