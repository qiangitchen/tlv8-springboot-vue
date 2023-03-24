import request from '../http'

/// 加载功能菜单
export const loadMenuTree = data => {
  return request({
    url: "/system/Menu/loadMenuTree",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 加载功能菜单当行数据
export const loadMenuData = data => {
  return request({
    url: "/system/Menu/loadMenuData",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

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

/// 加载机构信息
export const loadOrgData = data => {
  return request({
    url: "/system/org/loadOrgData",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 保存机构信息
export const saveOrgData = data => {
  return request({
    url: "/system/org/saveOrgData",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 改变状态
export const changeOrgState = data => {
  return request({
    url: "/system/org/changeOrgState",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 移动组织
export const moveOrg = data => {
  return request({
    url: "/system/org/moveOrg",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 重置密码
export const resetPassword = data => {
  return request({
    url: "/system/person/resetPassword",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 根据角色id获取菜单权限列表
export const getPermissionsByRoleID = data => {
  return request({
    url: "/system/Role/getPermissionsByRoleID",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

//保存角色授权
export const savePermissions = data => {
  return request({
    url: "/system/Role/savePermissions",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

//根据orgId 获取授权信息
export const loadAuthorizeByOrgID = data => {
  return request({
    url: "/system/Auth/loadAuthorizeByOrgID",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

//保存授权信息
export const saveAuthorize = data => {
  return request({
    url: "/system/Auth/saveAuthorize",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

//删除授权信息
export const removeAuthorizes = data => {
  return request({
    url: "/system/Auth/removeAuthorizes",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

export const loadRecycle = data => {
  return request({
    url: "/system/org/loadRecycle",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

//【回收站】恢复数据
export const reCoverOrg = data => {
  return request({
    url: "/system/org/reCoverOrg",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

//【回收站】清除数据
export const clearOrg = data => {
  return request({
    url: "/system/org/clearOrg",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}
