import axios from "axios";
import {useStore} from "vuex";
import {notification, message as Msg} from "ant-design-vue";
import store from "../store";

axios.defaults.headers['Content-Type'] = 'application/json;charset=utf-8'

const service = axios.create({
  timeout: 6000,
  withCredentials: true,
  baseURL: "/api"
});

service.interceptors.request.use(config => {
    const isToken = (config.headers || {}).isToken === true;
    if (isToken) {
      const token = localStorage.getItem("USER_TOKEN");
      //console.log("url:" + config.url);
      //console.log("token:" + token);
      if (token) {
        config.headers["satoken"] = token; //sa-token
        config.headers["Authorization"] = 'TLv8 ' + token; //携带自定义token
      }
    }
    // 请求时缓存该请求，路由跳转时取消, 如果timeout值过大，可能在上一个次请求还没完成时，切换了页面。
    config.cancelToken = new axios.CancelToken(async cancel => {
      await store.dispatch("app/execCancelToken", {cancelToken: cancel});
    });
    return config;
  },
  error => {
    return Promise.reject(error);
  }
);
/** 响应拦截 */
service.interceptors.response.use(response => {
    // 未设置状态码则默认成功状态
    const code = response.data.code || 200;
    const msg = response.data.message || response.data.msg;
    if (response.request.responseType === 'blob' || response.request.responseType === 'arraybuffer') {
      return response.data
    }
    if (code === 401) {
      Msg.error(msg);
      localStorage.setItem("USER_TOKEN", "");
      window.location.reload();
    } else if (code !== 200) {
      Msg.error(msg);
      return Promise.reject(new Error(msg));
    }
    return response.data;
  },
  error => {
    if (error.response) {
      const data = error.response.data;
      if (error.response.status === 403) {
        notification.error({
          message: "无权限访问",
          description: data.message
        });
      }
      if (error.response.status === 401) {
        localStorage.setItem("USER_TOKEN", "");
        window.location.reload();
      }
    } else {
      let {message} = error;
      if (message === "Network Error") {
        message = "连接异常";
      }
      if (message.includes("timeout")) {
        message = "请求超时";
      }
      if (message.includes("Request failed with status code")) {
        const code = message.substr(message.length - 3);
        message = "接口" + code + "异常";
      }
      Msg.error(message);
    }
    return Promise.reject(error);
  }
);

export default service;
