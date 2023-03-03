import request from '../http'

/// 加载机构树
export const loadOrgTree = data => {
  return request({
    url: "/system/org/orgTree",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 加载机构列列表
export const loadOrgList = data => {
  return request({
    url: "/system/org/orgList",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}
