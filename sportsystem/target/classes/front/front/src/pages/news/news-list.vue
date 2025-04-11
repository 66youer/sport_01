<template>
	<div>
		<div class="breadcrumb-preview">
			<el-breadcrumb :separator="''">
				<el-breadcrumb-item class="item1" to="/"><a>首页</a></el-breadcrumb-item>
				<el-breadcrumb-item class="item2" v-for="(item, index) in breadcrumbItem" :key="index"><a>{{item.name}}</a></el-breadcrumb-item>
			</el-breadcrumb>
		</div>
	
		<div class="news-preview-pv">
			<el-form :inline="true" :model="formSearch" class="list-form-pv">
				<el-form-item class="search-item">
					<el-input v-model="title" placeholder="标题"></el-input>
				</el-form-item>
				<el-button class="search-btn" type="primary" @click="getNewsList(1)">
					<span class="icon iconfont icon-chakan14"></span>
					搜索
				</el-button>
			</el-form>
			
			<!-- category -->
			<div class="category-list">
				<div class="item" @click="categoryClick(0)" :class="categoryIndex == 0 ? 'active' : ''">全部</div>
				<div v-for="(item,index) in categoryList" @click="categoryClick(index+1)" :key="index" class="item" :class="categoryIndex == index+1 ? 'active' : ''">{{item.typename}}</div>
			</div>
			<div v-if="newsList.length" class="list8 index-pv1">
				<div class="list-body-top">
					<div class="list-item1" @click="toNewsDetail(newsList[0])">
						<img :src="baseUrl + newsList[0].picture">
						<div class="infoBox">
							<div class="name">{{newsList[0].title}}</div>
							<div class="desc">{{newsList[0].introduction}}</div>
							<div class="time">{{newsList[0].addtime.split(' ')[0]}}</div>
						</div>
					</div>
					<div class="list-body-right" v-if="newsList.length > 1">
						<div class="list-item" v-for="item,index in newsList" v-if="index > 0 && index < 5" @click="toNewsDetail(item)">
							<div class="time_item">
								<div class="day">{{item.addtime.split(" ")[0].split("-")[2]}}</div>
								<div class="year">{{item.addtime.split(" ")[0].split("-")[0] + '-' + item.addtime.split(" ")[0].split("-")[1]}}</div>
							</div>
							<div class="infoBox">
								<div class="name">{{item.title}}</div>
								<div class="desc">{{item.introduction}}</div>
								<span class="icon iconfont icon-jiantou37"></span>
							</div>
						</div>
					</div>
				</div>
				<div class="list-body" v-if="newsList.length > 4">
					<div class="list-item" v-for="item,index in newsList" v-if="index > 4" @click="toNewsDetail(item)">
						<div class="name">{{item.title}}</div>
						<div class="time">{{item.addtime.split(" ")[0]}}</div>
					</div>
				</div>
			</div>
		
			<el-pagination
				background
				id="pagination" class="pagination"
				:pager-count="7"
				:page-size="pageSize"
				:page-sizes="pageSizes"
				prev-text="上一页"
				next-text="下一页"
				:hide-on-single-page="false"
				:layout='["total","prev","pager","next","sizes","jumper"].join()'
				:total="total"
				@current-change="curChange"
				@size-change="sizeChange"
				@prev-click="prevClick"
				@next-click="nextClick"
				></el-pagination>

			<!-- 热门信息 -->
			<div class="hot">
				<div class="hot-title">推荐信息</div>
				<div class="hot-list">
					<div class="hot-item" v-for="item in hotList" :key="item.id" @click="toNewsDetail(item)">
						<img :src="baseUrl + item.picture" alt="">
						<div class="hot-name">{{ item.title }}</div>
						<div class="hot-time">{{item.addtime}}</div>
					</div>
				</div>
			</div>
			<div class="idea1"></div>
		</div>
	</div>
</template>

