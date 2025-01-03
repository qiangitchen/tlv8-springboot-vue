import {onUnmounted} from "vue";

/**
 * 开发环境
 */
export const isNotProduction = () => {
  return import.meta.env.NODE_ENV !== 'production'
}

/**
 * 定时时间
 *
 * @param timeout   超时事件
 * @param callback  回调事件
 */
export const isTimeout = (timeout, callback) => {
  setTimeout(() => {
    callback();
  }, timeout.value * 1000);
  const Interval = setInterval(() => {
    timeout.value--;
  }, 1000);
  onUnmounted(() => {
    clearInterval(Interval);
  });
}

/**
 * 根据 当前路径 查询 所有父级 (包括当前)
 *
 * @param arr 菜单列表
 * @param id 指定路由
 */
export const findParentAll = (arr, id) => {
  const temp = []
  const forFn = function (list, path) {
    for (let i = 0; i < list.length; i++) {
      const item = list[i]
      if (item.path === path) {
        temp.push(findPathById(arr, item.id))
        forFn(list, item.parent);
        break
      } else {
        if (item.children) {
          forFn(item.children, path)
        }
      }
    }
  }
  forFn(arr, id)
  return temp
}

/**
 * 根据 当前路径 查询 所有父级
 *
 * @param arr 菜单列表
 * @param id  当前路由
 */
export const findParent = (arr, id) => {
  const temp = []
  const forFn = function (list, path) {
    for (let i = 0; i < list.length; i++) {
      const item = list[i]
      if (item.path === path) {
        let path = findPathById(arr, item.parent);
        if (path) {
          temp.push(path)
          forFn(arr, path);
        }
        break
      } else {
        if (item.children) {
          forFn(item.children, path)
        }
      }
    }
  }
  forFn(arr, id)
  return temp
}

/**
 * 根据 当前路径 查询 菜单编号
 *
 * @param arr 菜单列表
 * @param key  当前路由
 */
export const findPathById = (arr, key) => {
  let path = null;
  const forFn = function (list, id) {
    for (let i = 0; i < list.length; i++) {
      const item = list[i]
      if (item.id === id) {
        path = item.path;
      } else {
        if (item.children) {
          forFn(item.children, id)
        }
      }
    }
    return path;
  }
  return forFn(arr, key);
}

/**
 * 获取组织机构对应的名称
 * @param kind
 */
export const getOrgKindName = (kind) => {
  if (kind == 'ogn' || kind == 'org') {
    return '机构';
  } else if (kind == 'dept' || kind == 'dpt') {
    return '部门';
  } else if (kind == 'post' || kind == 'pos') {
    return '岗位';
  } else {
    return '人员';
  }
}
