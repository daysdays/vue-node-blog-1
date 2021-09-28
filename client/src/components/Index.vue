<template>
  <div>
    <header>
      <div class="explain">
        <h1>Banana's Blog</h1>
        <h5>把握现在，就是创造未来</h5>
      </div>
    </header>

    <!-- 文章列表 -->
    <div class="index-wrapper">
      <ul>
        <!-- 点击文章标题转跳到详情页 -->
        <li v-for="msg in msgs" class="blog-wrapper" @click="$parent.location('/details?title=' + msg.title)">
          <p class="blog-time">{{ msg.date }}</p>
          <h3 class="blog-title">{{ msg.title }}</h3>
          <div class="blog-content">
            {{ msg.text.slice(0, 60) }}
            <span class="blog-more">阅读原文...</span>
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
export default {
  name: "index",
  data() {
    return {
      msgs: [],
    };
  },

  created() {
    // 获取全部文章
    this.$http.get("getHome").then((res) => {
      this.msgs = res.data;
    });
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
