<template>
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
  <a-modal
    v-model:visible="visible"
    title="添加/修改"
    :maskClosable="false"
    :confirm-loading="confirmLoading"
  >
    <a-form
      ref="ruleForm"
      :model="form"
      :rules="rules"
      :label-col="{ span: 5 }"
      :wrapper-col="{ span: 18 }"
    >
      <a-form-item ref="label" label="名称" name="label">
        <a-input v-model:value="form.label"/>
      </a-form-item>
      <a-form-item ref="code" label="编号" name="code">
        <a-input v-model:value="form.code"/>
      </a-form-item>
      <a-form-item ref="i18n" label="i18n" name="i18n">
        <a-input v-model:value="form.i18n"/>
      </a-form-item>
      <a-form-item ref="process" label="process" name="process">
        <a-input v-model:value="form.process"/>
      </a-form-item>
      <a-form-item ref="activity" label="activity" name="activity">
        <a-input v-model:value="form.activity"/>
      </a-form-item>
      <a-form-item ref="url" label="路径" name="url">
        <a-input v-model:value="form.url"/>
      </a-form-item>
      <a-form-item ref="display" label="展示类型" name="display">
        <a-select v-model:value="form.display" :options="displayOption"/>
      </a-form-item>
      <a-form-item ref="icon" label="图标" name="icon">
        <a-input v-model:value="form.icon"/>
      </a-form-item>
      <a-form-item ref="layuiicon" label="样式图标" name="layuiicon">
        <a-input v-model:value="form.layuiicon"/>
      </a-form-item>
      <a-form-item ref="sorts" label="序号" name="sorts">
        <a-input v-model:value="form.sorts" type="number"/>
      </a-form-item>
    </a-form>
    <template #footer>
      <a-button key="back" @click="handleCancel">取消</a-button>
      <a-button key="submit" type="primary" :loading="loading" @click="onSubmit">提交</a-button>
    </template>
  </a-modal>
</template>
<script>
import {loadMenuData, loadMenuTree} from "../../api/module/system";
import {ref, createVNode} from 'vue';
import {message, Modal} from 'ant-design-vue';
import {ExclamationCircleOutlined} from '@ant-design/icons-vue';
import {saveData, removeData} from "../../api/module/common";

export default {
  data() {
    /// 数据来源
    const fetch = async (param) => {
      return new Promise((resolve) => {
        loadMenuTree().then(res => {
          resolve({
            total: res.data.length,
            data: res.data
          });
        });
      });
    };

    const table = ref(null);

    /// 工具栏
    const toolbar = [
      {
        label: "新增根目录",
        event: this.addRoot
      }
    ];

    /// 字段
    const columns = [
      {title: "名称", dataIndex: "label", key: "label"},
      {title: "编号", dataIndex: "code", key: "code"},
      {title: "i18n", dataIndex: "i18n", key: "i18n"},
      {title: "process", dataIndex: "process", key: "process"},
      {title: "activity", dataIndex: "activity", key: "activity"},
      {title: "路径", dataIndex: "url", key: "url"},
      {
        title: "展示类型", dataIndex: "display", key: "display", format: (record) => {
          if (!record.display || record.display === '') {
            return '展示';
          } else if (record.display === 'hide') {
            return '隐藏';
          } else {
            return '一直展示';
          }
        }
      },
      {title: "图标", dataIndex: "icon", key: "icon"},
      {title: "样式图标", dataIndex: "layuiicon", key: "layuiicon"},
      {title: "序号", dataIndex: "sorts", key: "sorts"},
    ];

    /// 行操作
    const operate = [
      {
        label: "新增",
        event: this.addChild
      }, {
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
      ],
      i18n: [
        {
          required: true,
          message: "请输入多语言编号",
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
            tableName: "sa_opmenutree",
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
        i18n: "",
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
    addChild(record) {
      this.parentId = record.id;
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
        content: '确认删除【' + record.label + '】吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          removeData({
            tableName: "sa_opmenutree",
            keyField: "sid",
            keyValue: record.sid,
            subDataList: [{tableName: 'sa_opmenutree', subField: 'pid'}]
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
