<template>
  <div id="tag">
    <header>
      <div class="explain">
        <h1>Tag</h1>
        <!-- 例举出所有标签 -->
        <div class="tag-list">
          <p v-for="tag in tags" @click="selectTag(tag.tag)">{{ tag.tag }}</p>
        </div>
        <div class="tag-more" @click="showTagModel()">...</div>
      </div>
    </header>

    <!-- 根据标签对文章进行归类 -->
    <div class="archives-wrapper">
      <h3 class="archive-separator">共 {{total}} 篇文章与此标签相关</h3>
      <div class="archives-list">
        <div v-for="blog in blogList" class="archives-item">
          <p class="archives-time">{{ blog.date }}</p>
          <h3
            class="archives-title"
            @click="$parent.location('/details?title=' + blog.title)"
          >
            {{ blog.title }}
          </h3>
          <div class="archives-operation">
            <p class="archives-tag">{{ blog.tags[0] }}</p>
          </div>
        </div>
      </div>
    </div>

    <!-- 隐藏标签 -->
    <div class="tag-model" v-show="isshowTagModel" @click="showTagModel()">
      <div class="tag-wrapper">
        <p v-for="tag in tags" @click="selectTag(tag.tag)">{{ tag.tag }}</p>
      </div>
    </div>
  </div>
</template>

<script>
export default {
  name: "Tag",
  data() {
    return {
      isshowTagModel: false,
      tags: "",
      blogList: "",
      total:""
    };
  },

  created() {
    // 获取标签
    this.$http.get("getTags").then((res) => {
      this.tags = res.data;
      console.log("data:" + res.data);
    });
  },

  methods: {
    // 隐藏标签
    showTagModel() {
      this.isshowTagModel = !this.isshowTagModel;
    },
    // showTagModel() {
    //   this.$http.get("getTags").then((res) => {
    //     this.isshowTagModel = res.data;
    //     console.log("isshowTagModel:" + res.data);
    //   });
    // },


    // 根据标签筛选文章
    selectTag(e) {
      console.log(e);
      var key = { tag: e };
      this.$http.post("findByTag", key).then((res) => {
        this.blogList = res.data;
        this.total=res.data.length
        // console.log("blogList:" + res.data.title);
      });
    },
  },
};
</script>

<style scoped>
.tag-model {
  position: fixed;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.7);
  display: flex;
  align-items: center;
  justify-content: center;
  z-index: 2;
}
.tag-wrapper {
  width: 70%;
  display: flex;
  flex-wrap: wrap;
  background: #fff;
  padding: 15px;
  border-radius: 4px;
  box-shadow: 0 2px 5px 0 rgba(0, 0, 0, 0.16), 0 2px 10px 0 rgba(0, 0, 0, 0.12);
}
.tag-wrapper p {
  padding: 0 15px;
  margin: 5px;
  line-height: 32px;
  cursor: pointer;
}
.explain {
  position: relative;
}
.tag-more {
  position: absolute;
  bottom: 0px;
  right: 0px;
  background: #3f51b5;
  width: 60px;
  text-align: center;
  line-height: 40px;
  height: 44px;
  cursor: pointer;
}
header {
  padding: 100px 15px !important;
}
.archives-wrapper {
  margin: 0px auto 40px;
  min-height: calc(100vh - 270px);
}
.archive-separator {
  margin: 10px 0;
  color: #3f51b5;
  font-size: 16px;
  font-weight: bold;
  margin-top: 30px;
}
.main-wrapper {
  flex: 1;
  background: #f6f6f6;
  padding: 0 15px;
}
.archives-list {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-between;
}
.archives-item {
  width: calc(50% - 10px);
  box-sizing: border-box;
  padding: 16px 20px 0;
  background: #fff;
  border-radius: 3px;
  box-shadow: 0 1px 2px rgba(151, 151, 151, 0.58);
  margin-bottom: 20px;
}
.archives-time {
  margin: 0 0 10px;
  line-height: 14px;
  font-size: 13px;
  font-weight: bold;
  color: #727272;
  overflow: hidden;
}
.archives-title {
  font-size: 18px;
  margin-bottom: 0;
  padding-bottom: 16px;
}
.archives-operation {
  border-top: 1px solid #ddd;
  display: flex;
  padding: 12px 20px 8px;
  margin: 0 -20px;
}
.archives-tag {
  border-radius: 2px;
  background: #8bc34a;
  padding: 0 16px;
  line-height: 28px;
  color: rgba(255, 255, 255, 0.8);
}
.tag-list {
  display: flex;
  height: 44px;
  margin-top: 8px;
  line-height: 44px;
  overflow: hidden;
  flex-wrap: wrap;
}
.tag-list p {
  padding: 0 12px;
  color: rgba(255, 255, 255, 0.8);
}
.tag-list p:hover {
  cursor: pointer;
}
</style>
