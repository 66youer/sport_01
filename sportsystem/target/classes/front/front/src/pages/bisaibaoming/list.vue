<template>
	<div>
		<div class="breadcrumb-preview">
			<el-breadcrumb :separator="''">
				<el-breadcrumb-item class="item1" to="/"><a>首页</a></el-breadcrumb-item>
				<el-breadcrumb-item class="item2" v-for="(item, index) in breadcrumbItem" :key="index"><a>{{item.name}}</a></el-breadcrumb-item>
			</el-breadcrumb>
		</div>
		<div v-if="centerType" class="back_box">
			<el-button class="backBtn" size="mini" @click="backClick">
				<span class="icon iconfont icon-jiantou33"></span>
				<span class="text">返回</span>
			</el-button>
		</div>
		<div class="list-preview">
			<el-form :inline="true" :model="formSearch" class="list-form-pv">
				<el-form-item class="list-item">
					<div class="lable">比赛名称：</div>
					<el-input v-model="formSearch.bisaimingcheng" placeholder="比赛名称" @keydown.enter.native="getList(1, curFenlei)" clearable></el-input>
				</el-form-item>
				<el-button class="list-search-btn" v-if=" true " type="primary" @click="getList(1, curFenlei)">
					<i class="el-icon-search"></i>
					查询
				</el-button>
				<el-button class="list-add-btn" v-if="btnAuth('bisaibaoming','新增')" type="primary" @click="add('/index/bisaibaomingAdd')">
					<i class="el-icon-circle-plus-outline"></i>
					添加
				</el-button>
			</el-form>
			<div class="select2">
				<div class="select2-list" v-for="(item,index) in selectOptionsList" :key="index">
					<div class="label">{{item.name}}：</div>
					<div class="item-body">
						<div class="item" @click="selectClick2(item,-1)" :class="item.check ==-1 ? 'active' : ''">全部</div>
						<div class="item" @click="selectClick2(item,index1)" :class="item.check == index1 ? 'active' : ''" v-for="item1,index1 in item.list" :key="index1">{{item1}}</div>
					</div>
				</div>
			</div>
			<div class="list">
				<!-- 样式一 -->
				<div class="list1 index-pv1">
					<div v-for="(item, index) in dataList" :key="index" @click.stop="toDetail(item)" class="list-item animation-box">
						<div class="name">比赛名称:{{item.bisaimingcheng}}</div>
						<div class="name">比赛类型:{{item.bisaileixing}}</div>
						<div class="name">{{item.bisairiqi}}</div>
						<div class="time_item">
							<span class="icon iconfont icon-shijian21"></span>
							<span class="label">发布时间：</span>
							<span class="text">{{item.addtime}}</span>
						</div>
						<div class="publisher_item">
							<span class="icon iconfont icon-geren16"></span>
							<span class="label">发布人：</span>
							<span class="text">{{item.zhanghao}}</span>
						</div>
					</div>
				</div>
			</div>

	
			<el-pagination
				background
				id="pagination"
				class="pagination"
				:pager-count="7"
				:page-size="pageSize"
				prev-text="上一页"
				next-text="下一页"
				:hide-on-single-page="false"
				:layout='["total","prev","pager","next","sizes","jumper"].join()'
				:total="total"
				:page-sizes="pageSizes"
				@current-change="curChange"
				@size-change="sizeChange"
				@prev-click="prevClick"
				@next-click="nextClick"
				></el-pagination>
		</div>
		<el-dialog title="预览图" :visible.sync="previewVisible" width="50%">
			<img :src="previewImg" alt="" style="width: 100%;">
		</el-dialog>
	</div>
