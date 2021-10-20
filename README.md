<p align="center"><img width="150"src="http://i.imgur.com/qs9EUdv.png"></p>
<p align="center">
    <a href="https://npmjs.org/package/express-vue"><img src="https://badge.fury.io/js/express-vue.svg" alt="Version"></a>
    <a href="https://travis-ci.org/express-vue/express-vue"><img src="https://travis-ci.org/express-vue/express-vue.svg?branch=master" alt="Build Status"></a>
</p>

## 描述
此项目基于Vue2.0 + Express + Element-ui搭建的博客系统。。项目采用前后端分离，在node端加入一个server服务，模拟服务器环境，为前端提供数据来源，当用`npm run serve`命令运行前端环境时，就可以直接将前端资源部署到server服务里。前端开发端口是8080，server服务端口是3000。

主要技术栈：<br/>
- vue2.0
- vue-router
- vuex
- element-ui
- nodejs
- express



## 如何运行

下载项目
```bash
 git clone https://github.com/canfoo/vue-node-blog.git
```
 打开终端进入到client目录安装依赖包
```
 npm install
```
 再打开一个终端进入到server目录安装依赖包
```
 npm install
```
启动server服务（先启动后台服务，否则前端页面没有数据），在server目录下执行以下命令启动服务端
```
 npm run dev
```
在client目录里执行以下命令启动前端vue服务，成功执行后打开浏览器访问`http://localhost:8080`进入前端
```
 npm run serve
```

## 项目预览

主页
![4fJfwn.md.png](https://z3.ax1x.com/2021/09/28/4fJfwn.png)
根据标签分类
![4fJWes.md.png](https://z3.ax1x.com/2021/09/28/4fJWes.png)
用户中心
![4fJ5F0.md.png](https://z3.ax1x.com/2021/09/28/4fJ5F0.png)
创作中心
![4fJhoq.md.png](https://z3.ax1x.com/2021/09/28/4fJhoq.png)





## 主要目录结构
> src  //前端主要开发目录<br/>
> --assets  //存放前端静态资源<br/>
> --components  //存放组件<br/>
> --store  //vuex数据流管理<br/>
> --views  //页面试图，由vue-router引入<br/>
> --App.vue <br/>
> --main.js  //前端入口文件<br/>
> 
> server  //后台服务<br/>
> --bin  //启动后台服务配置<br/>
> --database  //存放页面所需要的json数据<br/>
> --public  //前端部署时存放在后台服务的位置<br/>
> --routes  //路由于请求接口管理<br/>
> --views  //前端模板存放位置<br/>
> --app.js  //后台服务入口<br/>



## 后台接口

本项目是前后端分离，数据存放在mongodb里，供前端调用。

1. 访问Blog首页路径： `http://localhost:8080/#/blog`

2. 部分数据接口
	- 获取home页数据
	```
	method: GET
	 	url: http://localhost:8080/#/blog
	```
	- 获取归档数据
	```
	method: GET
	 	url: http://localhost:8080/#/archives
	 	参数说明: limit为每次请求的数据数量，offset为所有数据的偏移量
	```
	- 获取根据标签划分后的数据
	```
	method: GET
	 	url: http://localhost:8080/#/tag
	```
	- 获取文章内容
	```
	method: GET
	 	url: http://localhost:8080/#/details?title=python
	 	参数说明:  title为文章标题
	```

如果觉得这个项目对你有帮助的话，请Star一下本项目，这是对作者最大的支持。
