const base = {
    get() {
        return {
            url : "http://localhost:8080/sportsystem/",
            name: "sportsystem",
            // 退出到首页链接
            indexUrl: 'http://localhost:8080/sportsystem/front/dist/index.html'
        };
    },
    getProjectName(){
        return {
            projectName: "体育类信息管理系统"
        } 
    }
}
export default base
