<template>
	<div class="home-preview">




		<!-- 新闻资讯 -->
		<div id="animate_newsnews" class="news animate__animated">
			<div class="news_title_box">
				<span class="news_title">体育资讯</span>
				<span class="news_subhead">{{'news'.toUpperCase()}}</span>
			</div>
			<div class="list list24 index-pv1">
				<div class="list-item">
					<img :src="baseUrl + newsList[0].picture" />
					<div class="infoBox">
						<div class="name">{{newsList[0].title}}<div class="line"></div></div>
						<div class="desc">{{newsList[0].introduction}}</div>
						<div class="more_btn" @click="toDetail('newsDetail', newsList[0])">
							<span class="icon iconfont icon-jiantou18"></span>
						</div>
					</div>
				</div>
				<div class="rightView">
					<div class="topView">
						<div class="list-item1">
							<img :src="baseUrl + newsList[1].picture" />
							<div class="infoBox">
								<div class="name">{{newsList[1].title}}<div class="line"></div></div>
								<div class="desc">{{newsList[1].introduction}}</div>
								<div class="more_btn" @click="toDetail('newsDetail', newsList[1])">
									<span class="icon iconfont icon-jiantou18"></span>
								</div>
							</div>
						</div>
						<div class="list-item2">
							<img :src="baseUrl + newsList[2].picture" />
							<div class="infoBox">
								<div class="name">{{newsList[2].title}}<div class="line"></div></div>
								<div class="desc">{{newsList[2].introduction}}</div>
								<div class="more_btn" @click="toDetail('newsDetail', newsList[2])">
									<span class="icon iconfont icon-jiantou18"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="bottomView">
						<div class="list-item1">
							<img :src="baseUrl + newsList[3].picture" />
							<div class="infoBox">
								<div class="name">{{newsList[3].title}}<div class="line"></div></div>
								<div class="desc">{{newsList[3].introduction}}</div>
								<div class="more_btn" @click="toDetail('newsDetail', newsList[3])">
									<span class="icon iconfont icon-jiantou18"></span>
								</div>
							</div>
						</div>
						<div class="list-item2">
							<img :src="baseUrl + newsList[4].picture" />
							<div class="infoBox">
								<div class="name">{{newsList[4].title}}<div class="line"></div></div>
								<div class="desc">{{newsList[4].introduction}}</div>
								<div class="more_btn" @click="toDetail('newsDetail', newsList[4])">
									<span class="icon iconfont icon-jiantou18"></span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('news')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 新闻资讯 -->
		<!-- 商品推荐 -->
		<div id="animate_recommendbisaixinxi" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">比赛信息推荐</span>
				<span class="recommend_subhead">{{'bisaixinxi'.toUpperCase()}} RECOMMEND</span>
			</div>
			<div class="list list18 index-pv1">
				<div class="list-body" v-if="bisaixinxiRecommend.length">
					<div class="list-body-left">
						<div class="list-item1" @click="toDetail('bisaixinxiDetail', bisaixinxiRecommend[0])">
							<div class="infoBox">
								<div class="name">比赛名称:{{bisaixinxiRecommend[0].bisaimingcheng}}</div>
								<div class="name">比赛类型:{{bisaixinxiRecommend[0].bisaileixing}}</div>
								<div class="name">{{bisaixinxiRecommend[0].bisairiqi}}</div>
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{bisaixinxiRecommend[0].addtime.split(' ')[0]}}</span>
								</div>
								<div class="like_item">
									<span class="icon iconfont icon-zan10"></span>
									<span class="label">点赞：</span>
									<span class="text">{{bisaixinxiRecommend[0].thumbsupnum}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{bisaixinxiRecommend[0].storeupnum}}</span>
								</div>
							</div>
							<div class="img">
								<img v-if="preHttp(bisaixinxiRecommend[0].xuanchuantupian)&&preHttp2(bisaixinxiRecommend[0].xuanchuantupian)" :src="bisaixinxiRecommend[0].xuanchuantupian" alt="" />
								<img v-else-if="preHttp(bisaixinxiRecommend[0].xuanchuantupian)" :src="bisaixinxiRecommend[0].xuanchuantupian.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (bisaixinxiRecommend[0].xuanchuantupian?bisaixinxiRecommend[0].xuanchuantupian.split(',')[0]:'')" alt="" />
							</div>
						</div>
						<div class="list-item2" @click="toDetail('bisaixinxiDetail', bisaixinxiRecommend[1])">
							<div class="img">
								<img v-if="preHttp(bisaixinxiRecommend[1].xuanchuantupian)&&preHttp2(bisaixinxiRecommend[1].xuanchuantupian)" :src="bisaixinxiRecommend[1].xuanchuantupian" alt="" />
								<img v-else-if="preHttp(bisaixinxiRecommend[1].xuanchuantupian)" :src="bisaixinxiRecommend[1].xuanchuantupian.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (bisaixinxiRecommend[1].xuanchuantupian?bisaixinxiRecommend[1].xuanchuantupian.split(',')[0]:'')" alt="" />
							</div>
							<div class="infoBox">
								<div class="name">比赛名称:{{bisaixinxiRecommend[1].bisaimingcheng}}</div>
								<div class="name">比赛类型:{{bisaixinxiRecommend[1].bisaileixing}}</div>
								<div class="name">{{bisaixinxiRecommend[1].bisairiqi}}</div>
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{bisaixinxiRecommend[1].addtime.split(' ')[0]}}</span>
								</div>
								<div class="like_item">
									<span class="icon iconfont icon-zan10"></span>
									<span class="label">点赞：</span>
									<span class="text">{{bisaixinxiRecommend[1].thumbsupnum}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{bisaixinxiRecommend[1].storeupnum}}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="list-body-right">
						<div class="swiper-container recommendSwiper18 recommend-list-18bisaixinxi">
							<div class="swiper-wrapper">
								<div class="swiper-slide" v-for="(item,index) in bisaixinxiRecommend" :key="index" v-if="index>2">
									<div class="list-item" @click="toDetail('bisaixinxiDetail', item)">
										<div class="img">
											<img v-if="preHttp(item.xuanchuantupian)&&preHttp2(item.xuanchuantupian)" :src="item.xuanchuantupian" alt="" />
											<img v-else-if="preHttp(item.xuanchuantupian)" :src="item.xuanchuantupian.split(',')[0]" alt="" />
											<img v-else :src="baseUrl + (item.xuanchuantupian?item.xuanchuantupian.split(',')[0]:'')" alt="" />
										</div>
										<div class="infoBox">
											<div class="name">比赛名称:{{item.bisaimingcheng}}</div>
											<div class="name">比赛类型:{{item.bisaileixing}}</div>
											<div class="name">{{item.bisairiqi}}</div>
											<div class="time_item">
												<span class="icon iconfont icon-shijian21"></span>
												<span class="label">发布时间：</span>
												<span class="text">{{item.addtime.split(' ')[0]}}</span>
											</div>
											<div class="like_item">
												<span class="icon iconfont icon-zan10"></span>
												<span class="label">点赞：</span>
												<span class="text">{{item.thumbsupnum}}</span>
											</div>
											<div class="collect_item">
												<span class="icon iconfont icon-shoucang10"></span>
												<span class="label">收藏：</span>
												<span class="text">{{item.storeupnum}}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('bisaixinxi')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 商品推荐 -->
		<!-- 商品推荐 -->
		<div id="animate_recommendbisaijilu" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">比赛记录推荐</span>
				<span class="recommend_subhead">{{'bisaijilu'.toUpperCase()}} RECOMMEND</span>
			</div>
			<div class="list list18 index-pv1">
				<div class="list-body" v-if="bisaijiluRecommend.length">
					<div class="list-body-left">
						<div class="list-item1" @click="toDetail('bisaijiluDetail', bisaijiluRecommend[0])">
							<div class="infoBox">
								<div class="name">比赛类型:{{bisaijiluRecommend[0].bisaileixing}}</div>
								<div class="name">{{bisaijiluRecommend[0].bisairiqi}}</div>
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{bisaijiluRecommend[0].addtime.split(' ')[0]}}</span>
								</div>
								<div class="publisher_item">
									<span class="icon iconfont icon-touxiang18"></span>
									<span class="label">发布人：</span>
									<span class="text">{{bisaijiluRecommend[0].zhanghao}}</span>
								</div>
								<div class="like_item">
									<span class="icon iconfont icon-zan10"></span>
									<span class="label">点赞：</span>
									<span class="text">{{bisaijiluRecommend[0].thumbsupnum}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{bisaijiluRecommend[0].storeupnum}}</span>
								</div>
							</div>
							<div class="img">
								<img v-if="preHttp(bisaijiluRecommend[0].bisaitupian)&&preHttp2(bisaijiluRecommend[0].bisaitupian)" :src="bisaijiluRecommend[0].bisaitupian" alt="" />
								<img v-else-if="preHttp(bisaijiluRecommend[0].bisaitupian)" :src="bisaijiluRecommend[0].bisaitupian.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (bisaijiluRecommend[0].bisaitupian?bisaijiluRecommend[0].bisaitupian.split(',')[0]:'')" alt="" />
							</div>
						</div>
						<div class="list-item2" @click="toDetail('bisaijiluDetail', bisaijiluRecommend[1])">
							<div class="img">
								<img v-if="preHttp(bisaijiluRecommend[1].bisaitupian)&&preHttp2(bisaijiluRecommend[1].bisaitupian)" :src="bisaijiluRecommend[1].bisaitupian" alt="" />
								<img v-else-if="preHttp(bisaijiluRecommend[1].bisaitupian)" :src="bisaijiluRecommend[1].bisaitupian.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (bisaijiluRecommend[1].bisaitupian?bisaijiluRecommend[1].bisaitupian.split(',')[0]:'')" alt="" />
							</div>
							<div class="infoBox">
								<div class="name">比赛类型:{{bisaijiluRecommend[1].bisaileixing}}</div>
								<div class="name">{{bisaijiluRecommend[1].bisairiqi}}</div>
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{bisaijiluRecommend[1].addtime.split(' ')[0]}}</span>
								</div>
								<div class="publisher_item">
									<span class="icon iconfont icon-touxiang18"></span>
									<span class="label">发布人：</span>
									<span class="text">{{bisaijiluRecommend[1].zhanghao}}</span>
								</div>
								<div class="like_item">
									<span class="icon iconfont icon-zan10"></span>
									<span class="label">点赞：</span>
									<span class="text">{{bisaijiluRecommend[1].thumbsupnum}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{bisaijiluRecommend[1].storeupnum}}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="list-body-right">
						<div class="swiper-container recommendSwiper18 recommend-list-18bisaijilu">
							<div class="swiper-wrapper">
								<div class="swiper-slide" v-for="(item,index) in bisaijiluRecommend" :key="index" v-if="index>2">
									<div class="list-item" @click="toDetail('bisaijiluDetail', item)">
										<div class="img">
											<img v-if="preHttp(item.bisaitupian)&&preHttp2(item.bisaitupian)" :src="item.bisaitupian" alt="" />
											<img v-else-if="preHttp(item.bisaitupian)" :src="item.bisaitupian.split(',')[0]" alt="" />
											<img v-else :src="baseUrl + (item.bisaitupian?item.bisaitupian.split(',')[0]:'')" alt="" />
										</div>
										<div class="infoBox">
											<div class="name">比赛类型:{{item.bisaileixing}}</div>
											<div class="name">{{item.bisairiqi}}</div>
											<div class="time_item">
												<span class="icon iconfont icon-shijian21"></span>
												<span class="label">发布时间：</span>
												<span class="text">{{item.addtime.split(' ')[0]}}</span>
											</div>
											<div class="publisher_item">
												<span class="icon iconfont icon-touxiang18"></span>
												<span class="label">发布人：</span>
												<span class="text">{{item.zhanghao}}</span>
											</div>
											<div class="like_item">
												<span class="icon iconfont icon-zan10"></span>
												<span class="label">点赞：</span>
												<span class="text">{{item.thumbsupnum}}</span>
											</div>
											<div class="collect_item">
												<span class="icon iconfont icon-shoucang10"></span>
												<span class="label">收藏：</span>
												<span class="text">{{item.storeupnum}}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('bisaijilu')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 商品推荐 -->
		<!-- 商品推荐 -->
		<div id="animate_recommendyundongshangpin" class="recommend animate__animated">
			<div class="recommend_title_box">
				<span class="recommend_title">运动商品推荐</span>
				<span class="recommend_subhead">{{'yundongshangpin'.toUpperCase()}} RECOMMEND</span>
			</div>
			<div class="list list18 index-pv1">
				<div class="tab_view">
					<div class="tab" :class="recommendIndex18yundongshangpin == 0 ? 'tabActive' : ''" @click="recommendIndexClick18(0, 'yundongshangpin')">
						全部
					</div>
					<template v-for="(item,index) in recommendList18yundongshangpin">
						<div v-if="index < 6" class="tab" :class="recommendIndex18yundongshangpin == index + 1 ? 'tabActive' : ''" @click="recommendIndexClick18(index + 1, 'yundongshangpin')">
							{{item[recommendColumn18yundongshangpin]}}
						</div>
					</template>
				</div>
				<div class="list-body" v-if="yundongshangpinRecommend.length">
					<div class="list-body-left">
						<div class="list-item1" @click="toDetail('yundongshangpinDetail', yundongshangpinRecommend[0])">
							<div class="infoBox">
								<div class="name">{{yundongshangpinRecommend[0].shangpinmingcheng}}</div>
								<div class="name">{{yundongshangpinRecommend[0].shangpinfenlei}}</div>
								<div class="name">品牌:{{yundongshangpinRecommend[0].pinpai}}</div>
								<div class="price">￥{{yundongshangpinRecommend[0].price}}</div>
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{yundongshangpinRecommend[0].addtime.split(' ')[0]}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{yundongshangpinRecommend[0].storeupnum}}</span>
								</div>
								<div class="view_item">
									<span class="icon iconfont icon-liulan04"></span>
									<span class="label">浏览次数：</span>
									<span class="text">{{yundongshangpinRecommend[0].clicknum}}</span>
								</div>
							</div>
							<div class="img">
								<img v-if="preHttp(yundongshangpinRecommend[0].fengmian)&&preHttp2(yundongshangpinRecommend[0].fengmian)" :src="yundongshangpinRecommend[0].fengmian" alt="" />
								<img v-else-if="preHttp(yundongshangpinRecommend[0].fengmian)" :src="yundongshangpinRecommend[0].fengmian.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (yundongshangpinRecommend[0].fengmian?yundongshangpinRecommend[0].fengmian.split(',')[0]:'')" alt="" />
							</div>
						</div>
						<div class="list-item2" @click="toDetail('yundongshangpinDetail', yundongshangpinRecommend[1])">
							<div class="img">
								<img v-if="preHttp(yundongshangpinRecommend[1].fengmian)&&preHttp2(yundongshangpinRecommend[1].fengmian)" :src="yundongshangpinRecommend[1].fengmian" alt="" />
								<img v-else-if="preHttp(yundongshangpinRecommend[1].fengmian)" :src="yundongshangpinRecommend[1].fengmian.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (yundongshangpinRecommend[1].fengmian?yundongshangpinRecommend[1].fengmian.split(',')[0]:'')" alt="" />
							</div>
							<div class="infoBox">
								<div class="name">{{yundongshangpinRecommend[1].shangpinmingcheng}}</div>
								<div class="name">{{yundongshangpinRecommend[1].shangpinfenlei}}</div>
								<div class="name">品牌:{{yundongshangpinRecommend[1].pinpai}}</div>
								<div class="price">￥{{yundongshangpinRecommend[1].price}}</div>
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{yundongshangpinRecommend[1].addtime.split(' ')[0]}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{yundongshangpinRecommend[1].storeupnum}}</span>
								</div>
								<div class="view_item">
									<span class="icon iconfont icon-liulan04"></span>
									<span class="label">浏览次数：</span>
									<span class="text">{{yundongshangpinRecommend[1].clicknum}}</span>
								</div>
							</div>
						</div>
					</div>
					<div class="list-body-right">
						<div class="swiper-container recommendSwiper18 recommend-list-18yundongshangpin">
							<div class="swiper-wrapper">
								<div class="swiper-slide" v-for="(item,index) in yundongshangpinRecommend" :key="index" v-if="index>2">
									<div class="list-item" @click="toDetail('yundongshangpinDetail', item)">
										<div class="img">
											<img v-if="preHttp(item.fengmian)&&preHttp2(item.fengmian)" :src="item.fengmian" alt="" />
											<img v-else-if="preHttp(item.fengmian)" :src="item.fengmian.split(',')[0]" alt="" />
											<img v-else :src="baseUrl + (item.fengmian?item.fengmian.split(',')[0]:'')" alt="" />
										</div>
										<div class="infoBox">
											<div class="name">{{item.shangpinmingcheng}}</div>
											<div class="name">{{item.shangpinfenlei}}</div>
											<div class="name">品牌:{{item.pinpai}}</div>
											<div class="price">￥{{item.price}}</div>
											<div class="time_item">
												<span class="icon iconfont icon-shijian21"></span>
												<span class="label">发布时间：</span>
												<span class="text">{{item.addtime.split(' ')[0]}}</span>
											</div>
											<div class="collect_item">
												<span class="icon iconfont icon-shoucang10"></span>
												<span class="label">收藏：</span>
												<span class="text">{{item.storeupnum}}</span>
											</div>
											<div class="view_item">
												<span class="icon iconfont icon-liulan04"></span>
												<span class="label">浏览次数：</span>
												<span class="text">{{item.clicknum}}</span>
											</div>
										</div>
									</div>
								</div>
							</div>
							<div class="swiper-button-prev"></div>
							<div class="swiper-button-next"></div>
							<div class="swiper-pagination"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('yundongshangpin')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
		</div>
		<!-- 商品推荐 -->
		<!-- 特价商品 -->
		<div id="animate_listyundongyuan" class="lists animate__animated">
			<div class="list_title_box">
				<span class="list_title">运动员展示</span>
				<span class="list_subhead">{{'yundongyuan'.toUpperCase()}} SHOW</span>
			</div>
			<div class="list list23 index-pv1">
				<div class="list-body">
					<div class="list-body-top" v-if="yundongyuanList.length>0">
						<div class="img">
							<img v-if="preHttp(yundongyuanList[0].touxiang)" :src="yundongyuanList[0].touxiang.split(',')[0]" alt="" />
							<img v-else :src="baseUrl + (yundongyuanList[0].touxiang?yundongyuanList[0].touxiang.split(',')[0]:'')" alt="" />
						</div>
						<div class="infoBox">
							<div class="name">{{yundongyuanList[0].xingming}}</div>
							<div class="centerInfo">
								<div class="time_item">
									<span class="icon iconfont icon-shijian21"></span>
									<span class="label">发布时间：</span>
									<span class="text">{{yundongyuanList[0].addtime.split(' ')[0]}}</span>
								</div>
								<div class="collect_item">
									<span class="icon iconfont icon-shoucang10"></span>
									<span class="label">收藏：</span>
									<span class="text">{{yundongyuanList[0].storeupnum}}</span>
								</div>
							</div>
							<div class="bottomInfo">
								<div class="more_btn" @click="toDetail('yundongyuanDetail', yundongyuanList[0])">
									<span class="text">查看更多</span>
									<span class="icon iconfont icon-gengduo1"></span>
								</div>
							</div>
						</div>
					</div>
					<div class="list-body-bottom" v-if="yundongyuanList.length>1">
						<div v-if="index>0&&index< Number(7)" class="list-item" v-for="(item,index) in yundongyuanList" :key="index" @click="toDetail('yundongyuanDetail', item)">
							<div class="img">
								<img v-if="preHttp(item.touxiang)" :src="item.touxiang.split(',')[0]" alt="" />
								<img v-else :src="baseUrl + (item.touxiang?item.touxiang.split(',')[0]:'')" alt="" />
							</div>
							<div class="infoBox">
								<div class="name">{{item.xingming}}</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<div class="moreBtn" @click="moreBtn('yundongyuan')">
				<span class="text">查看更多</span>
				<i class="icon iconfont icon-gengduo1"></i>
			</div>
	

		</div>
		<!-- 特价商品 -->
	</div>
