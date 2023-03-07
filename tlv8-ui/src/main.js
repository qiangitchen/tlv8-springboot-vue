import {createApp} from "vue";
import App from "./App.vue";
import Router from "./route";
import Store from "./store/index.js";
import Component from "./component/index.js";
import Antd from "ant-design-vue/es";
import i18n from './locale/index.js';
import directives from "./directive/index.js"
import * as antIcons from '@ant-design/icons-vue';

import "./assets/css/index.less";
import "ant-design-vue/dist/antd.less";

const app = createApp(App);
app.use(Antd);
app.use(Component);
app.use(i18n);
app.use(Store);
app.use(Router);
app.mount("#app");


Object.keys(directives).forEach(directive => {
  app.directive(directive, directives[directive])
})

Object.keys(antIcons).forEach(key => {
  app.component(key, antIcons[key])
})

app.config.globalProperties.$antIcons = antIcons
export default app
