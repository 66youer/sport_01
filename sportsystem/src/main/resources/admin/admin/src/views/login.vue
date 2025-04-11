<template>
	<div>
		<div class="login-container">
			<el-form class="login_form animate__animated animate__">
				<div class="login_form2">
					<div class="title-container">体育类信息管理系统</div>
					<div v-if="loginType==1" class="list-item">
						<div class="lable">
							账号：
						</div>
						<input placeholder="请输入账号：" name="username" type="text" v-model="rulesForm.username">
					</div>
					<div v-if="loginType==1" class="list-item">
						<div class="lable">
							密码：
						</div>
						<div class="password-box">
							<input placeholder="请输入密码：" name="password" :type="showPassword?'text':'password'" v-model="rulesForm.password">
							<span class="icon iconfont" :class="showPassword?'icon-liulan13':'icon-liulan17'" @click="showPassword=!showPassword"></span>
						</div>
					</div>

					<div class="list-item select" v-if="roles.length>1">
						<div class="lable">
							角色：
						</div>
						<el-select v-model="rulesForm.role" placeholder="请选择角色：">
							<el-option v-if="loginType==1||(loginType==2&&item.roleName!='管理员')" v-for="item in roles" :key="item.roleName" :label="item.roleName" :value="item.roleName" />
						</el-select>
					</div>

		
					<div class="login-btn">
						<div class="login-btn1">
							<el-button v-if="loginType==1" type="primary" @click="login()" class="loginInBt">登录</el-button>
						</div>
						<div class="login-btn2">
						</div>
						<div class="login-btn3">
						</div>
					</div>
				</div>
			</el-form>
		</div>
	</div>
</template>
<script>
	import 'animate.css'
	import menu from "@/utils/menu";
	export default {
		data() {
			return {
				verifyCheck2: false,
				flag: false,
				baseUrl:this.$base.url,
				loginType: 1,
				rulesForm: {
					username: "",
					password: "",
					role: "",
				},
				menus: [],
				roles: [],
				tableName: "",
				showPassword: false,
			};
		},
		mounted() {
			let menus = menu.list();
			this.menus = menus;

			for (let i = 0; i < this.menus.length; i++) {
				if (this.menus[i].hasBackLogin=='是') {
					this.roles.push(this.menus[i])
				}
			}

		},
		created() {

		},
		destroyed() {
		},
		components: {
		},
		methods: {

			//注册
			register(tableName){
				this.$storage.set("loginTable", tableName);
				this.$router.push({path:'/register',query:{pageFlag:'register'}})
			},
			// 登陆
			login() {

				if (!this.rulesForm.username) {
					this.$message.error("请输入用户名");
					return;
				}
				if (!this.rulesForm.password) {
					this.$message.error("请输入密码");
					return;
				}
				if(this.roles.length>1) {
					if (!this.rulesForm.role) {
						this.$message.error("请选择角色");
						return;
					}

					let menus = this.menus;
					for (let i = 0; i < menus.length; i++) {
						if (menus[i].roleName == this.rulesForm.role) {
							this.tableName = menus[i].tableName;
						}
					}
				} else {
					this.tableName = this.roles[0].tableName;
					this.rulesForm.role = this.roles[0].roleName;
				}
		
				this.loginPost()
			},
			loginPost() {
				this.$http({
					url: `${this.tableName}/login?username=${this.rulesForm.username}&password=${this.rulesForm.password}`,
					method: "post"
				}).then(({ data }) => {
					if (data && data.code === 0) {
						this.$storage.set("Token", data.token);
						this.$storage.set("role", this.rulesForm.role);
						this.$storage.set("sessionTable", this.tableName);
						this.$storage.set("adminName", this.rulesForm.username);
						this.$router.replace({ path: "/" });
					} else {
						this.$message.error(data.msg);
					}
				});
			},
		}
	}
</script>

