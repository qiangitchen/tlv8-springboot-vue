<template>
  <div id="table-dome">
    <page-layout>
      <a-card>
        <a-input-search v-model:value="searchValue" @keyup.enter.native="toFilterData" style="margin-bottom: 8px"
                        placeholder="输入关键字搜索"/>
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
  <a-modal
    v-model:visible="visible"
    title="添加/修改"
    :confirm-loading="confirmLoading"
  >
    <a-form
      ref="ruleForm"
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
      <a-form-item ref="scatalog" label="类型" name="scatalog">
        <a-input v-model:value="form.scatalog"/>
      </a-form-item>
      <a-form-item ref="sdescription" label="备注" name="sdescription">
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
  <a-drawer
    :width="500"
    title="角色权限"
    :visible="drawerVisible"
    @close="onClose"
  >
    <template #extra>
      <a-button style="margin-right: 8px" @click="onClose">取消</a-button>
      <a-button type="primary" :loading="drawerLoading" @click="onPermission">提交</a-button>
    </template>
    <p>Some contents...</p>
    <p>Some contents...</p>
    <p>Some contents...</p>
  </a-drawer>
</template>
<script>
import {createVNode, ref, watch} from "vue";
import {queryDataList, queryData, removeData, saveData} from "../../api/module/common";
import {message, Modal} from "ant-design-vue";
import {ExclamationCircleOutlined} from "@ant-design/icons-vue";

export default {
  data() {
    const table = ref(null);

    const searchValue = ref('');

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
          searchValue: this.searchValue,
          columns: ["sname", "scode", "scatalog", "sdescription"],//快速查询的列
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
        label: "权限",
        event: this.permData
      },
      {
        label: "修改",
        event: this.editData
      },
      {
        label: "删除",
        event: this.deleteData,
        render: function (record) {//超管角色不能删除
          return record.sid !== 'RL01' && record.sid !== 'RL02' && record.sid !== 'RL02-doc';
        }
      }
    ];
    const currentId = ref('');
    const visible = ref(false);
    const confirmLoading = ref(false);
    const form = ref({});
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
      searchValue,
      currentId,
      visible,
      confirmLoading,
      form,
      rules,
      scroll: {y: 240},
      handleCancel,
      loading: false,
      drawerVisible: false,
      drawerLoading: false
    };
  },
  methods: {
    toFilterData() {
      const table = this.$refs.table;
      table.reload();
    },
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
        sid: this.currentId,
        sname: "",
        scode: "",
        scatalog: "",
        sdescription: "",
        ssequence: "",
        svalidstate: 1,
        version: 0
      };
      queryData({
        tableName: "sa_oprole", keyField: "sid",
        keyValue: this.currentId,
        data: this.form
      }).then(res => {
        if (res.data) {
          this.form = res.data;
        }
        this.visible = true;
      });
    },
    addRoot() {
      this.currentId = '';
      this.reloadForm();
    },
    editData(record) {
      this.currentId = record.sid;
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
            //删除角色时同时删除已授权的角色信息
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
    },
    permData(record) {
      this.drawerVisible = true;
    },
    onPermission() {
      this.drawerLoading = true;
    },
    onClose() {
      this.drawerVisible = false;
      this.drawerLoading = false;
    }
  }
};
</script>
