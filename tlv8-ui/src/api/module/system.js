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
