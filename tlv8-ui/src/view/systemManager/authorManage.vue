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
        </div>
      </page-layout>
    </a-layout-sider>
    <a-layout-content>
      <page-layout>
        <a-card>
          <p-table
            ref="table"
            :fetch="fetch"
            :value="obj"
            :columns="columns"
            :toolbar="toolbar"
            :operate="operate"
            :pagination="pagination"
            :row-selection="{ selectedRowKeys: selectedRowKeys, onChange:onSelectChange }"
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
  <role-select-dialog
    ref="roleSelect"
    :handleOk="roleSelectOk"/>
</template>
<script>
import {loadOrgTree, loadAuthorizeByOrgID, saveAuthorize, removeAuthorizes} from "../../api/module/system";
import {createVNode, defineComponent, ref, watch} from 'vue';
import OrgSelectDialog from "../../component/orgSelectDialog";
import {
  ApartmentOutlined,
  CodepenOutlined,
  ContactsOutlined,
  ExclamationCircleOutlined,
  UserOutlined
} from "@ant-design/icons-vue";
import {message, Modal} from "ant-design-vue";

export default defineComponent({
  components: {
    OrgSelectDialog,
    ApartmentOutlined,
    CodepenOutlined,
    ContactsOutlined,
    UserOutlined
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

    const currentTreeId = ref('');
    const currentId = ref('');

    /// 工具栏
    const toolbar = [
      {
        label: "新增",
        event: this.addAuthor
      },
      {
        label: "删除",
        event: this.delAuthors
      }
    ];
    const table = ref(null);
    /// 字段
    const columns = [
      {title: "编号", dataIndex: "rcode", key: "rcode"},
      {title: "名称", dataIndex: "rname", key: "rname"},
      {title: "类型", dataIndex: "rtype", key: "rtype"},
      {title: "描述", dataIndex: "sdescription", key: "sdescription"}
    ];

    const pagination = ref({current: 1, pageSize: 20}); // 分页配置

    /// 行操作
    const operate = [
      {
        label: "删除",
        event: this.doDelete,
        render: this.canDelAuthor
      }
    ];

    const fetch = async (param) => {
      loadTreeData()
      return new Promise((resolve) => {
        loadAuthorizeByOrgID({orgid: currentTreeId.value}).then(res => {
          resolve({
            total: res.data.length,
            data: res.data
          });
        });
      });
    };

    const selectedRowKeys = [];

    const roleSelect = ref(null);

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
      watch,
      onExpand,
      reloadOrgTree,
      currentTreeId,
      currentTreeNode: {},
      fetch: fetch,
      pagination: pagination, // 分页配置
      toolbar: toolbar, // 工具栏
      columns: columns, // 列配置
      operate: operate, // 行操作
      selectedRowKeys,
      roleSelect,
      roleSelectOk: this.roleSelectHandleOk
    };
  },
  methods: {
    treeSelect(selectedKeys, e) {// 点击树查询
      this.currentTreeNode = e.node;
      this.currentTreeId = e.node.key;
      const table = this.$refs.table;
      table.reload();
    },
    addAuthor() {
      if (!this.currentTreeId || this.currentTreeId === '') {
        message.warn("请先选择需要授权的组织");
        return;
      }
      const roleSelect = this.$refs.roleSelect;
      roleSelect.visible = true;
      roleSelect.reload();
    },
    roleSelectHandleOk() {
      const roleSelect = this.$refs.roleSelect;
      let selectedRoles = roleSelect.selectedRowKeys;
      if (!selectedRoles || selectedRoles.length < 1) {
        message.warn("请选择需要授权的角色");
        return;
      }
      saveAuthorize({orgid: this.currentTreeId, roles: selectedRoles.join(',')}).then(res => {
        if (res.code === 200) {
          message.success(res.msg);
          this.$refs.table.reload();
        } else {
          message.error(res.msg);
        }
      });
      roleSelect.visible = false;
    },
    canDelAuthor(record) {
      return record.sid !== 'RL01' && this.currentTreeNode.key !== 'ORG01' && this.currentTreeNode.key !== 'PSN01@ORG01';
    },
    delAuthors() {
      if (this.selectedRowKeys.length < 1) {
        message.warn("请先勾选需要删除的数据");
        return;
      }
      const table = this.$refs.table;
      let aus = this.selectedRowKeys.join(',');
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '确认删除选中的数据吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          removeAuthorizes({aus: aus}).then(res => {
            if (res.code === 200) {
              message.success(res.msg);
              table.reload();
            } else {
              message.error(res.msg);
            }
          });
        }
      });
    },
    doDelete(record) {

    },
    onSelectChange(selectedRowKeys) {
      //console.log('selectedRowKeys changed: ', selectedRowKeys);
      this.selectedRowKeys = selectedRowKeys;
    }
  }
});
</script>
