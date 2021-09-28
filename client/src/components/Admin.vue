<template>
  <div class="edit">
    <header>
      <h2>用户中心</h2>
      <br>
      <el-button size="medium" type="primary" plain @click="$parent.location('/admin')">文章管理</el-button>
      <el-button size="medium" type="primary" plain >标签管理</el-button>
      <el-button size="medium" type="primary" plain >文章搜索</el-button>
      <el-button size="medium" type="primary" plain @click="$parent.location('/create')">创作文章</el-button>
    </header>


    <!-- 文章列表 -->
    <div class="index-wrapper">
      <ul>
        <li v-for="msg in msgs" class="blog-wrapper" >
          <p class="blog-time">{{ msg.date }}</p>
          <h3 class="blog-title" >{{ msg.title }}
          <span style= "float:right">
            <!-- 编辑/删除 -->
            <el-button-group> 
              <el-button size="small" type="primary" icon="el-icon-edit" @click="$parent.location('/edit?title=' + msg.title)"></el-button>
              <el-button size="small" type="primary" icon="el-icon-delete" @click="open();delBlog(msg.title)"></el-button>
            </el-button-group>
          </span>
          </h3>
          
          <div class="blog-content">
            {{ msg.text.slice(0, 60) }}
            <span class="blog-more" @click="$parent.location('/details?title=' + msg.title)">阅读原文...</span>
          </div>
          <div class="blog-tag">
            <ul>
              <li>{{ msg.tags[0] }}</li>
              <li>{{ msg.tags[1] }}</li>
              <li>{{ msg.tags[2] }}</li>
            </ul>
          </div>
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
import "mavon-editor/dist/css/index.css";
export default {
  name: "Admin",

  data() {
    return {
      msgs: [],
      total:0
    };
  },

  created() {
    // 获取全部文章
    this.$http.get("getHome").then((res) => {
      this.msgs = res.data;
      this.total=res.data.length
    });
  },

  methods:{
     handleClick(tab, event) {
        console.log(tab, event);
      },
    // 根据 title 删除文章
    delBlog(title){
      var req = {
        title: title,
      };
      console.log(req.title);

      this.$http.post("del", req).then((res) => {
        console.log("success");
      });
    },


    // 成功消息框
    open() {
      this.$message({
        message: "文章已删除",
        type: "success",
      });
    },
  },


};
</script>

<style scoped>
.index-wrapper {
  max-width: 960px;
  margin: 30px auto 40px;
}
.blog-wrapper {
  margin-bottom: 30px;
  padding: 12px 12px 0;
  background: #fff;
  border-radius: 3px;
  box-shadow: 0 1px 2px rgba(151, 151, 151, 0.58);
}
.blog-time {
  line-height: 24px;
  margin: 0 0 10px;
  font-size: 13px;
  font-weight: bold;
  color: #727272;
  overflow: hidden;
}
.blog-title {
  margin-bottom: 15px;
  font-size: 24px;
  line-height: 32px;
  color: #3f51b5;
}
.blog-content {
  word-break: break-all;
  padding-bottom: 20px;
  line-height: 1.8;
}
.blog-more {
  display: inline-block;
  padding: 0 6px;
  font-weight: 500;
  color: #3f51b5 !important;
  border: none !important;
  border-radius: 3px;
}
.blog-tag {
  position: relative;
  margin: 0 -12px;
  padding: 12px 20px 8px;
  border-top: 1px solid #ddd;
}
.blog-tag li {
  display: inline-block;
  margin: 0 8px 8px 0;
  border-radius: 2px;
  background: #8bc34a;
  padding: 0 16px;
  line-height: 28px;
  color: rgba(255, 255, 255, 0.8);
}
</style>
