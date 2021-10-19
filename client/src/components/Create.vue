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
    <br>

    <!-- 创作区域 -->
    <!-- 表单 -->
    <el-form
      :model="ruleForm"
      :rules="rules"
      ref="ruleForm"
      label-width="100px"
      class="demo-ruleForm"
    >
      <!-- 输入标题 -->
      <el-form-item label="标题" prop="name">
        <el-input v-model="ruleForm.title"></el-input>
      </el-form-item>

      <!-- 选择标签 -->
      <el-form-item label="标签">
        <el-select
          v-model="value"
          multiple
          filterable
          allow-create
          default-first-option
          placeholder="选择文章标签"
        >
          <el-option
            v-for="tag in tags"
            :key="tag.tag"
            :label="tag.tag"
            :value="tag.tag"
          >
          </el-option>
        </el-select>
      </el-form-item>

      <!-- 嵌入 Markdown 编辑器 -->
      <el-form-item label="内容">
        <mavon-editor
          style="height: 100%"
          v-model="ruleForm.text"
          @save="saveDoc"
        ></mavon-editor>
      </el-form-item>

      <!-- 提交按钮 -->
      <el-form-item>
        <el-button
          :plain="true"
          type="primary"
          @click="open();submitForm('ruleForm')"
          @click.prevent="save"
          >发布文章</el-button>

      </el-form-item>
    </el-form>
  </div>
</template>

<script>
import "mavon-editor/dist/css/index.css";

export default {
  name: "Create",

  data() {
    return {
      tags: "",
      value: [],

      ruleForm: {
        title: "",
        tag: "",
        text: "",
      },

      // 控制标题字符长度
      rules: {
        name: [
          { required: true, message: "请输入标题", trigger: "blur" },
          {
            min: 1,
            max: 50,
            message: "长度在 1 到 50 个字符",
            trigger: "blur",
          },
        ],
      },
    };
  },

  created() {
    // 获取标签
    this.$http.get("getTags").then((res) => {
      this.tags = res.data;
      // console.log(res.data);
    });
  },

  methods: {
    // 保存文章
    saveDoc() {
      console.log("保存成功");
    },

    // 发起post请求，保存数据
    save() {
      var req = {
        title: this.ruleForm.title,
        tags: this.value,
        text: this.ruleForm.text,
      };
      // console.log(req.tags);

      this.$http.post("edit", req).then((res) => {
        console.log("success");
      });
    },

    // 成功消息框
    open() {
      this.$message({
        message: "提交成功",
        type: "success",
      });
    },

    // 判断输入框是否为空
    submitForm(formName) {
      this.$refs[formName].validate((valid) => {
        if (valid) {
          alert("submit!");
        } else {
          console.log("error submit!!");
          return false;
        }
      });
    },
  },
};
</script>

<style  scoped>
</style>