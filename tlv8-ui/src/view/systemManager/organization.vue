<template>
  <a-layout style="background: #eee">
    <a-layout-sider width="320" style="background: #eee">
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
  <a-modal
    v-model:visible="visible"
    title="添加/修改"
    :confirm-loading="confirmLoading"
  >
    <a-form
      ref="orgForm"
      :model="form"
      :rules="rules"
      :label-col="{ span: 5 }"
      :wrapper-col="{ span: 18 }"
    >
      <a-form-item ref="sname" label="名称" name="sname">
        <a-input v-model:value="form.sname"/>
      </a-form-item>
      <a-form-item ref="scode" label="编号" name="scode">
        <a-input v-model:value="form.scode"/>
      </a-form-item>
      <a-form-item ref="sorgkindid" label="类型" name="sorgkindid">
        <a-select v-model:value="form.sorgkindid" :options="orgkindids"/>
      </a-form-item>
      <a-form-item ref="sphone" label="电话" name="sphone">
        <a-input v-model:value="form.sphone"/>
      </a-form-item>
      <a-form-item ref="sfax" label="传真" name="sfax">
        <a-input v-model:value="form.sfax"/>
      </a-form-item>
      <a-form-item ref="saddress" label="地址" name="saddress">
        <a-input v-model:value="form.saddress"/>
      </a-form-item>
      <a-form-item ref="szip" label="邮编" name="szip">
        <a-input v-model:value="form.szip"/>
      </a-form-item>
      <a-form-item ref="sdescription" label="描述" name="sdescription">
        <a-input v-model:value="form.sdescription"/>
      </a-form-item>
      <a-form-item ref="ssequence" label="排序" name="ssequence">
        <a-input v-model:value="form.ssequence" type="number"/>
      </a-form-item>
    </a-form>
    <template #footer>
      <a-button key="back" @click="handleCancel">取消</a-button>
      <a-button key="submit" type="primary" :loading="loading" @click="onSubmit">提交</a-button>
    </template>
  </a-modal>
</template>
<script>
import {message, Modal} from 'ant-design-vue'
import {loadOrgTree, loadOrgList, loadOrgData} from "../../api/module/system";
import {defineComponent, ref, watch} from 'vue';
import {ApartmentOutlined, CodepenOutlined, ContactsOutlined, UserOutlined} from '@ant-design/icons-vue';
import {getOrgKindName} from "../../tools/common.js"

export default defineComponent({
  components: {
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

    /// 工具栏
    const toolbar = [
      {
        label: "新增根",
        event: this.addRoot
      },
      {
        label: "新增子",
        event: this.addChild
      },
      {
        label: "新增人员",
        event: this.addPersonnel
      },
      {
        label: "分配人员",
        event: this.assignPersonnel
      }
    ];
    const table = ref(null);
    /// 字段
    const columns = [
      {title: "序号", dataIndex: "ssequence", key: "ssequence", width: "100px", fixed: "left"},
      {
        title: "类型", dataIndex: "sorgkindid", key: "sorgkindid", width: "100px", format: record => {
          return getOrgKindName(record.sorgkindid);
        }
      },
      {title: "状态", dataIndex: "svalidstate", key: "svalidstate", width: "100px", tag: true},
      {title: "编号", dataIndex: "scode", key: "scode"},
      {title: "名称", dataIndex: "sname", key: "sname"},
      {title: "地址", dataIndex: "saddress", key: "saddress"},
      {title: "描述", dataIndex: "sdescription", key: "sdescription"}
    ];

    const pagination = ref({current: 1, pageSize: 20}); // 分页配置

    /// 行操作
    const operate = [
      {
        label: "修改",
        event: this.editData
      },
      {
        label: "移动",
        event: function (record) {
          alert("移动:" + JSON.stringify(record));
        }
      },
      {
        label: "启用/禁用",
        event: function (record) {
          alert("启用/禁用:" + JSON.stringify(record));
        }
      },
      {
        label: "重置密码",
        event: function (record) {
          alert("重置密码:" + JSON.stringify(record));
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

    const currentTreeId = ref('');
    const currentId = ref('');

    const fetch = async (param) => {
      loadTreeData()
      return new Promise((resolve) => {
        loadOrgList({pid: currentTreeId.value}).then(res => {
          resolve({
            total: res.length,
            data: res
          });
        });
      });
    };

    const rules = {
      sname: [
        {
          required: true,
          message: "请输入名称",
          trigger: "blur"
        }],
      scode: [
        {
          required: true,
          message: "请输入编号",
          trigger: "blur"
        }
      ],
      sorgkindid: [
        {
          required: true,
          message: "请选择组织类型",
          trigger: "blur"
        }
      ]
    };

    const visible = ref(false);
    const confirmLoading = ref(false);

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
      toolbar,
      table,
      columns,
      pagination,
      operate,
      reloadOrgTree,
      currentTreeId,
      currentTreeNode: {},
      fetch,
      form: ref({}),
      rules,
      visible,
      confirmLoading,
      currentId,
      loading: false,
      orgkindids: [{
        label: '机构',
        value: 'ogn'
      }, {
        label: '部门',
        value: 'dpt'
      }, {
        label: '岗位',
        value: 'pos'
      }, {
        label: '人员',
        value: 'psm'
      }]
    }
  },
  methods: {
    treeSelect(selectedKeys, e) {// 点击树查询
      this.currentTreeNode = e.node;
      this.currentTreeId = e.node.key;
      const table = this.$refs.table;
      table.reload();
    },
    reloadForm(orgKind) {
      this.form = {
        sname: "",
        scode: "",
        sorgkindid: orgKind,
        sphone: "",
        sfax: "",
        saddress: "",
        szip: "",
        sdescription: "",
        ssequence: 1,
        sparent: this.currentTreeId,
        sid: this.currentId
      };
      loadOrgData({id: this.currentId}).then(res => {
        console.log(res);
        if (res.data) {
          this.form = res.data;
        }
        this.visible = true;
      });
    },
    addRoot() {
      this.currentTreeId = '';
      this.currentId = '';
      this.reloadForm('ogn');
    },
    addChild() {
      if (!this.currentTreeId || this.currentTreeId == "") {
        Modal.warning({
          title: '提示',
          content: '未选中父节点！'
        });
      } else {

      }
    },
    addPersonnel() {
      if (!this.currentTreeId || this.currentTreeId == "" || this.currentTreeNode.orgkind == 'psm') {
        Modal.warning({
          title: '提示',
          content: '请先选中需要分配人员的组织！'
        });
      } else {

      }
    },
    assignPersonnel() {
      if (!this.currentTreeId || this.currentTreeId == "" || this.currentTreeNode.orgkind == 'psm') {
        Modal.warning({
          title: '提示',
          content: '请先选中需要分配人员的组织！'
        });
      } else {

      }
    },
    editData(record) {
      this.currentId = record.key;
      this.reloadForm(record.sorgkindid);
    },
    onSubmit() {
      this.$refs.orgForm
        .validate()
        .then(() => {
          this.loading = true;
        })
        .catch(error => {
          this.loading = false;
          console.log("error", error);
        });
    },
    handleCancel() {
      this.visible = false;
    }
  }
});
</script>
