<template>
  <div id="table-dome">
    <page-header title="查询表格" describe="表格查询的复杂示例"></page-header>
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
    <page-footer></page-footer>
  </div>
</template>
<script>
import {loadMenuData, loadMenuTree} from "../../api/module/system";
import {createVNode, ref} from "vue";
import {queryDataList, removeData, saveData} from "../../api/module/common";
import {message, Modal} from "ant-design-vue";
import {ExclamationCircleOutlined} from "@ant-design/icons-vue";

export default {
  data() {
    const table = ref(null);

    /// 工具栏
    const toolbar = [
      {
        label: "新增",
        event: this.addRoot
      }
    ];

    /// 字段
    const columns = [
      {title: "名称", dataIndex: "sname", key: "sname"},
      {title: "编号", dataIndex: "scode", key: "scode"},
      {title: "类型", dataIndex: "scatalog", key: "scatalog"},
      {title: "备注", dataIndex: "sdescription", key: "sdescription"},
      {title: "排序", dataIndex: "ssequence", key: "ssequence"},
    ];

    /// 数据来源
    const fetch = async (param) => {
      console.log(param);
      return new Promise((resolve) => {
        queryDataList({
          tableName: "sa_oprole",
          keyField: "sid",
          dataOrder: "ssequence asc",
          pagination: param.pagination
        }).then(res => {
          console.log(res);
          resolve({
            total: res.data.total,
            data: res.data.data
          });
        });
      });
    };

    /// 行操作
    const operate = [
      {
        label: "修改",
        event: this.editData
      },
      {
        label: "删除",
        event: this.deleteData
      }
    ];
    let parentId = ref('');
    let currentId = ref('');
    const visible = ref(false);
    const confirmLoading = ref(false);
    const form = ref({});
    const rules = {
      label: [
        {
          required: true,
          message: "请输入名称",
          trigger: "blur"
        }],
      code: [
        {
          required: true,
          message: "请输入编号",
          trigger: "blur"
        }
      ]
    };
    const handleCancel = () => {
      visible.value = false;
    };
    /// 声明抛出
    return {
      pagination: {current: 1, pageSize: 20}, // 分页配置
      fetch: fetch, // 数据回调
      table,
      toolbar: toolbar, // 工具栏
      columns: columns, // 列配置
      operate: operate, // 行操作
      parentId,
      currentId,
      visible,
      confirmLoading,
      form,
      rules,
      displayOption: [{
        label: '展示',
        value: '',
      }, {
        label: '隐藏',
        value: 'hide',
      }, {
        label: '一直展示',
        value: 'solid',
      }],
      scroll: {y: 240},
      handleCancel,
      loading: false
    };
  },
  methods: {
    onSubmit() {
      this.$refs.ruleForm
        .validate()
        .then(() => {
          this.loading = true;
          saveData({
            tableName: "sa_oprole",
            keyField: "sid",
            keyValue: this.form.sid,
            data: this.form
          }).then(res => {
            if (res.code === 200) {
              this.form.sid = res.data;
              this.visible = false;
              message.success(res.msg);
              this.$refs.table.reload();
            } else {
              message.error(res.msg);
            }
            this.loading = false;
          });
        })
        .catch(error => {
          this.loading = false;
          console.log("error", error);
        });
    },
    resetForm() {
      this.$refs.ruleForm.resetFields();
    },
    reloadForm() {
      this.form = {
        label: "",
        code: "",
        process: "",
        activity: "",
        url: "",
        display: "",
        icon: "",
        layuiicon: "",
        sorts: 1,
        pid: this.parentId
      };
      loadMenuData({id: this.currentId}).then(res => {
        if (res.data) {
          this.form = res.data;
        }
        this.visible = true;
      });
    },
    addRoot() {
      this.parentId = '';
      this.currentId = '';
      this.reloadForm();
    },
    editData(record) {
      this.currentId = record.id;
      this.reloadForm();
    },
    deleteData(record) {
      const table = this.$refs.table;
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '确认删除【' + record.sname + '】吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          removeData({
            tableName: "sa_oprole",
            keyField: "sid",
            keyValue: record.sid,
            subDataList: [{tableName: 'sa_opauthorize', subField: 'sauthorizeroleid'}]
          }).then(res => {
            if (res.code === 200) {
              message.success(res.msg);
              table.reload();
            } else {
              message.error(res.msg);
            }
          });
        }
      });
    }
  }
};
</script>