</template>
<script>
	export default {
		//数据集合
		data() {
			return {
				selectIndex2: 0,
				selectOptionsList: [],
				layouts: '',
				swiperIndex: -1,
				baseUrl: '',
				breadcrumbItem: [
					{
						name: '比赛报名'
					}
				],
				formSearch: {
					bisaimingcheng: '',
				},
				fenlei: [],
				feileiColumn: '',
				dataList: [],
				total: 1,
				pageSize: 12,
				pageSizes: [],
				totalPage: 1,
				curFenlei: '全部',
				isPlain: false,
				indexQueryCondition: '',
				timeRange: [],
				centerType:false,
				previewImg: '',
				previewVisible: false,
				sortType: 'id',
				sortOrder: 'desc',
			}
		},
		async created() {
			if(this.$route.query.centerType&&this.$route.query.centerType!=0){
				this.centerType = true
			}
			this.baseUrl = this.$config.baseUrl;
			await this.getFenlei();
			let fenlei = '全部'
			if(this.$route.query.homeFenlei){
				fenlei = this.$route.query.homeFenlei
			}
			this.getList(1, fenlei);
		},
		watch:{
			$route(newValue){
				this.getList(1, newValue.query.homeFenlei);
			}
		},
		//方法集合
		methods: {
			selectClick2(row,index) {
				row.check = index
				if(index == -1){
					this.formSearch[row.tableName] = ''
				}else {
					this.formSearch[row.tableName] = row.list[index]
				}
				this.getList()
			},
			add(path) {
				let query = {}
				if(this.centerType){
					query.centerType = 1
				}
				this.$router.push({path: path,query:query});
			},
			async getFenlei() {
			},
			getList(page, fenlei, ref = '') {
				let params = {
					page,
					limit: this.pageSize,
				};
				let searchWhere = {};
				if (this.formSearch.bisaimingcheng != '') searchWhere.bisaimingcheng = '%' + this.formSearch.bisaimingcheng + '%';
				let user = JSON.parse(localStorage.getItem('sessionForm'))
				if (this.sortType) searchWhere.sort = this.sortType
				if (this.sortOrder) searchWhere.order = this.sortOrder
				this.$http.get(`bisaibaoming/${this.centerType?'page':'list'}`, {params: Object.assign(params, searchWhere)}).then(res => {
					if (res.data.code == 0) {
						this.dataList = res.data.data.list;
						this.total = Number(res.data.data.total);
						this.pageSize = Number(res.data.data.pageSize);
						this.totalPage = res.data.data.totalPage;
						if(this.pageSizes.length==0){
							this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
						}
					}
				});
			},
			curChange(page) {
				this.getList(page);
			},
			prevClick(page) {
				this.getList(page);
			},
			sizeChange(size){
				this.pageSize = size
				this.getList(1);
			},
			nextClick(page) {
				this.getList(page);
			},
			imgPreView(url){
				this.previewImg = url
				this.previewVisible = true
			},
			toDetail(item) {
				let params = {
					id: item.id
				}
				if(this.centerType){
					params.centerType = 1
				}
				this.$router.push({path: '/index/bisaibaomingDetail', query: params});
			},
			btnAuth(tableName,key){
				if(this.centerType){
					return this.isBackAuth(tableName,key)
				}else{
					return this.isAuth(tableName,key)
				}
			},
			backClick() {
				this.$router.push({path: '/index/center'});
			},
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.list-preview {
		padding: 0 calc((100% - 1200px)/2);
		margin: 0px auto;
		color: #333;
		background: #fff;
		display: flex;
		width: 100%;
		font-size: 16px;
		justify-content: flex-start;
		align-items: flex-start;
		position: relative;
		flex-wrap: wrap;
		.list-form-pv {
			padding: 10px;
			margin: 20px 0;
			color: inherit;
			background: none;
			display: flex;
			width: 101%;
			font-size: inherit;
			flex-wrap: wrap;
			height: auto;
			order: 2;
			.list-item {
				padding: 0;
				margin: 0 0px 10px 0;
				display: flex;
				font-size: inherit;
				align-items: center;
				flex-wrap: wrap;
				/deep/.el-form-item__content {
					display: flex;
				}
				.lable {
					padding: 0 10px;
					color: #333;
					white-space: nowrap;
					display: inline-block;
					width: auto;
					font-size: 16px;
					line-height: 40px;
				}
				.el-input {
					width: auto;
				}
				.datetimerange {
					border: 1px solid #ccc;
					border-radius: 8px;
					padding: 3px 3px;
					background: #fff;
					width: auto;
					justify-content: center;
				}
				.el-input /deep/ .el-input__inner {
					border: 1px solid #ccc;
					border-radius: 4px;
					padding: 0 10px;
					margin: 0 5px 0 0;
					color: #333;
					width: auto;
					font-size: 16px;
					line-height: 40px;
					height: 40px;
				}
				.el-select {
					width: 100%;
				}
				.el-select /deep/ .el-input__inner {
				}
				.el-date-editor {
					width: auto;
				}
				.el-date-editor /deep/ .el-input__inner {
					border: 1px solid #ccc;
					border-radius: 4px;
					padding: 0 0px 0 30px;
					margin: 0;
					color: #333;
					width: auto;
					font-size: 16px;
					line-height: 40px;
					height: 40px;
				}
			}
			.list-search-btn {
				cursor: pointer;
				border: 0;
				border-radius: 4px;
				padding: 0px 15px;
				margin: 0 10px 0 10px;
				color: #fff;
				background: #848c74;
				width: auto;
				font-size: inherit;
				line-height: 40px;
				height: 40px;
				i {
					margin: 0 10px 0 0;
					color: #fff;
					font-size: inherit;
				}
			}
			.list-add-btn {
				cursor: pointer;
				border: 0;
				border-radius: 4px;
				padding: 0px 15px;
				margin: 0 10px 0 0;
				color: #fff;
				background: #6cdbec;
				width: auto;
				font-size: inherit;
				line-height: 40px;
				height: 40px;
				i {
					margin: 0 10px 0 0;
					color: #fff;
					font-size: inherit;
				}
			}
		}
		.select2 {
			border: 0px solid #999;
			padding: 10px 20px;
			margin: 0 auto;
			background: url(http://codegen.caihongy.cn/20250120/ca81b2b93c6d4bb39f029dc36bc8bffb.jpg);
			width: 101%;
			font-size: 15px;
			height: auto;
			order: 3;
			.select2-list {
				padding: 0 10px;
				margin: 0 0 0px;
				background: none;
				width: 100%;
				min-height: 80px;
				height: auto;
				.label {
					padding: 0 20px;
					color: #848c74;
					font-weight: 500;
					display: inline-block;
					font-size: inherit;
					line-height: 80px;
				}
				.item-body {
					display: inline-block;
					width: auto;
					flex-wrap: wrap;
					height: auto;
					.item {
						border-radius: 4px;
						padding: 0 5px;
						color: inherit;
						background: none;
						display: inline-block;
						font-size: inherit;
						line-height: 40px;
						text-align: center;
						min-width: 140px;
					}
					.item:hover {
						cursor: pointer;
						color: #fff;
						background: url(http://codegen.caihongy.cn/20250121/bada347fd063467b96c202c637e3b9c5.png) no-repeat center top / 100% 100%;
					}
					.item.active {
						cursor: pointer;
						color: #fff;
						background: url(http://codegen.caihongy.cn/20250121/bada347fd063467b96c202c637e3b9c5.png) no-repeat center top / 100% 100%;
						display: inline-block;
						min-width: 140px;
						text-align: center;
					}
				}
			}
		}
		.list {
			margin: 20px 0 0;
			overflow: hidden;
			background: none;
			flex: 1;
			width: calc(100% - 0px);
			clear: both;
			font-size: 15px;
			order: 8;
			.index-pv1 .animation-box {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				z-index: initial;
			}
				
			.index-pv1 .animation-box:hover {
				transform: rotate(0) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
				
			.index-pv1 .animation-box img {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
			}
			
			.index-pv1 .animation-box img:hover {
				transform: rotate(0) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list1 {
				border-radius: 0;
				padding: 10px 0;
				margin: 0 auto;
				background: #f4f4f4;
				display: flex;
				width: calc(100% - 0px);
				flex-wrap: wrap;
				height: auto;
				.list-item {
					cursor: pointer;
					padding: 16px;
					margin: 0 10px 20px;
					background: url(http://codegen.caihongy.cn/20250121/b156b01cfcca44bf946dddfaf058624f.png) no-repeat center top / 100% auto,url(http://codegen.caihongy.cn/20250121/d5c85b0b5e674a1a80c135643fdec074.png) no-repeat center bottom / 100% auto,url(http://codegen.caihongy.cn/20250121/359d51bfa7af4b7d956810d3b4239c10.png) repeat-y center center / 100% auto;
					display: inline-flex;
					width: 275px;
					position: relative;
					flex-wrap: wrap;
					height: auto;
					.image {
						border-radius: 6px;
						object-fit: cover;
						display: block;
						width: 100%;
						height: 200px;
					}
					.price {
						padding: 0 10px;
						color: #d90000;
						font-size: 16px;
						line-height: 30px;
						order: 12;
					}
					.name {
						padding: 0 10px;
						overflow: hidden;
						color: #333;
						white-space: nowrap;
						width: 100%;
						font-size: 14px;
						line-height: 30px;
						text-overflow: ellipsis;
					}
					.time_item {
						padding: 0 10px;
						order: 10;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.publisher_item {
						padding: 0 10px;
						display: inline-block;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.like_item {
						padding: 0 10px;
						display: inline-block;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.collect_item {
						padding: 0 10px;
						display: inline-block;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
					.view_item {
						padding: 0 10px;
						display: inline-block;
						.icon {
							margin: 0 2px 0 0;
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.label {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
						.text {
							color: #666;
							font-size: 12px;
							line-height: 1.5;
						}
					}
				}
			}
		}
	}
</style>
