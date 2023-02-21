<template>
  <div id="login">
    <div class="login-form">
      <a-form ref="formRef" :label-col="labelCol" :model="formState" :rules="formRules" :wrapper-col="wrapperCol">
        <a-form-item>
          <img class="logo" src="../../assets/image/logo.png" />
          <div class="head">TLv8 Vue</div>
          <div class="desc">快速开发框架</div>
        </a-form-item>
        <a-form-item>
          <a-input placeholder="账 户 : system" v-model:value="formState.username" />
        </a-form-item>
        <a-form-item>
          <a-input
            placeholder="密 码 : 1"
            v-model:value="formState.password"
            type="password"
            @keyup.enter="onSubmit"
          />
        </a-form-item>
        <a-form-item>
          <a-checkbox :checked="true"> 记住我 </a-checkbox>
          <a class="forgot" href=""> 忘记密码 </a>
        </a-form-item>
        <a-form-item :wrapper-col="{ span: 24 }">
          <a-button :loading="load" type="primary" @click="onSubmit">
            登录
          </a-button>
        </a-form-item>
      </a-form>
    </div>
  </div>
</template>
<script>
import { reactive, ref } from "vue";
import { useRouter } from "vue-router";
import { useStore } from "vuex";
import { message } from "ant-design-vue";
export default {
  setup() {
    const router = useRouter();
    const store = useStore();
    const formState = reactive({
      username: "system",
      password: "1",
    });

    const formRules = {
      username: [{ required: true, message: "请输入账户", trigger: "blur" }],
      password: [{ required: true, message: "请输入密码", trigger: "blur" }],
    };

    const formRef = ref();

    const load = ref(false);

    const onSubmit = async (e) => {
      formRef.value.validate().then(async () => {
          load.value = true;
          await store.dispatch("user/login", formState);
          await router.push("/");
        })
        .catch((error) => {
          console.log("error", e);
          message.error(e);
        });
    };
    return {
      labelCol: { span: 6 },
      wrapperCol: { span: 24 },
      formRules,
      formState,
      onSubmit,
      formRef,
      load,
    };
  },
};
</script>
<style lang="less">
#login {
  width: 100%;
  height: 100%;
  background: url(../../assets/image/background.svg);
  background-size: cover;
  .login-form {
    margin: auto;
    width: 340px;
    min-height: 20px;
    position: absolute;
    left: 50%;
    margin-left: -170px;
    top: 50%;
    margin-top: -300px;
    .ant-input {
      border-radius: 4px;
      line-height: 42px;
      height: 42px;
    }
    .ant-btn {
      width: 100%;
      height: 42px;
    }
  }
  .logo {
    width: 60px !important;
    margin-top: 10px !important;
    margin-bottom: 10px !important;
    margin-left: 20px !important;
    border: none;
    background-color: transparent;
  }
  .head {
    width: 300px;
    font-size: 30px !important;
    font-weight: 700 !important;
    margin-left: 20px !important;
    line-height: 60px !important;
    margin-top: 10px !important;
    position: absolute !important;
    display: inline-block !important;
    height: 60px !important;
    color: #36b368;
  }
  .desc {
    width: 100% !important;
    text-align: center !important;
    color: gray !important;
    height: 60px !important;
    line-height: 60px !important;
  }
  .forgot {
    float: right;
  }
}
</style>
