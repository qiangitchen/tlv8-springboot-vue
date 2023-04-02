<template>
  <div>
    <page-layout>
      <a-card>
        <a-input-search
          v-model:value="searchValue"
          @keyup.enter.native="toFilterData"
          style="margin-bottom: 8px"
          placeholder="输入关键字按回车搜索"/>
        <p-table
          ref="table"
          :fetch="fetch"
          :value="obj"
          :columns="columns"
          :toolbar="toolbar"
          :operate="operate"
          :pagination="pagination"
          :row-selection="{ selectedRowKeys: selectedRowKeys, onChange: onSelectChange }"
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
    :maskClosable="false"
    :confirm-loading="confirmLoading"
  >
    <a-form
      ref="baseForm"
      :model="form"
      :rules="rules"
      :label-col="{ span: 5 }"
      :wrapper-col="{ span: 18 }"
    >
      <a-form-item ref="sdisplayname" label="显示名称" name="sdisplayname">

        <a-input v-model:value="form.sdisplayname"/>
      </a-form-item>
      <a-form-item ref="shost" label="主机地址" name="shost">

        <a-input v-model:value="form.shost"/>
      </a-form-item>
      <a-form-item ref="sport" label="服务端口" name="sport">

        <a-input v-model:value="form.sport"/>
      </a-form-item>
      <a-form-item ref="surl" label="访问地址" name="surl">

        <a-input v-model:value="form.surl"/>
      </a-form-item>
      <a-form-item ref="shtths" label="是否HTTPS" name="shtths">

        <a-select v-model:value="form.shtths" placeholder="">

          <a-select-option value="false">false</a-select-option>

          <a-select-option value="true">true</a-select-option>

        </a-select>
      </a-form-item>
    </a-form>
    <template #footer>
      <a-button key="back" @click="handleCancel">取消</a-button>
      <a-button key="submit" type="primary" :loading="loading" @click="onSubmit">提交</a-button>
    </template>
  </a-modal>
  <a-modal v-model:visible="testDdocVisible" title="文档服务地址测试">
    <iframe :src="docServer" style="border: none; width: 100%; height: 100%; overflow: hidden;"></iframe>
  </a-modal>
</template>
<script>
import {createVNode, ref} from "vue";
import {ExclamationCircleOutlined} from "@ant-design/icons-vue";
import {message, Modal} from "ant-design-vue";
import {queryDataList, queryData, removeData, saveData} from "/src/api/module/common";

export default {
  data() {
    const table = ref(null);

    const searchValue = ref('');

    /// 工具栏
    const toolbar = [
      {
        label: "新增",
        event: this.addRoot
      },
      {
        label: "删除",
        event: this.delDatas
      }
    ];

    /// 字段
    const columns = [{
      "dataIndex": "sdisplayname",
      "width": "80",
      "title": "显示名称",
      "key": "sdisplayname"
    }, {"dataIndex": "shost", "width": "80", "title": "主机地址", "key": "shost"}, {
      "dataIndex": "sport",
      "width": "80",
      "title": "服务端口",
      "key": "sport"
    }, {"dataIndex": "surl", "width": "80", "title": "访问地址", "key": "surl"}, {
      "dataIndex": "shtths",
      "width": "80",
      "title": "是否HTTPS",
      "key": "shtths"
    }];

    /// 数据来源
    const fetch = async (param) => {
      let that = this;
      return new Promise((resolve) => {
        queryDataList({
          tableName: "sa_docnamespace",
          keyField: "sid",
          dataOrder: "",
          searchValue: this.searchValue,
          columns: ["sdisplayname", "shost", "sport", "surl", "shtths"],//快速查询的列
          pagination: {pageSize: param.pageSize, pageNum: param.pageNum}
        }).then(res => {
          that.pagination.current = res.data.pageNum;
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
        label: '测试',
        event: this.testDocServer
      },
      {
        label: "修改",
        event: this.editData
      },
      {
        label: "删除",
        event: this.deleteData
      }
    ];
    const currentId = ref('');
    const visible = ref(false);
    const confirmLoading = ref(false);

    const form = {sid: "", "surl": "", "sdisplayname": "", "sport": "", "shtths": "", "shost": ""};

    const rules = {
      sdisplayname: [
        {
          required: true,
          message: "请输入名称",
          trigger: "blur"
        }],
      shost: [
        {
          required: true,
          message: "请输入主机地址",
          trigger: "blur"
        }
      ],
      sport: [
        {
          required: true,
          message: "请输入服务端口",
          trigger: "blur"
        }
      ],
      surl: [
        {
          required: true,
          message: "请输入服务地址",
          trigger: "blur"
        }
      ]
    };

    const handleCancel = () => {
      visible.value = false;
    };

    return {
      pagination: {current: 1, pageSize: 10}, // 分页配置
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
      selectedRowKeys: [],
      testDdocVisible:false,
      docServer: ''
    }
  },
  methods: {
    toFilterData() {
      const table = this.$refs.table;
      table.reload();
    },
    onSubmit() {
      this.$refs.baseForm
        .validate()
        .then(() => {
          this.loading = true;
          saveData({
            tableName: "sa_docnamespace",
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
      this.$refs.baseForm.resetFields();
    },
    reloadForm() {
      this.form = {sid: "", "surl": "", "sdisplayname": "", "sport": "", "shtths": "", "shost": ""};
      this.form.sid = this.currentId;
      queryData({
        tableName: "sa_docnamespace", keyField: "sid",
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
        content: '确认删除吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          removeData({
            tableName: "sa_docnamespace",
            keyField: "sid",
            keyValue: record.sid
            //级联删除配置
            //,subDataList: [{tableName: '', subField: ''}]
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
    delDatas() {
      if (this.selectedRowKeys.length < 1) {
        message.warn("请先勾选需要删除的数据");
        return;
      }
      const table = this.$refs.table;
      let rowids = this.selectedRowKeys.join(',');
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '确认删除选中的数据吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          removeData({
            tableName: "sa_docnamespace",
            keyField: "sid",
            keyValue: rowids
            //级联删除配置
            //,subDataList: [{tableName: '', subField: ''}]
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
    onSelectChange(selectedRowKeys) {
      //console.log('selectedRowKeys changed: ', selectedRowKeys);
      this.selectedRowKeys = selectedRowKeys;
    },
    testDocServer(record) {
      this.docServer = record.surl;
      this.testDdocVisible = true;
    }
  }
};
</script>
