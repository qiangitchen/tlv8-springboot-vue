<template>
  <a-modal
    id="org-select-dialog"
    v-model:visible="visible"
    title="组织机构选择"
    :confirm-loading="confirmLoading"
    @ok="handleOk"
  >
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
        <template #icon="{orgkind}">
          <template v-if="orgkind === 'psm'">
            <UserOutlined/>
          </template>
          <template v-else-if="orgkind === 'post' || orgkind === 'pos'">
            <ContactsOutlined/>
          </template>
          <template v-else-if="orgkind === 'dpt' || orgkind === 'dept'">
            <CodepenOutlined/>
          </template>
          <template v-else>
            <ApartmentOutlined/>
          </template>
        </template>
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
  </a-modal>
</template>

<script>
import {
  ApartmentOutlined,
  CodepenOutlined,
  ContactsOutlined,
  ExclamationCircleOutlined,
  UserOutlined
} from '@ant-design/icons-vue';
import {defineComponent, defineExpose, ref, watch} from "vue";
import {loadOrgTree} from "../../../api/module/system";

export default defineComponent({
  name: "org-select-dialog",
  components: {
    ApartmentOutlined,
    CodepenOutlined,
    ContactsOutlined,
    UserOutlined
  },
  props: {
    handleOk: {
      type: Function,
      required: false
    }
  },
  data() {
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
    const visible = ref(false);
    const confirmLoading = ref(false);
    const currentTreeNode = ref({});
    defineExpose({
      reloadOrgTree
    });
    return {
      dataList,
      searchValue,
      getParentKey,
      generateList,
      expandedKeys,
      autoExpandParent,
      treeData,
      cardLoading,
      loadTreeData,
      fetch: loadTreeData,
      watch,
      onExpand,
      reloadOrgTree,
      currentTreeNode,
      treeSelect: this.treeSelectMet,
      visible,
      confirmLoading,
      loading: false
    }
  },
  methods: {
    treeSelectMet(selectedKeys, e) {
      this.currentTreeNode = e.node;
    }
  }
});
</script>
