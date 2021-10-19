<template>
  <div>
    <!-- 头部区域 -->
    <header>
      <div class="explain">
        <h1>About</h1>
        <div class="tag-list">
          <p class="tag-active">about me</p>
        </div>
      </div>
    </header>

    <!-- 信息板块 -->
    <div class="index-wrapper">
      <div>
        <ul class="blog-wrapper">
          <li>
            <h2 class="blog-title">基本信息：{{ msg.name }}</h2>
            <p>昵称：Banana</p>
            <p>学历：大专</p>
            <p>专业：大数据技术与应用</p>
            <br />
          </li>
        </ul>
      </div>
      <br />

      <div>
        <ul>
          <li class="blog-wrapper">
            <h2 class="blog-title">教育背景：{{ msg.hobby }}</h2>
            <p>在校情况：2019-至今</p>
            <p>相关课程：python设计与开发，java数据结构</p>
            <br />
          </li>
        </ul>
      </div>
      <br />

      <div>
        <ul>
          <li class="blog-wrapper">
            <h2 class="blog-title">技能：</h2>
            <p>
              1. 熟悉 Hadoop 大数据平台的搭建与配置，日常维护与优化。<br />
              2. 掌握 Python 语言及面向对象的设计思想。<br />
              3. 擅长 Python 爬虫以及数据分析与可视化。<br />
              4. 熟悉 Web Service 技术，前端方面了解 html，css，JavaScript。<br />
              5. 能够基于 Node.js 与 Vue 框架进行开发。<br />
              6. 熟悉使用 Linux 系统，用来搭建环境以及部署工作。<br />
              7. 熟悉 MySQL，MongoDB 的操作。<br />
              8. 熟悉面向对象开发，理解函数式编程，有良好编码习惯。
            </p>
            <br />
          </li>
        </ul>
      </div>
      <br />

      <div>
        <ul>
          <li class="blog-wrapper">
            <h2 class="blog-title">项目经验：</h2>
            <p>
              2021 年 5 月 二手房数据分析
              (https://github.com/yangyezhuang/Python)<br />
              <b>项目描述：</b><br />
              &emsp;&emsp;对五个一线城市的二手房的价格以及二手房购置指标解析分析。
              并将分析结果实现可视化展示。<br />
              <b>技术描述：</b><br />
              &emsp;&emsp;使用技术：Python，pandas，numpy，pyecharts<br />
              <b>开发描述：</b><br />
              &emsp;&emsp;1. 使用 Python
              异步方法处理网络请求，提高效率，加快爬取速度。<br />
              &emsp;&emsp;2. 通过 pandas 与 numpy
              对数据进行清洗，删除脏数据。<br />
              &emsp;&emsp;3. 让 pyecharts
              获取结果，绑定数据，实现数据可视化。<br />
              &emsp;&emsp;4. 生成动态 html 文件，并部署到托管主机上。
            </p>
            <br />
          </li>
        </ul>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "About",

  data() {
    return {
      msg: "",
    };
  },

  created() {
    this.$http.get("about").then((res) => {
      this.msg = res.data;
    });
  },
};
</script>

<style  scoped>
.index-wrapper {
  max-width: 960px;
  margin: 30px auto 40px;
}
.blog-title {
  margin-bottom: 15px;
  font-size: 24px;
  line-height: 32px;
  color: #3f51b5;
}
.blog-wrapper {
  margin-bottom: 30px;
  padding: 12px 12px 0;
  background: #fff;
  border-radius: 3px;
  box-shadow: 0 1px 2px rgba(151, 151, 151, 0.58);
}
</style>