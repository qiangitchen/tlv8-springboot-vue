import Header from "./header/index";
import Layout from "./layout/index";
import Footer from "./footer/index";
import Quick from "./quick/index";
import Count from "./count/index";
import Table from './table/index';
import Query from './query/index';
import Icon from './icon/index';
import IconPicker from './iconPicker/index';
import Demo from './demo/index'
import Authority from './authority/index'
import OrgSelectDialog from './orgSelectDialog/index'
import RoleSelectDialog from './roleSelectDialog/index'

const components = [
  Footer, Header, Layout, Quick, Count, Table, Query, Icon, IconPicker, Demo, Authority, OrgSelectDialog, RoleSelectDialog
];

const install = function (Vue) {
  if (install.installed) return
  components.map(component => Vue.component(component.name, component))
}

export default {
  install,
  Footer,
  Header,
  Layout,
  Quick,
  Count,
  Table,
  Query,
  Icon,
  IconPicker,
  Demo,
  Authority,
  OrgSelectDialog,
  RoleSelectDialog
}
