<template>
	<div class="add-update-preview">
		<el-form
			class="add-update-form"
			ref="ruleForm"
			:model="ruleForm"
			:rules="rules"
			label-width="180px"
			>
			<el-form-item class="add-item" label="比赛名称" prop="bisaimingcheng">
				<el-input v-model="ruleForm.bisaimingcheng" 
					placeholder="比赛名称" clearable :disabled=" false  ||ro.bisaimingcheng"></el-input>
			</el-form-item>
			<el-form-item class="add-item"  label="比赛类型" prop="bisaileixing">
				<el-select v-model="ruleForm.bisaileixing" placeholder="请选择比赛类型" :disabled=" false  ||ro.bisaileixing" >
					<el-option
						v-for="(item,index) in bisaileixingOptions"
						:key="index"
						:label="item"
						:value="item">
					</el-option>
				</el-select>
			</el-form-item>
			<el-form-item class="add-item" label="宣传图片" v-if="type!='cross' || (type=='cross' && !ro.xuanchuantupian)" prop="xuanchuantupian">
				<file-upload
					tip="点击上传宣传图片"
					action="file/upload"
					:limit="3"
					:multiple="true"
					:fileUrls="ruleForm.xuanchuantupian?ruleForm.xuanchuantupian:''"
					@change="xuanchuantupianUploadChange"
					></file-upload>
			</el-form-item>
			<el-form-item class="add-item" v-else label="宣传图片" prop="xuanchuantupian">
				<img v-if="ruleForm.xuanchuantupian.substring(0,4)=='http'" class="upload-img" v-bind:key="index" :src="ruleForm.xuanchuantupian.split(',')[0]">
				<img v-else class="upload-img" v-bind:key="index" v-for="(item,index) in ruleForm.xuanchuantupian.split(',')" :src="baseUrl+item">
			</el-form-item>
			<el-form-item class="add-item" label="比赛日期" prop="bisairiqi">
				<el-date-picker
					:disabled=" false  ||ro.bisairiqi"
					format="yyyy 年 MM 月 dd 日"
					value-format="yyyy-MM-dd"
					v-model="ruleForm.bisairiqi" 
					type="date"
					placeholder="比赛日期">
				</el-date-picker> 
			</el-form-item>
			<el-form-item class="add-item" label="比赛地点" prop="bisaididian">
				<el-input v-model="ruleForm.bisaididian" 
					placeholder="比赛地点" clearable :disabled=" false  ||ro.bisaididian"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="主办单位" prop="zhubandanwei">
				<el-input v-model="ruleForm.zhubandanwei" 
					placeholder="主办单位" clearable :disabled=" false  ||ro.zhubandanwei"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="承办单位" prop="chengbandanwei">
				<el-input v-model="ruleForm.chengbandanwei" 
					placeholder="承办单位" clearable :disabled=" false  ||ro.chengbandanwei"></el-input>
			</el-form-item>
			<el-form-item class="add-item" label="视频" v-if="type!='cross' || (type=='cross' && !ro.shipin)" prop="shipin">
				<file-upload
					tip="点击上传视频"
					action="file/upload"
					:limit="1"
					:type="2"
					:multiple="true"
					:fileUrls="ruleForm.shipin?ruleForm.shipin:''"
					@change="shipinUploadChange"
					></file-upload>
			</el-form-item>
			<el-form-item class="add-item" v-else label="视频" prop="shipin">
				<div class="viewBtn" v-if="ruleForm.shipin" @click="download(baseUrl + ruleForm.shipin)" type="success">预览</div>
				<div class="unviewBtn" v-else disabled>暂无</div>
			</el-form-item>
			<el-form-item class="add-item" label="详情介绍" prop="xiangqingjieshao">
				<editor 
					v-model="ruleForm.xiangqingjieshao" 
					class="editor" 
					myQuillEditor="xiangqingjieshao"
					action="file/upload">
				</editor>
			</el-form-item>

			<el-form-item class="add-btn-item">
				<el-button class="submitBtn"  type="primary" @click="onSubmit">
					<span class="icon iconfont "></span>
					<span class="text">提交</span>
				</el-button>
				<el-button class="closeBtn" @click="back()">
					<span class="icon iconfont "></span>
					<span class="text">取消</span>
				</el-button>
			</el-form-item>
		</el-form>
	</div>
</template>

