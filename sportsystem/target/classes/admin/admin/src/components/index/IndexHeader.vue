<template>
	<div class="navbar">
		<div class="title">
			<el-image class="title-img" src="http://codegen.caihongy.cn/20240919/47f13d4524f3452c9c9b7f42ed717e58.png" fit="cover" />
			<span class="title-name">{{this.$project.projectName}}</span>
		</div>
		<div class="dropdown-box">
			<div class="el-dropdown-link">
				<el-image v-if="user" :src="avatar?this.$base.url + avatar : require('@/assets/img/avator.png')" fit="cover"></el-image>
				<span class="label">欢迎您，</span>
				<span class="nickname">{{this.$storage.get('adminName')}}</span>
			</div>
			<div class="top-el-dropdown-menu-2">
				<div class="item1" @click="handleCommand('')">首页</div>
				<div class="item2" @click="handleCommand('center')">个人中心</div>
				<div class="item3" v-if="this.$storage.get('role')!='管理员'" @click="handleCommand('front')">退出到前台</div>
				<div class="item4" @click="handleCommand('logout')">退出登录</div>
			</div>
		</div>
	</div>
</template>

<script>
	import {
		Loading
	} from 'element-ui';
	import axios from 'axios';
	export default {
		data() {
			return {
				dialogVisible: false,
				ruleForm: {},
				user: null,
			};
		},
		created() {
		},
		computed: {
			avatar(){
				return this.$storage.get('headportrait')?this.$storage.get('headportrait'):''
			},
		},
		mounted() {
			let sessionTable = this.$storage.get("sessionTable")
			this.$http({
				url: sessionTable + '/session',
				method: "get"
			}).then(({
				data
			}) => {
				if (data && data.code === 0) {
					if(sessionTable == 'yonghu') {
						this.$storage.set('headportrait',data.data.touxiang)
					}
					if(sessionTable == 'yundongyuan') {
						this.$storage.set('headportrait',data.data.touxiang)
					}
					if(sessionTable == 'jiaolianyuan') {
						this.$storage.set('headportrait',data.data.touxiang)
					}
					if(sessionTable == 'users') {
						this.$storage.set('headportrait',data.data.image)
					}
					this.$storage.set('userForm',JSON.stringify(data.data))
					this.user = data.data;
					this.$storage.set('userid',data.data.id);
				} else {
					let message = this.$message
					message.error(data.msg);
				}
			});
		},
		methods: {
			handleCommand(name) {
				if (name == 'logout') {
					this.onLogout()
				} 
				else if (name == 'front') {
					this.onIndexTap()
				}
				else {
					let router = this.$router
					name = '/'+name
					router.push(name)
				}
			},
			onLogout() {
				let storage = this.$storage
				let router = this.$router
				storage.clear()
				this.$store.dispatch('tagsView/delAllViews')
				router.replace({
					name: "login"
				});
			},
			onIndexTap(){
				localStorage.setItem("frontToken", localStorage.getItem("Token"));
				localStorage.setItem("frontRole", localStorage.getItem("role"));
				localStorage.setItem("frontSessionTable", localStorage.getItem("sessionTable"));
				localStorage.setItem("frontHeadportrait", localStorage.getItem("headportrait"));
				localStorage.setItem("UserTableName", localStorage.getItem("sessionTable"));
				localStorage.setItem("frontUserid", localStorage.getItem("userid"));
				localStorage.setItem("username", localStorage.getItem("adminName"));
				window.location.href = `${this.$base.indexUrl}`
			},
		}
	};
</script>


<style lang="scss" scoped>
	.navbar {
		.title {
			top: 10px;
			left: 40px;
			display: block;
			position: absolute;
			.title-img {
				border-radius: 100%;
				object-fit: cover;
				width: 44px;
				float: left;
				height: 44px;
			}
			.title-name {
				padding: 0 0 0 10px;
				color: #132749;
				font-weight: 600;
				font-size: 28px;
				line-height: 44px;
				float: left;
			}
		}
		.dropdown-box {
			color: inherit;
			display: flex;
			font-size: inherit;
			.el-dropdown-link {
				display: flex;
				align-items: center;
				.el-image {
					border-radius: 100%;
					margin: 0 10px;
					object-fit: cover;
					display: none;
					width: 42px;
					height: 42px;
				}
				.label {
					color: inherit;
					display: none;
					font-size: inherit;
					line-height: 32px;
				}
				.nickname {
					color: inherit;
					display: none;
					font-size: inherit;
					line-height: 32px;
				}
			}
			.top-el-dropdown-menu-2 {
				display: flex;
				justify-content: center;
				align-items: center;
				div.item1 {
					padding: 0 3px;
					color: #666;
					display: none;
					font-size: 14px;
					line-height: 32px;
				}
				div.item1:hover {
					color: red;
				}
				div.item2 {
					padding: 0 3px;
					color: #666;
					display: none;
					font-size: 14px;
					line-height: 32px;
				}
				div.item2:hover {
					color: red;
				}
				div.item3 {
					padding: 0 3px;
					color: #666;
					font-size: 14px;
					line-height: 32px;
				}
				div.item3:hover {
					color: red;
				}
				div.item4 {
					padding: 0 3px;
					color: #666;
					font-size: 14px;
					line-height: 32px;
				}
				div.item4:hover {
					color: red;
				}
			}
		}
	}
</style>