<script>
	export default {
		//数据集合
		data() {
			return {
				baseUrl: this.$config.baseUrl,
				breadcrumbItem: [
				  {
					name: '体育资讯'
				  }
				],
				newsList: [],
				total: 1,
				pageSize: 10,
				pageSizes: [],
				totalPage: 1,
				layouts: '',
				title: '',
				categoryIndex: 0,
				categoryList: [],
				hotList: [],
			}
		},
		created() {
			this.getCategoryList()
			
			this.getHotList()
		},
		watch:{
			$route(newValue){
				this.getCategoryList()
			}
		},
		//方法集合
		methods: {
			getCategoryList(){
				this.$http.get('newstype/list', {}).then(res => {
					if (res.data.code == 0) {
						this.categoryList = res.data.data.list;
						if(this.$route.query.homeFenlei){
							for(let i=0;i<this.categoryList.length;i++) {
								if(this.$route.query.homeFenlei == this.categoryList[i].typename) {
									this.categoryIndex = i + 1;
									const currentRoute = this.$route;
									const routeWithoutQuery = { ...currentRoute };
									delete routeWithoutQuery.query;
									this.$router.replace(routeWithoutQuery)
									break;
								}
							}
						}
						this.getNewsList(1);
					}
				});
			},
			categoryClick(index) {
				this.categoryIndex = index
				this.getNewsList()
			},
			getNewsList(page) {
				let params = {page, limit: this.pageSize,sort:'addtime',order:'desc'};
				let searchWhere = {};
				if(this.title != '') searchWhere.title = '%' + this.title + '%';
				if(this.categoryIndex!=0){
					searchWhere.typename = this.categoryList[this.categoryIndex - 1].typename
				}
				this.$http.get('news/list', {params: Object.assign(params, searchWhere)}).then(res => {
					if (res.data.code == 0) {
						this.newsList = res.data.data.list;
						this.total = res.data.data.total;
						this.pageSize = Number(res.data.data.pageSize);
						this.totalPage = res.data.data.totalPage;
						if(this.pageSizes.length==0){
							this.pageSizes = [this.pageSize, this.pageSize*2, this.pageSize*3, this.pageSize*5];
						}
					}
				});
			},
			getHotList(){
				let params = {page:1, limit: 4,sort:'addtime',order:'desc'};
				this.$http.get('news/autoSort', {params: params}).then(res => {
					if (res.data.code == 0) {
						this.hotList = res.data.data.list;
					}
				});
			},
			curChange(page) {
				this.getNewsList(page);
			},
			sizeChange(size){
				this.pageSize = size
				this.getNewsList(1);
			},
			prevClick(page) {
				this.getNewsList(page);
			},
			nextClick(page) {
				this.getNewsList(page);
			},
			toNewsDetail(item) {
				this.$router.push({path: '/index/newsDetail', query: {id: item.id}});
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.news-preview-pv {
				margin: 0px auto;
				color: #333;
				background: none;
				display: flex;
				width: 1200px;
				font-size: 16px;
				justify-content: flex-start;
				align-items: flex-start;
				position: relative;
				flex-wrap: wrap;
				.list-form-pv {
						padding: 10px;
						margin: 0;
						background: none;
						display: flex;
						width: 101%;
						justify-content: center;
						align-items: center;
						flex-wrap: wrap;
						height: auto;
						order: 2;
						.search-item {
								margin: 0 0px;
								.el-input {
										width: 100%;
									}
				.el-input /deep/ .el-input__inner {
										border: 1px solid #ccc;
										border-radius: 4px;
										padding: 0 10px;
										margin: 0 10px 0 0;
										color: #333;
										background: #fff;
										width: auto;
										font-size: 16px;
										line-height: 42px;
										min-width: 350px;
										height: 42px;
									}
			}
			.search-btn {
								cursor: pointer;
								border: 0;
								border-radius: 4px;
								padding: 0px 20px;
								margin: 0 10px 0 0;
								color: #fff;
								background: #848c74;
								width: auto;
								font-size: inherit;
								line-height: 42px;
								height: 42px;
								.icon {
										margin: 0 3px 0 0;
										color: #fff;
										font-size: inherit;
									}
			}
		}
		.category-list {
						padding: 0;
						margin: 20px 0 0;
						background: none;
						display: flex;
						width: 101%;
						flex-wrap: wrap;
						height: auto;
						order: 1;
						.item {
								cursor: pointer;
								border: 0px solid #475a8350;
								padding: 0px 20px;
								margin: 0 20px 20px 0;
								color: #333;
								display: flex;
								font-size: 16px;
								flex-wrap: wrap;
								background: url(http://codegen.caihongy.cn/20250122/e32422cf86dc43259ca2219f0abd9398.png) no-repeat center top / 100% 100%;
								justify-content: center;
								align-items: center;
								min-width: 150px;
								height: 42px;
							}
			
			.item:hover {
								color: #fff;
								background: url(http://codegen.caihongy.cn/20250122/1d2b0f21e9da4f7a98c388fd00d6d0d3.png) no-repeat center top / 100% 100%;
							}
			
			.item.active {
								color: #fff;
								background: url(http://codegen.caihongy.cn/20250122/1d2b0f21e9da4f7a98c388fd00d6d0d3.png) no-repeat center top / 100% 100%;
							}
		}
		.list8 {
						border: 1px solid #333;
						padding: 20px;
						margin: 20px 0 0;
						background: #fff;
						width: 100%;
						height: auto;
						order: 5;
						.list-body-top {
								display: flex;
								width: 100%;
								height: auto;
								.list-item1 {
										cursor: pointer;
										width: 50%;
										position: relative;
										height: auto;
										img {
												object-fit: cover;
												display: block;
												width: 100%;
												height: 400px;
											}
					.infoBox {
												padding: 10px;
												z-index: 9;
												left: 0;
												bottom: 0;
												background: #848c74;
												width: 100%;
												position: absolute;
												.name {
														color: #fff;
														font-size: 16px;
														line-height: 40px;
													}
						.desc {
														color: #fff;
														font-size: 14px;
														line-height: 1.5;
													}
						.time {
														margin: 5px 0 0;
														color: #fff;
														font-size: 14px;
														line-height: 1.5;
													}
					}
				}
				.list-body-right {
										padding: 0 0 0 20px;
										width: 50%;
										height: auto;
										.list-item {
												cursor: pointer;
												padding: 5px 0;
												display: flex;
												width: 100%;
												justify-content: center;
												align-items: center;
												height: 100px;
												.time_item {
														border: 1px solid #848c74;
														padding: 10px 0;
														margin: 0 0px 0 0;
														flex-direction: column;
														display: flex;
														width: 80px;
														justify-content: center;
														align-items: center;
														height: 100%;
														.day {
																color: #333;
																font-size: 20px;
																line-height: 1.5;
															}
							.year {
																color: #333;
																font-size: 14px;
																line-height: 1.5;
															}
						}
						.infoBox {
														padding: 0 10px;
														flex: 1;
														border-color: #848c74;
														border-width: 1px 1px 1px 0;
														border-style: solid;
														height: 100%;
														.name {
																overflow: hidden;
																color: #333;
																white-space: nowrap;
																font-weight: 600;
																width: 100%;
																font-size: 16px;
																line-height: 30px;
																text-overflow: ellipsis;
															}
							.desc {
																overflow: hidden;
																color: #666;
																font-size: 14px;
																line-height: 24px;
																height: 48px;
															}
							.icon {
																color: #999;
																display: none;
																font-size: 14px;
																line-height: 20px;
																float: right;
															}
						}
					}
				}
			}
			.list-body {
								margin: 20px 0 0 0;
								width: 100%;
								height: auto;
								.list-item {
										cursor: pointer;
										padding: 5px 10px;
										margin: 0 0 10px;
										display: flex;
										width: 100%;
										border-color: #848c7480;
										border-width: 1px;
										justify-content: space-between;
										border-style: solid;
										.name {
												color: #333;
												font-size: 16px;
												line-height: 40px;
											}
					.time {
												color: #999;
												font-size: 14px;
												line-height: 40px;
											}
				}
			}
		}
		.hot {
						margin: 40px 0 0;
						overflow: hidden;
						background: none;
						width: 101%;
						clear: both;
						height: auto;
						order: 100;
						.hot-title {
								padding: 0 0 0 110px;
								margin: 0;
								color: #000;
								background: url(http://codegen.caihongy.cn/20250122/b447b24b79d943db9940fa5642860503.png) no-repeat left center /1200px 100%;
								font-weight: 600;
								width: 100%;
								font-size: 28px;
								line-height: 80px;
								position: relative;
								text-align: left;
								height: 108px;
							}
			.hot-list {
								padding: 20px;
								margin: 0;
								background: none;
								display: flex;
								width: 100%;
								justify-content: space-between;
								flex-wrap: wrap;
								height: auto;
								.hot-item {
										cursor: pointer;
										border: 0px solid #e2e1e1;
										border-radius: 0px;
										padding: 20px 20px;
										margin: 0 0 20px;
										background: url(http://codegen.caihongy.cn/20250122/99444fab2dc74670ade0cb426a839e54.png) no-repeat center / 100% 100%;
										width: calc(25% - 20px);
										text-align: center;
										height: auto;
										img {
												border-radius: 100px;
												margin: 0 auto;
												object-fit: cover;
												display: block;
												width: 100px;
												float: left;
												height: 100px;
											}
					.hot-name {
												padding: 0px 10px;
												overflow: hidden;
												color: #333;
												white-space: nowrap;
												width: calc(100% - 110px);
												font-size: 15px;
												line-height: 40px;
												text-overflow: ellipsis;
												float: right;
												text-align: left;
											}
					.hot-time {
												padding: 0 10px;
												color: #999;
												display: inline-block;
												width: calc(100% - 110px);
												font-size: 14px;
												line-height: 24px;
												float: right;
												text-align: left;
											}
				}
			}
		}
		.idea1 {
						background: #f6f6f6;
						width: 101%;
						height: 1px;
						order: 10;
					}
	}
	
	.index-pv1 .animation-box {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
		z-index: initial;
	}
	
	.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
	}
	
	.index-pv1 .animation-box img {
		transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
	}
	
	.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(0.98) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
</style>
