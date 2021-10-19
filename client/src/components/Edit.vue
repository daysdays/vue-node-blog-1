<template>
  <div class="edit">
    <!-- 头部区域 -->
    <header>
      <h2>创作中心</h2>
      <br>
      <el-button size="medium" type="primary" plain @click="$parent.location('/admin')">文章管理</el-button>
      <el-button size="medium" type="primary" plain >标签管理</el-button>
      <el-button size="medium" type="primary" plain >文章搜索</el-button>
      <el-button size="medium" type="primary" plain @click="$parent.location('/create')">创作文章</el-button>
      <br />
    </header>
    <br />

    <!-- 创作区域 -->
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <!-- 输入标题 -->
      <el-form-item label="标题" prop="name">
        <el-input v-model="msg.title"></el-input>
      </el-form-item>

      <!-- 选择标签 -->
      <el-form-item label="标签">
        <el-select
          v-model="msg.tags"
          multiple
          filterable
          allow-create
          default-first-option
          placeholder="选择文章标签"
        >
          <el-option
            v-for="tag in msg.tags"
            :key="tag"
            :label="tag"
            :value="tag"
          >
          </el-option>
        </el-select>
      </el-form-item>

      <!-- 嵌入 Markdown 编辑器 -->
      <el-form-item label="内容">
        <mavon-editor
          style="height: 100%"
          v-model="msg.text"
          @save="saveDoc"
        ></mavon-editor>
      </el-form-item>

      <!-- 提交按钮 -->
      <el-form-item>
        <el-button
          :plain="true"
          type="primary"
          @click="open()"
          @click.prevent="save"
          >保存文章</el-button
        >
      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import "mavon-editor/dist/css/index.css";
export default {
  name: "Edit",

  data() {
    return {
      msg: {
        title: "",
        tags: "",
        text: "",
      },

      value: [],
    };
  },

  created() {
    // 根据 title 进行查询
    var titlt = this.$route.query.title;
    // console.log(this.$route.query.title);
    this.$http.post("getDetails", { title: titlt }).then((res) => {
      this.msg = res.data;
    });

    // 获取标签
    this.$http.get("getTags").then((res) => {
      this.tags = res.data;
      // console.log(res.data);
    });
  },


  methods: {
    // 发起post请求，保存数据
    save() {
      var req = {
        title: this.msg.title,
        tags: this.msg.tags,
        text: this.msg.text,
      };
      console.log(req.title);

      this.$http.post("update", req).then((res) => {
        console.log("success");
      });
    },

    // 成功消息框
    open() {
      this.$message({
        message: "更新成功",
        type: "success",
      });
    },
  },
};
</script>

<style  scoped>
</style>