<script>
	export default {
		data() {
			return {
				id: '',
				baseUrl: '',
				ro:{
					bisaimingcheng : false,
					bisaileixing : false,
					xuanchuantupian : false,
					bisairiqi : false,
					bisaididian : false,
					zhubandanwei : false,
					chengbandanwei : false,
					xiangqingjieshao : false,
					shipin : false,
					thumbsupnum : false,
					crazilynum : false,
					clicktime : false,
					discussnum : false,
					storeupnum : false,
				},
				type: '',
				userTableName: localStorage.getItem('UserTableName'),
				ruleForm: {
					bisaimingcheng: '',
					bisaileixing: '',
					xuanchuantupian: '',
					bisairiqi: '',
					bisaididian: '',
					zhubandanwei: '',
					chengbandanwei: '',
					xiangqingjieshao: '',
					shipin: '',
					thumbsupnum: '',
					crazilynum: '',
					clicktime: '',
					discussnum: '',
					storeupnum: '',
				},
				bisaileixingOptions: [],


				rules: {
					bisaimingcheng: [
						{ required: true, message: '比赛名称不能为空', trigger: 'blur' },
					],
					bisaileixing: [
						{ required: true, message: '比赛类型不能为空', trigger: 'blur' },
					],
					xuanchuantupian: [
					],
					bisairiqi: [
					],
					bisaididian: [
					],
					zhubandanwei: [
					],
					chengbandanwei: [
					],
					xiangqingjieshao: [
					],
					shipin: [
					],
					thumbsupnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					crazilynum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					clicktime: [
					],
					discussnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
					storeupnum: [
						{ validator: this.$validate.isIntNumer, trigger: 'blur' },
					],
				},
				centerType: false,
			};
		},
		computed: {



		},
		components: {
		},
		created() {
			if(this.$route.query.centerType){
				this.centerType = true
			}
			//this.bg();
			let type = this.$route.query.type ? this.$route.query.type : '';
			this.init(type);
			this.baseUrl = this.$config.baseUrl;
		},
		methods: {
			getMakeZero(s) {
				return s < 10 ? '0' + s : s;
			},
			// 下载
			download(file){
				window.open(`${file}`)
			},
			// 初始化
			init(type) {
				this.type = type;
				if(type=='cross'){
					var obj = JSON.parse(localStorage.getItem('crossObj'));
					for (var o in obj){
						if(o=='bisaimingcheng'){
							this.ruleForm.bisaimingcheng = obj[o];
							this.ro.bisaimingcheng = true;
							continue;
						}
						if(o=='bisaileixing'){
							this.ruleForm.bisaileixing = obj[o];
							this.ro.bisaileixing = true;
							continue;
						}
						if(o=='xuanchuantupian'){
							this.ruleForm.xuanchuantupian = obj[o]?obj[o].split(",")[0]:'';
							this.ro.xuanchuantupian = true;
							continue;
						}
						if(o=='bisairiqi'){
							this.ruleForm.bisairiqi = obj[o];
							this.ro.bisairiqi = true;
							continue;
						}
						if(o=='bisaididian'){
							this.ruleForm.bisaididian = obj[o];
							this.ro.bisaididian = true;
							continue;
						}
						if(o=='zhubandanwei'){
							this.ruleForm.zhubandanwei = obj[o];
							this.ro.zhubandanwei = true;
							continue;
						}
						if(o=='chengbandanwei'){
							this.ruleForm.chengbandanwei = obj[o];
							this.ro.chengbandanwei = true;
							continue;
						}
						if(o=='xiangqingjieshao'){
							this.ruleForm.xiangqingjieshao = obj[o];
							this.ro.xiangqingjieshao = true;
							continue;
						}
						if(o=='shipin'){
							this.ruleForm.shipin = obj[o];
							this.ro.shipin = true;
							continue;
						}
						if(o=='thumbsupnum'){
							this.ruleForm.thumbsupnum = obj[o];
							this.ro.thumbsupnum = true;
							continue;
						}
						if(o=='crazilynum'){
							this.ruleForm.crazilynum = obj[o];
							this.ro.crazilynum = true;
							continue;
						}
						if(o=='clicktime'){
							this.ruleForm.clicktime = obj[o];
							this.ro.clicktime = true;
							continue;
						}
						if(o=='discussnum'){
							this.ruleForm.discussnum = obj[o];
							this.ro.discussnum = true;
							continue;
						}
						if(o=='storeupnum'){
							this.ruleForm.storeupnum = obj[o];
							this.ro.storeupnum = true;
							continue;
						}
					}
				}else if(type=='edit'){
					this.info()
				}
				// 获取用户信息
				this.$http.get(this.userTableName + '/session', {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						var json = res.data.data;
					}
				});
				this.$http.get('option/bisaileixing/bisaileixing', {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						this.bisaileixingOptions = res.data.data;
					}
				});

				if (localStorage.getItem('raffleType') && localStorage.getItem('raffleType') != null) {
					localStorage.removeItem('raffleType')
					setTimeout(() => {
						this.onSubmit()
					}, 300)
				}
			},

			// 多级联动参数
			// 多级联动参数
			info() {
				this.$http.get(`bisaixinxi/detail/${this.$route.query.id}`, {emulateJSON: true}).then(res => {
					if (res.data.code == 0) {
						this.ruleForm = res.data.data;
					}
				});
			},
			// 提交
			async onSubmit() {
				if(!this.ruleForm.id) {
					delete this.ruleForm.userid
				}
				await this.$refs["ruleForm"].validate(async valid => {
					if(valid) {
						if(this.type=='cross'){
							var statusColumnName = localStorage.getItem('statusColumnName');
							var statusColumnValue = localStorage.getItem('statusColumnValue');
							if(statusColumnName && statusColumnName!='') {
								var obj = JSON.parse(localStorage.getItem('crossObj'));
								if(!statusColumnName.startsWith("[")) {
									for (var o in obj){
										if(o==statusColumnName){
											obj[o] = statusColumnValue;
										}
									}
									var table = localStorage.getItem('crossTable');
									await this.$http.post(table+'/update', obj).then(res => {});
								}
							}
						}


						await this.$http.post(`bisaixinxi/${this.ruleForm.id?'update':this.centerType?'save':'add'}`, this.ruleForm).then(async res => {
							if (res.data.code == 0) {
								this.$message({
									message: '操作成功',
									type: 'success',
									duration: 1500,
									onClose: () => {
										this.$router.go(-1);
										
									}
								});
							} else {
								this.$message({
									message: res.data.msg,
									type: 'error',
									duration: 1500
								});
							}
						});
					}
				});
			},
			// 获取uuid
			getUUID () {
				return new Date().getTime();
			},
			// 返回
			back() {
				this.$router.go(-1);
			},
			xuanchuantupianUploadChange(fileUrls) {
				this.ruleForm.xuanchuantupian = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
			},
			shipinUploadChange(fileUrls) {
				this.ruleForm.shipin = fileUrls.replace(new RegExp(this.$config.baseUrl,"g"),"");
			},
		}
	};
