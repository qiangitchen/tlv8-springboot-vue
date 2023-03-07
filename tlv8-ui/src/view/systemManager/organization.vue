<template>
  <a-layout style="background: #eee">
    <a-layout-sider width="300" style="background: #eee">
      <page-layout>
        <div>
          <a-input-search v-model:value="searchValue" style="margin-bottom: 8px" placeholder="输入关键字搜索"/>
          <a-card :loading="cardLoading">
            <a-tree
              v-if="treeData.length > 0"
              :expanded-keys="expandedKeys"
              :auto-expand-parent="autoExpandParent"
              :tree-data="treeData"
              @select="treeSelect"
              @expand="onExpand"
            >
              <template #title="{ title }">
                <span v-if="title.indexOf(searchValue) > -1">
                  {{ title.substr(0, title.indexOf(searchValue)) }}
                  <span style="color: #f50">{{ searchValue }}</span>
                  {{ title.substr(title.indexOf(searchValue) + searchValue.length) }}
                </span>
                <span v-else>{{ title }}</span>
              </template>
            </a-tree>
          </a-card>
        </div>
      </page-layout>
    </a-layout-sider>
    <a-layout-content>
      <page-layout>
        <a-card>
          <p-table
            :fetch="fetch"
            :value="obj"
            :columns="columns"
            :toolbar="toolbar"
            :operate="operate"
            :pagination="pagination"
          >
            <!-- 继承至 a-table 的默认插槽 -->
            <template #name="{ record }">
              {{ record.name }}
            </template>
          </p-table>
        </a-card>
      </page-layout>
    </a-layout-content>
  </a-layout>
</template>
<script setup name="organization">
import {message, Empty} from 'ant-design-vue'
import {loadOrgTree, loadOrgList} from "../../api/module/system";
import {ref, watch} from 'vue';

const dataList = [];
const searchValue = ref('');
const getParentKey = (key, tree) => {
  let parentKey;
  for (let i = 0; i < tree.length; i++) {
    const node = tree[i];
    if (node.children) {
      if (node.children.some(item => item.key === key)) {
        parentKey = node.key;
      } else if (getParentKey(key, node.children)) {
        parentKey = getParentKey(key, node.children);
      }
    }
  }
  return parentKey;
};
const generateList = data => {
  for (let i = 0; i < data.length; i++) {
    const node = data[i];
    const key = node.key;
    const title = node.title;
    dataList.push({
      key,
      title
    });
    if (node.children) {
      generateList(node.children);
    }
  }
};
const expandedKeys = ref([]);
const autoExpandParent = ref(true);
const treeData = ref([]);
const cardLoading = ref(true)
// 加载左侧的树
const loadTreeData = () => {
  loadOrgTree({}).then(res => {
    cardLoading.value = false
    if (res !== null) {
      treeData.value = res;
      generateList(res);
    }
  })
};
watch(searchValue, value => {
  const expanded = dataList.map(item => {
    if (item.title.indexOf(value) > -1) {
      return getParentKey(item.key, treeData.value);
    }
    return null;
  }).filter((item, i, self) => item && self.indexOf(item) === i);
  expandedKeys.value = expanded;
  searchValue.value = value;
  autoExpandParent.value = true;
});
const onExpand = keys => {
  expandedKeys.value = keys;
  autoExpandParent.value = false;
};
// 点击树查询
const treeSelect = (selectedKeys) => {

}
/// 工具栏
const toolbar = [
  {
    label: "新增",
    event: function (keys) {
      alert("新增操作:" + JSON.stringify(keys));
    }
  },
  {
    label: "删除",
    event: function (keys) {
      alert("批量删除:" + JSON.stringify(keys));
    }
  }
];

/// 字段
const columns = [
  {title: "序号", dataIndex: "SSEQUENCE", key: "SSEQUENCE"},
  {title: "编号", dataIndex: "SCODE", key: "SCODE"},
  {title: "名称", dataIndex: "SNAME", key: "SNAME"},
  {title: "地址", dataIndex: "SADDRESS", key: "SADDRESS"},
  {title: "描述", dataIndex: "SDESCRIPTION", key: "SDESCRIPTION"}
];

/// 行操作
const operate = [
  {
    label: "查看",
    event: function (record) {
      alert("查看详情:" + JSON.stringify(record));
    }
  },
  {
    label: "修改",
    event: function (record) {
      alert("修改事件:" + JSON.stringify(record));
    }
  },
  {
    label: "删除",
    event: function (record) {
      alert("删除事件:" + JSON.stringify(record));
    }
  }
];

const reloadOrgTree = treeNode => {
  return new Promise(resolve => {
    const param = {pid: treeNode.key};
    loadOrgTree(param).then(res => {
      treeNode.dataRef.children = res;
      treeData.value = [...treeData.value];
      resolve();
    });
  });
};
const fetch = async (param) => {
  loadTreeData()
  return new Promise((resolve) => {
    loadOrgList({pid: ""}).then(res => {
      resolve({
        total: res.length,
        data: res
      });
    });
  });
};
const pagination = {};
</script>
