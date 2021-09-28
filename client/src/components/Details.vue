<template>
  <div id="details">
    <header></header>

    <!-- 文章详情 -->
    <div class="details-wrapper">
      <div class="article-title">{{ msg.title }}</div>
      <div class="article-time">{{ msg.date }}</div>
      <!-- Markdown 查看器 -->
      <mavon-editor
        class="md"
        :value="msg.text"
        :subfield="false"
        :defaultOpen="'preview'"
        :toolbarsFlag="false"
        :editable="false"
        :scrollStyle="true"
        :ishljs="true"
      ></mavon-editor>
    </div>
  </div>
</template>

<script>
export default {
  name: "Details",
  data() {
    return {
      codeStyle: "monokai-sublime", //设置主题 ，
      msg: "",
    };
  },

  created() {
    // 根据 title 进行查询
    var titlt = this.$route.query.title;
    // console.log(this.$route.query.title);
    this.$http.post("getDetails", { title: titlt }).then((res) => {
      this.msg = res.data;
    });
  },
};
</script>

<style scoped>
header {
  height: 210px;
}
.md {
  box-shadow: none;
}
.v-note-wrapper.shadow {
  box-shadow: none !important;
}
.v-note-wrapper .v-note-panel .v-note-show .v-show-content,
.v-note-wrapper .v-note-panel .v-note-show .v-show-content-html {
  background: #fff !important;
}
#editor {
  margin: auto;
  width: 100%;
  height: 580px;
  margin: 15px 0;
}
.details-wrapper {
  max-width: 960px;
  margin: -110px auto 50px;
  min-height: 100px;
  box-shadow: rgba(0, 0, 0, 0.2) 0px 10px 30px;
  padding: 35px;
  background: rgb(255, 255, 255);
  border-radius: 4px;
  box-sizing: border-box;
  min-height: calc(100vh - 120px);
}
.article-title {
  font-size: 36px;
  line-height: 48px;
  font-weight: 400;
  color: rgb(33, 33, 33);
}
.article-time {
  line-height: 14px;
  font-size: 13px;
  font-weight: bold;
  color: rgb(114, 114, 114);
  margin: 8px 0px 10px;
  overflow: hidden;
}
.v-note-wrapper {
  z-index: 0 !important;
}
</style>