</script>

<style rel="stylesheet/scss" lang="scss" scoped>
	.add-update-preview {
		padding: 0 0 20px;
		margin: 0px auto;
		color: #666;
		background: #f6f6f6;
		width: 1200px;
		font-size: 16px;
		position: relative;
		.add-update-form {
			border: 0px solid #fcbb78;
			padding: 20px;
			margin: 20px 0;
			background: #fff;
			width: 100%;
			position: relative;
			.add-item.el-form-item {
				border-radius: 0px;
				padding: 6px 0 0;
				margin: 0 0 20px 0;
				background: none;
				border-color: #475a8310;
				border-width:  0 0 0px;
				border-style: solid;
				/deep/ .el-form-item__label {
					padding: 0 10px 0 0;
					color: #666;
					font-weight: 500;
					width: 180px;
					font-size: inherit;
					line-height: 40px;
					text-align: right;
				}
				/deep/ .el-form-item__content {
					margin-left: 180px;
				}
				.el-input {
					width: auto;
				}
				.el-input /deep/ .el-input__inner {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					color: inherit;
					width: auto;
					font-size: 16px;
					height: 40px;
				}
				.el-input /deep/ .el-input__inner[readonly="readonly"] {
					border: 0;
					cursor: not-allowed;
					border-radius: 0px;
					padding: 0 12px;
					box-shadow: none;
					color: rgba(85, 85, 127, 1.0);
					background: none;
					width: auto;
					font-size: 16px;
					height: 40px;
				}
				.el-input-number /deep/ .el-input__inner {
					text-align: left;
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 12px;
					box-shadow: none;
					color: inherit;
					width: auto;
					font-size: 16px;
					height: 40px;
				}
				.el-input-number /deep/ .is-disabled .el-input__inner {
					text-align: left;
					border: 0;
					cursor: not-allowed;
					border-radius: 0px;
					padding: 0 12px;
					box-shadow: none;
					color: rgba(85, 85, 127, 1.0);
					background: none;
					width: auto;
					font-size: 16px;
					height: 40px;
				}
				.el-input-number /deep/ .el-input-number__decrease {
					display: none;
				}
				.el-input-number /deep/ .el-input-number__increase {
					display: none;
				}
				.el-select {
					width: auto;
				}
				.el-select /deep/ .el-input__inner {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 10px;
					color: inherit;
					width: 100%;
					font-size: 16px;
					min-width: inherit !important;
					height: 40px;
				}
				.el-select /deep/ .is-disabled .el-input__inner {
					border: 0;
					cursor: not-allowed;
					border-radius: 0px;
					padding: 0 10px;
					box-shadow: none;
					color: inherit;
					background: none;
					width: 100%;
					font-size: 16px;
					height: 40px;
				}
				.el-date-editor {
					width: auto;
				}
				.el-date-editor /deep/ .el-input__inner {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 0 10px 0 30px;
					box-shadow: none;
					color: inherit;
					width: auto;
					font-size: 16px;
					height: 40px;
				}
				.el-date-editor /deep/ .el-input__inner[readonly="readonly"] {
					border: 0;
					cursor: not-allowed;
					border-radius: 0px;
					padding: 0 10px 0 30px;
					box-shadow: none;
					color: inherit;
					background: none;
					width: auto;
					font-size: 16px;
					height: 40px;
				}
				/deep/ .el-upload--picture-card {
					background: transparent;
					border: 0;
					border-radius: 0;
					width: auto;
					height: auto;
					line-height: initial;
					vertical-align: middle;
				}
				/deep/ .upload .upload-img {
					border: 1px solid #ddd;
					cursor: pointer;
					border-radius: 4px;
					color: #999;
					background: #fff;
					width: 80px;
					font-size: 26px;
					line-height: 60px;
					text-align: center;
					height: 60px;
				}
				/deep/ .el-upload-list .el-upload-list__item {
					border: 1px solid #ddd;
					cursor: pointer;
					border-radius: 4px;
					color: #999;
					background: #fff;
					width: 80px;
					font-size: 26px;
					line-height: 60px;
					text-align: center;
					height: 60px;
					font-size: 14px;
					line-height: 1.8;
				}
				/deep/ .el-upload .el-icon-plus {
					border: 1px solid #ddd;
					cursor: pointer;
					border-radius: 4px;
					color: #999;
					background: #fff;
					width: 80px;
					font-size: 26px;
					line-height: 60px;
					text-align: center;
					height: 60px;
				}
				/deep/ .el-upload__tip {
					color: #888;
					font-size: 16px;
				}
				.el-textarea /deep/ .el-textarea__inner {
					border: 1px solid #ddd;
					border-radius: 4px;
					padding: 12px;
					box-shadow: none;
					color: inherit;
					width: auto;
					font-size: 16px;
					min-height: 150px;
					min-width: 48%;
					height: auto;
				}
				.el-textarea /deep/ .el-textarea__inner[readonly="readonly"] {
					border: 0px solid #ddd;
					cursor: not-allowed;
					border-radius: 0px;
					padding: 12px;
					box-shadow: none;
					color: inherit;
					background: none;
					width: auto;
					font-size: 16px;
					min-height: 150px;
					min-width: 50%;
					height: auto;
				}
				/deep/ .el-input__inner::placeholder {
					color: inherit;
					font-size: inherit;
				}
				/deep/ textarea::placeholder {
					color: inherit;
					font-size: inherit;
				}
				.editor {
					background-color: #fff;
					border-radius: 0;
					padding: 0;
					box-shadow: none;
					margin: 0;
					width: 100%;
					min-height: 350px;
					border-color: #ccc;
					border-width: 1px;
					border-style: solid;
					height: auto;
				}
				.upload-img {
					object-fit: cover;
					width: 100px;
					height: 100px;
				}
				.viewBtn {
					border: 0;
					cursor: pointer;
					border-radius: 4px;
					padding: 0 20px;
					margin: 0;
					color: #fff;
					background: #848c7460;
					display: inline-block;
					width: auto;
					font-size: 14px;
					line-height: 34px;
					height: 34px;
				}
				.viewBtn:hover {
				}
				.unviewBtn {
					border: 0;
					cursor: pointer;
					padding: 0 20px;
					margin: 0;
					color: #333;
					display: inline-block;
					font-size: 14px;
					line-height: 34px;
					border-radius: 4px;
					outline: none;
					background: #eee;
					width: auto;
					height: 34px;
				}
				.unviewBtn:hover {
				}
			}
			.add-btn-item {
				padding: 0;
				margin: 20px 0;
				.submitBtn {
					border: 0;
					cursor: pointer;
					padding: 0 24px;
					margin: 0 20px 0 0;
					display: inline-block;
					font-size: 16px;
					line-height: 42px;
					border-radius: 4px;
					background: #848c74;
					width: auto;
					text-align: center;
					min-width: 120px;
					height: 42px;
					.icon {
						color: #fff;
					}
					.text {
						color: #fff;
					}
				}
				.submitBtn:hover {
					.icon {
					}
					.text {
					}
				}
				.closeBtn {
					border: 0px solid #ddd;
					cursor: pointer;
					padding: 0 24px;
					margin: 0 20px 0 0;
					color: #fff;
					display: inline-block;
					font-size: 16px;
					line-height: 42px;
					border-radius: 4px;
					background: #858585;
					width: auto;
					text-align: center;
					min-width: 120px;
					height: 42px;
					.icon {
						color: #fff;
					}
					.text {
						color: #fff;
					}
				}
				.closeBtn:hover {
					.icon {
					}
					.text {
					}
				}
			}
		}
	}
	.el-date-editor.el-input {
		width: auto;
	}
</style>