<style lang="scss" scoped>
.login-container {
	min-height: 100vh;
	position: relative;
	background-repeat: no-repeat;
	background-position: center center;
	background-size: cover;
	background: url(http://codegen.caihongy.cn/20240918/4ad46f15b24a40c29f768df225899df5.png);
	background-repeat: no-repeat;
	background-size: 100% 100%;
	background: url(http://codegen.caihongy.cn/20240918/4ad46f15b24a40c29f768df225899df5.png);
	display: flex;
	width: 100%;
	min-height: 100vh;
	justify-content: center;
	align-items: center;
	background-position: center center;

	.login_form {
		padding: 0;
		margin: 0;
		z-index: 1000;
		display: flex;
		min-height: 100vh;
		flex-wrap: wrap;
		border-radius: 0;
		box-shadow: inset 0px 0px 0px 0px #000;
		flex-direction: column;
		background: none;
		width: 40%;
		justify-content: center;
		align-items: center;
		position: relative;
		height: auto;
		.login_form2 {
			width: 100%;
		}
		.title-container {
			border: 1px solid #fff;
			padding: 0 0 20px;
			margin: 0;
			color: #fff;
			background: none;
			font-weight: 600;
			width: 100%;
			font-size: 30px;
			border-width: 0 0 2px;
			line-height: 50px;
			text-align: center;
		}
		.list-item {
			border: 1px solid #fff;
			padding: 0;
			margin: 0;
			display: flex;
			width: calc(100% - 0px);
			border-width: 0 0 2px;
			align-items: center;
			position: relative;
			.lable {
				border: 1px solid #fff;
				color: #fff;
				width: 130px;
				font-size: 17px;
				border-width: 0 2px 0 0;
				line-height: 60px;
				text-align: center;
			}
			input {
				border: 0;
				border-radius: 4px;
				padding: 0 20px;
				outline: 0;
				color: #fff;
				background: none;
				flex: 1;
				width: 100%;
				font-size: 16px;
				height: 40px;
			}
			input:focus {
				border: 0;
				padding: 0 20px;
				outline: 0;
				color: #fff;
				background: none;
				flex: 1;
				width: 100%;
				font-size: 16px;
				height: 40px;
			}
			.password-box {
				flex: 1;
				display: flex;
				width: 100%;
				position: relative;
				align-items: center;
				input {
					border: none;
					padding: 0 20px;
					color: #fff;
					background: none;
					width: 100%;
					font-size: 14px;
					height: 44px;
				}
				input:focus {
					border: 0;
					padding: 0 20px;
					outline: 0;
					color: #fff;
					background: none;
					width: 100%;
					font-size: 14px;
					height: 44px;
				}
				.iconfont {
					cursor: pointer;
					z-index: 1;
					color: #fff;
					top: 0;
					font-size: 16px;
					line-height: 44px;
					position: absolute;
					right: 5px;
				}
			}
			input::placeholder {
				color: #fff;
				font-size: 14px;
			}
			/deep/ .el-select {
				flex: 1;
				width: 100%;
			}
			/deep/ .el-select .el-input__inner {
				border: 0;
				padding: 0 10px 0 20px;
				color: #fff;
				flex: 1;
				background: none;
				width: calc(100% - 130px);
				font-size: 16px;
				height: 44px;
			}
			/deep/ .el-select .is-focus .el-input__inner {
				border: 0;
				padding: 0 10px 0 20px;
				color: #fff;
				flex: 1;
				background: none;
				width: calc(100% - 130px);
				font-size: 16px;
				height: 44px;
			}
			/deep/ .el-select .el-input__inner::placeholder{
				color: #fff;
				font-size: 14px;
			}
		}
		.login-btn {
			margin: 20px auto;
			display: flex;
			width: 100%;
			justify-content: center;
			align-items: center;
			flex-wrap: wrap;
			.login-btn1 {
				margin: 60px 0 0;
				display: flex;
				width: 100%;
				justify-content: center;
				order: 3;
			}
			.login-btn2 {
				margin: 10px 0 0;
				display: flex;
				width: 100%;
				justify-content: space-around;
				align-items: center;
				order: 2;
			}
			.login-btn3 {
				width: 100%;
				order: 1;
			}
			.loginInBt {
				border: 1px solid #fff;
				cursor: pointer;
				border-radius: 0;
				padding: 0 10px;
				margin: 0 auto 10px;
				color: #fff;
				background: none;
				font-weight: 600;
				width: 30%;
				font-size: 24px;
				min-width: 68px;
				height: 60px;
			}
			.loginInBt:hover {
				opacity: 0.5;
			}
			.register {
				border: 1px solid #fff;
				cursor: pointer;
				border-radius: 0;
				padding: 0 10px;
				margin: 0 0 10px;
				color: #fff;
				background: none;
				width: 30%;
				font-size: 16px;
				height: 44px;
			}
			.register:hover {
				opacity: 0.5;
			}
			.forget {
				border: 0;
				cursor: pointer;
				border-radius: 0;
				padding: 0;
				margin: 0 10px 10px 0;
				color: #fff;
				background: none;
				width: 100%;
				font-size: 15px;
				text-align: left;
				height: 34px;
			}
			.forget:hover {
				opacity: 0.5;
			}
		}
	}
}

</style>