</template>

<script>
import 'animate.css'
import Swiper from "swiper";

	export default {
		//数据集合
		data() {
			return {
				baseUrl: '',
				newsList: [],
				bisaixinxiRecommend: [],
				bisaijiluRecommend: [],
				yundongshangpinRecommend: [],

				yundongyuanList: [],


				recommendListSwiper18bisaixinxi: null,
				recommendIndex18bisaixinxi: 0,
				recommendList18bisaixinxi: [],
				recommendColumn18bisaixinxi: '',
				recommendListSwiper18bisaijilu: null,
				recommendIndex18bisaijilu: 0,
				recommendList18bisaijilu: [],
				recommendColumn18bisaijilu: '',
				recommendListSwiper18yundongshangpin: null,
				recommendIndex18yundongshangpin: 0,
				recommendList18yundongshangpin: [],
				recommendColumn18yundongshangpin: '',


			}
		},
		created() {
			this.baseUrl = this.$config.baseUrl;
			this.getNewsList();
			this.getList();
			this.bisaixinxiRecommendCate()
			this.bisaijiluRecommendCate()
			this.yundongshangpinRecommendCate()
		},
		mounted() {
			window.addEventListener('scroll', this.handleScroll)
			setTimeout(()=>{
				this.handleScroll()
			},100)
			
			this.swiperChanges()
		},
		beforeDestroy() {
			window.removeEventListener('scroll', this.handleScroll)
		},
		//方法集合
		methods: {
			swiperChanges() {
				if (this['recommendListSwiper18bisaixinxi']) this['recommendListSwiper18bisaixinxi'].destroy()
				if (this['recommendListSwiper18bisaijilu']) this['recommendListSwiper18bisaijilu'].destroy()
				if (this['recommendListSwiper18yundongshangpin']) this['recommendListSwiper18yundongshangpin'].destroy()
				setTimeout(()=>{
					this['recommendListSwiper18bisaixinxi'] = new Swiper(".recommend-list-18bisaixinxi", {"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"pagination":{"el":".swiper-pagination","clickable":true},"loop":true,"coverflowEffect":{"rotate":10,"stretch":10,"depth":60,"modifier":3,"slideShadows":false},"centeredSlides":true,"slidesPerView":1,"spaceBetween":0,"autoplay":{"delay":6000,"disableOnInteraction":false}})
					this['recommendListSwiper18bisaijilu'] = new Swiper(".recommend-list-18bisaijilu", {"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"pagination":{"el":".swiper-pagination","clickable":true},"loop":true,"coverflowEffect":{"rotate":10,"stretch":10,"depth":60,"modifier":3,"slideShadows":false},"centeredSlides":true,"slidesPerView":1,"spaceBetween":0,"autoplay":{"delay":6000,"disableOnInteraction":false}})
					this['recommendListSwiper18yundongshangpin'] = new Swiper(".recommend-list-18yundongshangpin", {"navigation":{"nextEl":".swiper-button-next","prevEl":".swiper-button-prev"},"pagination":{"el":".swiper-pagination","clickable":true},"loop":true,"coverflowEffect":{"rotate":10,"stretch":10,"depth":60,"modifier":3,"slideShadows":false},"centeredSlides":true,"slidesPerView":1,"spaceBetween":0,"autoplay":{"delay":6000,"disableOnInteraction":false}})
				},750)
			},
			bisaixinxiRecommendCate(){
				this.$http.get('bisaileixing/list',{
					params: {
						limit: Number(6)
					}
				}).then(res => {
					if (res.data.code == 0) {
						this.recommendList18bisaixinxi = res.data.data.list
					}
				});
				this.recommendColumn18bisaixinxi = 'bisaileixing'
			},
			bisaijiluRecommendCate(){
				this.$http.get('bisaileixing/list',{
					params: {
						limit: Number(6)
					}
				}).then(res => {
					if (res.data.code == 0) {
						this.recommendList18bisaijilu = res.data.data.list
					}
				});
				this.recommendColumn18bisaijilu = 'bisaileixing'
			},
			yundongshangpinRecommendCate(){
				this.$http.get('shangpinfenlei/list',{
					params: {
						limit: Number(6)
					}
				}).then(res => {
					if (res.data.code == 0) {
						this.recommendList18yundongshangpin = res.data.data.list
					}
				});
				this.recommendColumn18yundongshangpin = 'shangpinfenlei'
			},
			async recommendIndexClick18(index, name) {
				this['recommendIndex18' + name] = index
				await this.getList()
			},

			listIndexClick23(index, name) {
				this['listIndex23' + name] = index
				this.getList()
			},

			handleScroll() {
				let arr = [
					{id:'about',css:'animate__'},
					{id:'system',css:'animate__'},
					{id:'animate_listyundongyuan',css:'animate__'},
					{id:'animate_recommendbisaixinxi',css:'animate__'},
					{id:'animate_recommendbisaijilu',css:'animate__'},
					{id:'animate_recommendyundongshangpin',css:'animate__'},
					{id:'animate_newsnews',css:'animate__'},
				]
			
				for (let i in arr) {
					let doc = document.getElementById(arr[i].id)
					if (doc) {
						let top = doc.offsetTop
						let win_top = window.innerHeight + window.pageYOffset
						// console.log(top,win_top)
						if (win_top > top && doc.classList.value.indexOf(arr[i].css) < 0) {
							// console.log(doc)
							doc.classList.add(arr[i].css)
						}
					}
				}
			},
			preHttp(str) {
				return str && str.substr(0,4)=='http';
			},
			preHttp2(str) {
				return str && str.split(',w').length>1;
			},
			getNewsList() {
				let data = {
					page: 1,
					limit: 5,
					sort: 'addtime',
					order: 'desc'
				}
				this.$http.get('news/list', {params: data}).then(res => {
					if (res.data.code == 0) {
						this.newsList = res.data.data.list;
					
					}
				});
			},
			getList() {
				let autoSortUrl = "";
				let data = {}
				autoSortUrl = "bisaixinxi/autoSort";
				if(localStorage.getItem('frontToken')) {
					autoSortUrl = "bisaixinxi/autoSort2";
				}
				data = {
					page: 1,
					limit: 8,
				}
				if(this.recommendIndex18bisaixinxi != 0){
					data.bisaileixing = this.recommendList18bisaixinxi[this.recommendIndex18bisaixinxi - 1].bisaileixing
				}
				this.$http.get(autoSortUrl, {params: data}).then(res => {
					if (res.data.code == 0) {
						this.bisaixinxiRecommend = res.data.data.list;
					}
				});
				autoSortUrl = "bisaijilu/autoSort";
				if(localStorage.getItem('frontToken')) {
					autoSortUrl = "bisaijilu/autoSort2";
				}
				data = {
					page: 1,
					limit: 8,
				}
				if(this.recommendIndex18bisaijilu != 0){
					data.bisaileixing = this.recommendList18bisaijilu[this.recommendIndex18bisaijilu - 1].bisaileixing
				}
				this.$http.get(autoSortUrl, {params: data}).then(res => {
					if (res.data.code == 0) {
						this.bisaijiluRecommend = res.data.data.list;
					}
				});
				autoSortUrl = "yundongshangpin/autoSort";
				data = {
					page: 1,
					limit: 8,
					onshelves: 1,
				}
				if(this.recommendIndex18yundongshangpin != 0){
					data.shangpinfenlei = this.recommendList18yundongshangpin[this.recommendIndex18yundongshangpin - 1].shangpinfenlei
				}
				this.$http.get(autoSortUrl, {params: data}).then(res => {
					if (res.data.code == 0) {
						this.yundongshangpinRecommend = res.data.data.list;
					}
				});
			
				data = {
					page: 1,
					limit: 4,
				}

				this.$http.get('yundongyuan/list', {params: data}).then(res => {
					if (res.data.code == 0) {
						this.yundongyuanList = res.data.data.list;
					}
				});
			},
			toDetail(path, item) {
				this.$router.push({path: '/index/' + path, query: {id: item.id}});
			},
			moreBtn(path) {
				this.$router.push({path: '/index/' + path});
			}
		}
	}
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.home-preview {
		margin: 0px auto;
		flex-direction: column;
		background: none;
		display: flex;
		width: 100%;
		.news {
			padding: 0;
			margin: 0;
			background: url(http://codegen.caihongy.cn/20250114/8e7f511887714d26abfe4910f1feee65.jpg) no-repeat center top / cover;
			width: 100%;
			position: relative;
			order: 3;
			.news_title_box {
				padding: 0 calc((100% - 1200px)/2);
				margin: 20px 0 0;
				background: url(http://codegen.caihongy.cn/20250112/99761fb2e0a740c488bc04759c62d038.png) no-repeat center top;
				width: 100%;
				position: relative;
				text-align: left;
				.news_title {
					margin: 0 0 0 10px;
					color: #000;
					background: none;
					font-weight: 600;
					display: inline-block;
					width: 100%;
					font-size: 28px;
					line-height: 80px;
					text-align: left;
					height: 108px;
				}
				.news_subhead {
					margin: 0;
					color: #999;
					display: none;
					width: 100%;
					font-size: 18px;
					line-height: 40px;
					text-align: center;
				}
			}
			.index-pv1 .animation-box:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
				z-index: 1;
			}
			.index-pv1 .animation-box img:hover {
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list24 {
				margin: 40px auto;
				overflow: hidden;
				display: flex;
				width: 1200px;
				.list-item {
					cursor: pointer;
					margin: 0 20px 0 0;
					width: calc(36% - 20px);
					position: relative;
					height: 675px;
					img {
						object-fit: cover;
						width: 100%;
						height: 100%;
					}
					.infoBox {
						padding: 40px 20px;
						z-index: 20;
						top: 0;
						left: 0;
						background: rgba(0,0,0,0.5);
						width: 100%;
						position: absolute;
						opacity: 0;
						transition: 0.4s all;
						text-align: left;
						height: 100%;
						.name {
							margin: 0 0 0.9em;
							overflow: hidden;
							color: #fff;
							white-space: nowrap;
							font-weight: normal;
							width: 100%;
							font-size: 16px;
							line-height: 60px;
							position: relative;
							text-overflow: ellipsis;
							text-align: center;
							.line {
								left: 0;
								bottom: 0;
								background: url(http://codegen.caihongy.cn/20250116/595b0344958b425d88b2e644f6dd4ac9.png) no-repeat center top / 100% 100%;
								display: block;
								width: 100%;
								position: absolute;
								height: 4px;
							}
						}
						.desc {
							margin: 0 0 1.7em;
							overflow: hidden;
							color: #fff;
							font-size: 14px;
							line-height: 1.7em;
							height: 6.8em;
						}
						.more_btn {
							border: 1px solid #fff;
							cursor: pointer;
							border-radius: 50%;
							display: none;
							width: 30px;
							justify-content: center;
							align-items: center;
							height: 30px;
							.icon {
								color: #fff;
								font-size: 14px;
							}
						}
					}
				}
				.list-item:hover {
					.infoBox {
						opacity: 1;
					}
				}
				.rightView {
					width: 64%;
					position: relative;
					height: 100%;
					.topView {
						overflow: hidden;
						display: flex;
						width: 100%;
						height: 325px;
						.list-item1 {
							cursor: pointer;
							margin: 0 20px 0 0;
							width: calc(59% - 20px);
							position: relative;
							height: 100%;
							img {
								object-fit: cover;
								width: 100%;
								height: 100%;
							}
							.infoBox {
								padding: 20px 20px;
								z-index: 20;
								top: 0;
								left: 0;
								background: rgba(0,0,0,0.5);
								width: 100%;
								position: absolute;
								opacity: 0;
								transition: 0.4s all;
								text-align: left;
								height: 100%;
								.name {
									margin: 0 0 0.9em;
									overflow: hidden;
									color: #fff;
									white-space: nowrap;
									font-weight: normal;
									width: 100%;
									font-size: 16px;
									line-height: 60px;
									position: relative;
									text-overflow: ellipsis;
									text-align: center;
									.line {
										left: 0;
										bottom: 0;
										background: url(http://codegen.caihongy.cn/20250116/595b0344958b425d88b2e644f6dd4ac9.png) no-repeat center top / 100% 100%;
										display: block;
										width: 100%;
										position: absolute;
										height: 4px;
									}
								}
								.desc {
									margin: 0 0 1.7em;
									overflow: hidden;
									color: #fff;
									font-size: 14px;
									line-height: 1.7em;
									height: 6.8em;
								}
								.more_btn {
									border: 1px solid #fff;
									cursor: pointer;
									border-radius: 50%;
									display: none;
									width: 30px;
									justify-content: center;
									align-items: center;
									height: 30px;
									.icon {
										color: #fff;
										font-size: 14px;
									}
								}
							}
						}
						.list-item1:hover {
							.infoBox {
								opacity: 1;
							}
						}
						.list-item2 {
							cursor: pointer;
							width: 41%;
							position: relative;
							height: 100%;
							img {
								object-fit: cover;
								width: 100%;
								height: 100%;
							}
							.infoBox {
								padding: 20px 20px;
								z-index: 20;
								top: 0;
								left: 0;
								background: rgba(0,0,0,0.5);
								width: 100%;
								position: absolute;
								opacity: 0;
								transition: 0.4s all;
								text-align: left;
								height: 100%;
								.name {
									margin: 0 0 0.9em;
									overflow: hidden;
									color: #fff;
									white-space: nowrap;
									font-weight: normal;
									width: 100%;
									font-size: 16px;
									line-height: 60px;
									position: relative;
									text-overflow: ellipsis;
									text-align: center;
									.line {
										left: 0;
										bottom: 0;
										background: url(http://codegen.caihongy.cn/20250116/595b0344958b425d88b2e644f6dd4ac9.png) no-repeat center top / 100% 100%;
										display: block;
										width: 100%;
										position: absolute;
										height: 4px;
									}
								}
								.desc {
									margin: 0 0 1.7em;
									overflow: hidden;
									color: #fff;
									font-size: 14px;
									line-height: 1.7em;
									height: 6.8em;
								}
								.more_btn {
									border: 1px solid #fff;
									cursor: pointer;
									border-radius: 50%;
									display: none;
									width: 30px;
									justify-content: center;
									align-items: center;
									height: 30px;
									.icon {
										color: #fff;
										font-size: 14px;
									}
								}
							}
						}
						.list-item2:hover {
							.infoBox {
								opacity: 1;
							}
						}
					}
					.bottomView {
						margin: 20px 0 0;
						overflow: hidden;
						display: flex;
						width: 100%;
						height: 330px;
						.list-item1 {
							cursor: pointer;
							margin: 0 20px 0 0;
							width: calc(41% - 20px);
							position: relative;
							height: 100%;
							img {
								object-fit: cover;
								width: 100%;
								height: 100%;
							}
							.infoBox {
								padding: 20px 20px;
								z-index: 20;
								top: 0;
								left: 0;
								background: rgba(0,0,0,0.5);
								width: 100%;
								position: absolute;
								opacity: 0;
								transition: 0.4s all;
								text-align: left;
								height: 100%;
								.name {
									margin: 0 0 0.9em;
									overflow: hidden;
									color: #fff;
									white-space: nowrap;
									font-weight: normal;
									width: 100%;
									font-size: 16px;
									line-height: 60px;
									position: relative;
									text-overflow: ellipsis;
									text-align: center;
									.line {
										left: 0;
										bottom: 0;
										background: url(http://codegen.caihongy.cn/20250116/595b0344958b425d88b2e644f6dd4ac9.png) no-repeat center top / 100% 100%;
										display: block;
										width: 100%;
										position: absolute;
										height: 4px;
									}
								}
								.desc {
									margin: 0 0 1.7em;
									overflow: hidden;
									color: #fff;
									font-size: 14px;
									line-height: 1.7em;
									height: 6.8em;
								}
								.more_btn {
									border: 1px solid #fff;
									cursor: pointer;
									border-radius: 50%;
									display: none;
									width: 30px;
									justify-content: center;
									align-items: center;
									height: 30px;
									.icon {
										color: #fff;
										font-size: 14px;
									}
								}
							}
						}
						.list-item1:hover {
							.infoBox {
								opacity: 1;
							}
						}
						.list-item2 {
							cursor: pointer;
							width: 59%;
							position: relative;
							height: 100%;
							img {
								object-fit: cover;
								width: 100%;
								height: 100%;
							}
							.infoBox {
								padding: 20px 20px;
								z-index: 20;
								top: 0;
								left: 0;
								background: rgba(0,0,0,0.5);
								width: 100%;
								position: absolute;
								opacity: 0;
								transition: 0.4s all;
								text-align: left;
								height: 100%;
								.name {
									margin: 0 0 0.9em;
									overflow: hidden;
									color: #fff;
									white-space: nowrap;
									font-weight: normal;
									width: 100%;
									font-size: 16px;
									line-height: 60px;
									position: relative;
									text-overflow: ellipsis;
									text-align: center;
									.line {
										left: 0;
										bottom: 0;
										background: url(http://codegen.caihongy.cn/20250116/595b0344958b425d88b2e644f6dd4ac9.png) no-repeat center top / 100% 100%;
										display: block;
										width: 100%;
										position: absolute;
										height: 4px;
									}
								}
								.desc {
									margin: 0 0 1.7em;
									overflow: hidden;
									color: #fff;
									font-size: 14px;
									line-height: 1.7em;
									height: 6.8em;
								}
								.more_btn {
									border: 1px solid #fff;
									cursor: pointer;
									border-radius: 50%;
									display: none;
									width: 30px;
									justify-content: center;
									align-items: center;
									height: 30px;
									.icon {
										color: #fff;
										font-size: 14px;
									}
								}
							}
						}
						.list-item2:hover {
							.infoBox {
								opacity: 1;
							}
						}
					}
				}
			}
			.moreBtn {
				border: 0px solid #999;
				padding: 0 20px;
				margin: 40px 0 0;
				top: 0;
				background: url(http://codegen.caihongy.cn/20250112/55553c0e61c3471dad21215503ce8827.png) no-repeat center top / 100% 100%;
				display: block;
				width: 150px;
				line-height: 48px;
				position: absolute;
				right: calc((100% - 1200px)/2);
				text-align: center;
				order: 3;
				.text {
					color: #848c74;
					font-size: 16px;
				}
				.icon {
					color: #333;
					display: none;
					font-size: 15px;
				}
			}
		}
		.recommend {
			padding: 60px 0 96px;
			margin: 0;
			align-content: flex-start;
			background: url(http://codegen.caihongy.cn/20250114/d146b38f24d74ad0a82b171166912b11.jpg) no-repeat center top / cover;
			display: block;
			width: 100%;
			justify-content: center;
			align-items: flex-start;
			position: relative;
			order: 5;
			.recommend_title_box {
				padding: 0 calc((100% - 1200px)/2);
				margin: 20px 0 0;
				background: url(http://codegen.caihongy.cn/20250112/99761fb2e0a740c488bc04759c62d038.png) no-repeat center top;
				width: 100%;
				position: relative;
				text-align: left;
				.recommend_title {
					margin: 0 0 0 10px;
					color: #000;
					background: none;
					font-weight: 600;
					display: inline-block;
					width: 100%;
					font-size: 28px;
					line-height: 80px;
					text-align: left;
					height: 108px;
				}
				.recommend_subhead {
					margin: 0;
					color: #999;
					display: none;
					width: 100%;
					font-size: 18px;
					line-height: 40px;
					text-align: center;
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
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list18 {
				padding: 0;
				margin: 40px auto;
				color: #666;
				background: none;
				width: 1200px;
				font-size: 14px;
				.tab_view {
					margin: 10px auto;
					display: none;
					width: 60%;
					justify-content: center;
					.tab {
						cursor: pointer;
						border-radius: 5px;
						margin: 0 5px 10px;
						color: #333;
						background: #eee;
						display: block;
						width: 140px;
						font-size: 14px;
						line-height: 40px;
						text-align: center;
						height: 40px;
					}
					.tab:hover {
						color: #ddd;
						background: #0195df;
					}
					.tab.tabActive {
						color: #fff;
						background: #5555ff;
					}
				}
				.list-body {
					padding: 0;
					display: flex;
					width: 100%;
					.list-body-left {
						margin: 0 auto 0 0;
						width: 50%;
						.list-item1 {
							margin: 0 0 20px;
							background: url(http://codegen.caihongy.cn/20250114/a33837c7f23c4516afa0ec8860522295.png) no-repeat center top / 100% 100%;
							display: flex;
							width: 100%;
							align-items: center;
							transition: all 0s;
							.infoBox {
								padding: 40px 20px 40px 40px;
								color: #0674fc;
								align-content: center;
								display: flex;
								width: 50%;
								border-color: #929292;
								border-width: 0px;
								align-items: center;
								border-style: solid;
								flex-wrap: wrap;
								height: 300px;
								.name {
									overflow: hidden;
									color: #000;
									white-space: nowrap;
									width: 100%;
									font-size: 16px;
									line-height: 1.5;
									text-overflow: ellipsis;
								}
								.price {
									padding: 10px 0;
									color: #f00;
									width: 100%;
									font-size: 16px;
									line-height: 1.5;
								}
								.time_item {
									padding: 0 10px 0 0;
									display: inline-block;
									order: 10;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.publisher_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									color: #d1903b;
									display: inline-block;
									order: 4;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.like_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									z-index: 2;
									color: #9a5e50;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.collect_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									color: #66714c;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.view_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									color: #66714c;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
							}
							.img {
								padding: 40px;
								overflow: hidden;
								width: 50%;
								transition: all .3s;
								height: 300px;
								img {
									border-radius: 10px;
									transform: scale(1);
									object-fit: cover;
									display: block;
									width: 100%;
									transition: all .3s;
									height: 100%;
								}
							}
						}
						.list-item1:hover {
							cursor: pointer;
							transform: translate3d(0px, 0px, 0px);
							.infoBox {
								.name {
								}
								.price {
									color: #f00;
								}
								.time_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.publisher_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.like_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.collect_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.view_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
							}
							.img {
								overflow: hidden;
								img {
									transform: scale(1);
								}
							}
						}
						.list-item2 {
							background: url(http://codegen.caihongy.cn/20250114/a33837c7f23c4516afa0ec8860522295.png) no-repeat center top / 100% 100%;
							display: flex;
							width: 100%;
							align-items: center;
							transition: all 0s;
							.img {
								padding: 40px 20px 40px 40px;
								overflow: hidden;
								width: 46%;
								transition: all .3s;
								height: 300px;
								img {
									border-radius: 10px;
									transform: scale(1);
									object-fit: cover;
									display: block;
									width: 100%;
									transition: all .3s;
									height: 100%;
								}
							}
							.infoBox {
								padding: 20px 65px 20px 20px;
								color: #0674fc;
								align-content: center;
								display: flex;
								width: 54%;
								border-color: #929292;
								border-width: 0;
								align-items: center;
								border-style: solid;
								flex-wrap: wrap;
								height: 300px;
								.name {
									overflow: hidden;
									color: #000;
									white-space: nowrap;
									width: 100%;
									font-size: 16px;
									line-height: 1.5;
									text-overflow: ellipsis;
								}
								.price {
									padding: 10px 0;
									color: #f00;
									width: 100%;
									font-size: 16px;
									line-height: 1.5;
								}
								.time_item {
									padding: 0 10px 0 0;
									display: inline-block;
									order: 10;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.publisher_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									color: #d1903b;
									display: inline-block;
									order: 4;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.like_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									z-index: 2;
									color: #9a5e50;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.collect_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									color: #66714c;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.view_item {
									padding: 0 10px 0 0;
									margin: 0 0 10px;
									color: #66714c;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
							}
						}
						.list-item2:hover {
							cursor: pointer;
							transform: translate3d(0px, 0px, 0px);
							.img {
								overflow: hidden;
								img {
									transform: scale(1);
								}
							}
							.infoBox {
								.name {
								}
								.price {
								}
								.time_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.publisher_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.like_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.collect_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
								.view_item {
									.icon {
									}
									.label {
									}
									.text {
									}
								}
							}
						}
					}
					.list-body-right {
						padding: 40px;
						background: url(http://codegen.caihongy.cn/20250114/f7d4119662014082826a4d397ba5d7ad.jpg) no-repeat center top / 100% 100%;
						width: 48%;
						.list-item {
							border-radius: 10px;
							width: 100%;
							position: relative;
							.img {
								border-radius: 10px;
								width: 100%;
								height: 540px;
								img {
									cursor: pointer;
									border-radius: 10px;
									transform: scale(1);
									object-fit: cover;
									display: block;
									width: 100%;
									transition: all .3s;
									height: 100%;
								}
							}
							.infoBox {
								border-radius: 0 0 10px 10px;
								padding: 10px 20px 30px;
								color: #fff;
								left: 0;
								bottom: 0;
								background: rgba(0, 0, 0, .3);
								width: 100%;
								font-size: 14px;
								position: absolute;
								.name {
									overflow: hidden;
									color: #fff;
									white-space: nowrap;
									width: 100%;
									font-size: 16px;
									line-height: 30px;
									text-overflow: ellipsis;
								}
								.price {
									padding: 0;
									color: #f00;
									font-size: 16px;
									line-height: 30px;
								}
								.time_item {
									padding: 0;
									margin: 0 10px 0 0;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.publisher_item {
									padding: 0;
									margin: 0 10px 0 0;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.like_item {
									padding: 0;
									margin: 0 10px 0 0;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.collect_item {
									padding: 0;
									margin: 0 10px 0 0;
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
								.view_item {
									display: inline-block;
									.icon {
										margin: 0 2px 0 0;
										color: inherit;
										display: none;
										font-size: inherit;
										line-height: 1.5;
									}
									.label {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
									.text {
										color: inherit;
										font-size: inherit;
										line-height: 1.5;
									}
								}
							}
						}
						.swiper-button-prev {
							left: 10px;
							display: none;
							right: auto;
						}
						.swiper-button-prev::after {
							color: #d7b830;
						}
						.swiper-button-next {
							left: auto;
							display: none;
							right: 10px;
						}
						.swiper-button-next::after {
							color: #d7b830;
						}
						/deep/.swiper-pagination {
							transform: translate3d(0,0,0);
							z-index: 10;
							left: 0;
							bottom: 8px;
							width: 100%;
							position: absolute;
							transition: .3s opacity;
							text-align: center;
							.swiper-pagination-bullet {
								cursor: pointer;
								border-radius: 100%;
								margin: 0 4px;
								background: #f6f6f6;
								display: inline-block;
								width: 8px;
								opacity: .8;
								height: 8px;
							}
							.swiper-pagination-bullet:hover {
								background: #0674fc;
							}
							.swiper-pagination-bullet.swiper-pagination-bullet-active {
								background: #0674fc;
							}
						}
					}
				}
			}
			.moreBtn {
				border: 0px solid #999;
				cursor: pointer;
				padding: 0 20px;
				margin: 0px calc((100% - 1200px)/2)  0 0;
				background: #475a8310;
				display: none;
				width: auto;
				line-height: 32px;
				float: right;
				text-align: right;
				.text {
					color: #333;
					font-size: 15px;
				}
				.icon {
					color: #333;
					font-size: 15px;
				}
			}
		}
		.lists {
			padding: 0;
			margin: 0;
			background: url(http://codegen.caihongy.cn/20250114/8e7f511887714d26abfe4910f1feee65.jpg) no-repeat center top / cover;
			width: 100%;
			position: relative;
			order: 9;
			.list_title_box {
				padding: 0 calc((100% - 1200px)/2);
				margin: 20px 0 0;
				background: url(http://codegen.caihongy.cn/20250112/99761fb2e0a740c488bc04759c62d038.png) no-repeat center top;
				width: 100%;
				position: relative;
				text-align: left;
				.list_title {
					margin: 0 0 0 10px;
					color: #000;
					background: none;
					font-weight: 600;
					display: inline-block;
					width: 100%;
					font-size: 28px;
					line-height: 80px;
					text-align: left;
					height: 108px;
				}
				.list_subhead {
					margin: 0;
					color: #999;
					display: none;
					width: 100%;
					font-size: 18px;
					line-height: 40px;
					text-align: center;
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
				transform: rotate(0deg) scale(1) skew(0deg, 0deg) translate3d(0px, 0px, 0px);
				-webkit-perspective: 1000px;
				perspective: 1000px;
				transition: 0.3s;
			}
			.list23 {
				padding: 0;
				margin: 0 auto;
				overflow: hidden;
				background: none;
				width: 1220px;
				.tab_view {
					margin: 30px 0 0;
					display: flex;
					width: calc(100% - 20px);
					justify-content: center;
					align-items: center;
					.tab {
						border: 0px solid #03abe930;
						border-radius: 5px;
						padding: 2px 10px;
						margin: 0 10px;
						background: #b1b1b1;
						display: flex;
						justify-content: center;
						align-items: center;
						transition: 0.3s;
						min-width: 96px;
						img {
							border-radius: 50%;
							margin: 0 10px 0 0;
							width: 40px;
							transition: 0.3s;
							height: 40px;
						}
						.text {
							color: #000;
							display: block;
							font-size: 16px;
							line-height: 50px;
							transition: 0.3s;
							text-align: center;
							height: 50px;
						}
					}
					.tab:hover {
						border: 0px solid #03abe9;
						cursor: pointer;
						color: #000;
						background: #848c74;
						min-width: 96px;
						img {
							border-radius: 50%;
						}
						.text {
							color: #fff;
						}
					}
					.tab.tabActive {
						border: 0px solid #03abe9;
						cursor: pointer;
						color: #000;
						background: #848c74;
						min-width: 96px;
						img {
							border-radius: 50%;
						}
						.text {
							color: #fff;
						}
					}
				}
				.list-body {
					margin: 40px 0 0;
					.list-body-top {
						margin: 0 auto;
						display: flex;
						width: calc(100% - 20px);
						justify-content: space-between;
						align-items: center;
						.img {
							overflow: hidden;
							width: 600px;
							height: 450px;
							img {
								object-fit: cover;
								width: 100%;
								transition: all 0.3s;
								height: 100%;
							}
						}
						.infoBox {
							padding: 40px 30px;
							flex: 1;
							background: #fff;
							box-sizing: border-box;
							height: 450px;
							.name {
								overflow: hidden;
								color: #848c74;
								white-space: nowrap;
								font-weight: 600;
								width: 100%;
								font-size: 16px;
								line-height: 30px;
								text-overflow: ellipsis;
							}
							.desc {
								margin: 20px 0;
								color: #666;
								width: 100%;
								font-size: 15px;
								line-height: 1.8;
								text-align: justify;
								height: auto !important;
							}
							.centerInfo {
								color: #888;
								display: flex;
								width: 100%;
								font-size: 15px;
								flex-wrap: wrap;
								.time_item {
									padding: 0 10px 0 0;
									order: 11;
									.icon {
										margin: 0 2px 0 0;
										line-height: 1.5;
									}
									.label {
										line-height: 1.5;
									}
									.text {
										line-height: 1.5;
									}
								}
								.publisher_item {
									padding: 0 10px 0 0;
									.icon {
										margin: 0 2px 0 0;
										line-height: 1.5;
									}
									.label {
										line-height: 1.5;
									}
									.text {
										line-height: 1.5;
									}
								}
								.like_item {
									padding: 0 10px 0 0;
									.icon {
										margin: 0 2px 0 0;
										line-height: 1.5;
									}
									.label {
										line-height: 1.5;
									}
									.text {
										line-height: 1.5;
									}
								}
								.collect_item {
									padding: 0 10px 0 0;
									.icon {
										margin: 0 2px 0 0;
										line-height: 1.5;
									}
									.label {
										line-height: 1.5;
									}
									.text {
										line-height: 1.5;
									}
								}
								.view_item {
									padding: 0;
									.icon {
										margin: 0 2px 0 0;
										line-height: 1.5;
									}
									.label {
										line-height: 1.5;
									}
									.text {
										line-height: 1.5;
									}
								}
							}
							.bottomInfo {
								margin: 20px 0 0;
								display: flex;
								justify-content: space-between;
								align-items: center;
								.more_btn {
									border: 0px solid #ccc;
									color: #333;
									display: flex;
									font-size: 16px;
									line-height: 48px;
									transition: 0.2s;
									border-radius: 0px;
									background: url(http://codegen.caihongy.cn/20250120/520f1242c48c4b92806eac7f0ddb9e48.png) no-repeat center / 100% 100%;
									width: 150px;
									justify-content: center;
									align-items: center;
									text-align: center;
									height: 40px;
									order: 2;
									.text {
										padding: 0 5px 0 0;
										color: #666;
										font-size: 16px;
									}
									.icon {
										color: #666;
										font-size: 12px;
									}
								}
								.more_btn:hover {
									transition: all 0s;
									.text {
									}
									.icon {
									}
								}
								.price {
									margin: 10px 0 0;
									color: #c92200;
									font-size: 16px;
									.price_text {
										color: #c92200;
										font-weight: bold;
										display: inline-block;
										font-size: 32px;
									}
								}
							}
						}
					}
					.list-body-bottom {
						margin: 29px 0 0;
						display: flex;
						flex-wrap: wrap;
						.list-item {
							padding: 0 0 5px;
							margin: 0 10px 20px;
							background: #fff;
							width: calc(33.33% - 20px);
							.img {
								overflow: hidden;
								width: 100%;
								height: 200px;
								img {
									object-fit: cover;
									width: 100%;
									transition: 0.3s;
									height: 100%;
								}
							}
							.infoBox {
								padding: 0 19px 5px;
								background: none;
								display: block;
								width: 100%;
								justify-content: space-between;
								align-items: center;
								position: relative;
								box-sizing: border-box;
								transition: 0.3s;
								height: auto;
								.name {
									overflow: hidden;
									max-width: calc(100% - 110px);
									white-space: nowrap;
									background: none;
									width: auto;
									font-size: 15px;
									line-height: 34px;
									text-overflow: ellipsis;
									transition: 0.3s;
									height: 30px;
								}
								.price {
									color: #c92200;
									white-space: nowrap;
									bottom: 0px;
									background: none;
									width: auto;
									font-size: 16px;
									position: absolute;
									right: 10px;
									transition: 0.3s;
									text-align: right;
									.price_text {
										color: #c92200;
										font-weight: bold;
										display: inline-block;
										font-size: 24px;
										transition: 0.3s;
									}
								}
							}
						}
						.list-item:hover {
							cursor: pointer;
							.img {
								img {
									transform: scale(1.1);
								}
							}
							.infoBox {
								background: none;
								transition: all 0s;
								.name {
									color: #333;
								}
								.price {
									color: #c92200;
									.price_text {
										color: #c92200;
									}
								}
							}
						}
					}
				}
			}
			.moreBtn {
				border: 0px solid #999;
				padding: 0 20px;
				margin: 40px 0 0;
				top: 0;
				background: url(http://codegen.caihongy.cn/20250112/55553c0e61c3471dad21215503ce8827.png) no-repeat center top / 100% 100%;
				display: block;
				width: 150px;
				line-height: 48px;
				position: absolute;
				right: calc((100% - 1200px)/2);
				text-align: center;
				order: 3;
				.text {
					color: #848c74;
					font-size: 16px;
				}
				.icon {
					color: #333;
					display: none;
					font-size: 15px;
				}
			}
		}
	}
</style>
