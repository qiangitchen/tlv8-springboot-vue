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
</template>
<script>
import {clearOrg, loadRecycle, reCoverOrg} from "../../api/module/system";
import {ref, createVNode} from 'vue';
import {message, Modal} from 'ant-design-vue';
import {ExclamationCircleOutlined} from '@ant-design/icons-vue';

export default {
  data() {
    /// 数据来源
    const fetch = async (param) => {
      return new Promise((resolve) => {
        loadRecycle().then(res => {
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
        label: "还原",
        event: this.reCoveChecked
      },
      {
        label: "清除",
        event: this.clearChecked
      }
    ];

    /// 字段
    const columns = [
      {title: "名称", dataIndex: "sname", key: "sname"},
      {title: "编号", dataIndex: "scode", key: "scode"},
      {title: "类型", dataIndex: "sorgkindid", key: "sorgkindid"},
      {title: "路径", dataIndex: "sfname", key: "sfname"}
    ];

    /// 行操作
    const operate = [
      {
        label: "还原",
        event: this.reCoveData
      },
      {
        label: "清除",
        event: this.deleteData
      }
    ];
    const selectedRowKeys = [];
    /// 声明抛出
    return {
      pagination: {current: 1, pageSize: 20}, // 分页配置
      fetch: fetch, // 数据回调
      table,
      toolbar: toolbar, // 工具栏
      columns: columns, // 列配置
      operate: operate, // 行操作
      scroll: {y: 240},
      loading: false,
      selectedRowKeys
    };
  },
  methods: {
    onSelectChange(selectedRowKeys) {
      this.selectedRowKeys = selectedRowKeys;
    },
    reCoveChecked() {
      if (!this.selectedRowKeys || this.selectedRowKeys.length < 1) {
        message.warn("请先选择需要恢复的组织");
        return;
      }
      let orgids = this.selectedRowKeys.join(',');
      const table = this.$refs.table;
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '确认恢复勾选的组织吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          reCoverOrg({orgids: orgids}).then(res => {
            if (res.code == 200) {
              message.info("操作成功");
              table.reload();
            } else {
              message.error(res.msg);
            }
          });
        }
      });
    },
    clearChecked() {
      if (!this.selectedRowKeys || this.selectedRowKeys.length < 1) {
        message.warn("请先选择需要清理的组织");
        return;
      }
      let orgids = this.selectedRowKeys.join(',');
      const table = this.$refs.table;
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '清除数据将会同时清除组织下的组织和人员信息，且清除后数据将不可恢复，确认清除勾选的组织吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          clearOrg({orgids: orgids}).then(res => {
            if (res.code == 200) {
              message.info("操作成功");
              table.reload();
            } else {
              message.error(res.msg);
            }
          });
        }
      });
    },
    reCoveData(record) {
      const table = this.$refs.table;
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '确认恢复【' + record.sname + '】吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          reCoverOrg({orgids: record.sid}).then(res => {
            if (res.code == 200) {
              message.info("操作成功");
              table.reload();
            } else {
              message.error(res.msg);
            }
          });
        }
      });
    },
    deleteData(record) {
      const table = this.$refs.table;
      Modal.confirm({
        title: '确认',
        icon: createVNode(ExclamationCircleOutlined),
        content: '清除数据将会同时清除组织下的组织和人员信息，且清除后数据将不可恢复，确认清除【' + record.sname + '】吗？',
        cancelText: '取消',
        okText: '确认',
        onOk() {
          clearOrg({orgids: record.sid}).then(res => {
            if (res.code == 200) {
              message.info("操作成功");
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
