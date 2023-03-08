<template>
  <div id="table-dome">
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
    <page-footer></page-footer>
  </div>
</template>
<script>
import {loadMenuTree} from "../../api/module/system";
import {ref} from 'vue';

export default {
  setup() {
    /// 数据来源
    const fetch = async (param) => {
      return new Promise((resolve) => {
        loadMenuTree().then(res => {
          console.log(res)
          resolve({
            total: res.data.length,
            data: res.data
          });
        });
      });
    };

    /// 工具栏
    const toolbar = [
      {
        label: "新增根目录",
        event: function (keys) {
          alert("新增操作:" + JSON.stringify(keys));
        },
      }
    ];

    /// 字段
    const columns = [
      {title: "名称", dataIndex: "label", key: "label"},
      {title: "图标", dataIndex: "icon", key: "icon"},
      {title: "样式图标", dataIndex: "layuiicon", key: "layuiicon"},
      {title: "process", dataIndex: "process", key: "process"},
      {title: "activity", dataIndex: "activity", key: "activity"},
      {title: "展示类型", dataIndex: "display", key: "display"},
    ];

    /// 行操作
    const operate = [
      {
        label: "新增",
        event: function (record) {
          alert("新增事件:" + JSON.stringify(record));
        },
      }, {
        label: "修改",
        event: function (record) {
          alert("修改事件:" + JSON.stringify(record));
        },
      },
      {
        label: "删除",
        event: function (record) {
          alert("删除事件:" + JSON.stringify(record));
        },
      }
    ];
    const rowSelection = ref({
      checkStrictly: true,
      onChange: (selectedRowKeys, selectedRows) => {
        console.log(`selectedRowKeys: ${selectedRowKeys}`, 'selectedRows: ', selectedRows);
      },
      onSelect: (record, selected, selectedRows) => {
        console.log(record, selected, selectedRows);
      },
      onSelectAll: (selected, selectedRows, changeRows) => {
        console.log(selected, selectedRows, changeRows);
      },
    });
    /// 声明抛出
    return {
      pagination: {current: 1, pageSize: 10}, // 分页配置
      fetch: fetch, // 数据回调
      toolbar: toolbar, // 工具栏
      columns: columns, // 列配置
      operate: operate, // 行操作
      rowSelection
    };
  },
};
</script>
