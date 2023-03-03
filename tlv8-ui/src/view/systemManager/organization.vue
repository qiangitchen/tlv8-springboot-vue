<template>
  <a-layout style="background: #eee">
    <a-layout-sider width="300" style="background: #eee">
      <page-layout>
        <a-card>
          <a-tree
            :tree-data="treeData"
          />
        </a-card>
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
<script>
import {DownOutlined, SmileOutlined, FrownOutlined, FrownFilled} from '@ant-design/icons-vue';
import {defineComponent, ref} from 'vue';
import {loadOrgTree} from "../../api/module/system";

const dataItem = {
  key: "1",
  name: "Joe Black",
  sex: "boy",
  age: 32,
  createTime: "2020-02-09 00:00:00",
  address: "Sidney No. 1 Lake Park Sidney No. 1 ",
  tags: ["cool", "teacher"],
};
export default defineComponent({
  components: {
    DownOutlined,
    SmileOutlined,
    FrownOutlined,
    FrownFilled,
  },
  setup() {
    /// 数据来源 [模拟]
    const fetch = async (param) => {
      return new Promise((resolve) => {
        setTimeout(() => {
          resolve({
            total: 100,
            data: new Array(param.pageSize).fill(dataItem),
          });
        }, 900);
      });
    };
    /// 工具栏
    const toolbar = [
      {
        label: "新增",
        event: function (keys) {
          alert("新增操作:" + JSON.stringify(keys));
        },
      },
      {
        label: "删除",
        event: function (keys) {
          alert("批量删除:" + JSON.stringify(keys));
        },
      },
      {
        label: "更多操作",
        children: [
          {
            label: "批量导入",
            event(keys) {
              alert("批量导入");
            },
          },
          {
            label: "批量导出",
            event(keys) {
              alert("批量导出");
            },
          },
        ],
      },
    ];

    /// 字段
    const columns = [
      {
        title: "姓名",
        dataIndex: "name",
        key: "name",
        slots: {customRender: "name"},
      },
      {title: "性别", dataIndex: "sex", key: "sex"},
      {title: "年龄", dataIndex: "age", key: "age"},
      {title: "地址", dataIndex: "address", key: "address"},
    ];

    /// 行操作
    const operate = [
      {
        label: "查看",
        event: function (record) {
          alert("查看详情:" + JSON.stringify(record));
        },
      },
      {
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
      },
      {
        label: "更多",
        children: [
          {
            label: "导出",
            event: function (record) {
              alert("导出");
            },
          },
          {
            label: "下载",
            event: function (record) {
              alert("下载");
            },
          },
        ],
      },
    ];
    const treeData = [];
    return {
      treeData,
      pagination: {current: 1, pageSize: 16}, // 分页配置
      fetch: fetch, // 数据回调
      toolbar: toolbar, // 工具栏
      columns: columns, // 列配置
      operate: operate, // 行操作
    };
  },
  created() {
    loadOrgTree().then(res => {
      this.$set(this.treeData, res);
    });
  }
});
</script>
