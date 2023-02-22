import http from '../http'
import md5 from 'js-md5'

const Api = {
  login: '/system/User/MD5login',
  logout: '/system/User/logout',
  menuList: '/getUserMenusArray',
  menuTree: '/getUserMenusTree',
}

// 获取验证码
export function getCodeImg() {
  return http.request({
    url: '/system/common/captchaimage',
    headers: {
      isToken: false
    },
    method: 'get',
    timeout: 20000
  })
}

/// 登录
export const login = data => {
  data.password = md5(data.password);
  return http.request({
    url: Api.login,
    data: data,
    method: 'post'
  })
}

/// 注销
export const logout = data => {
  return http.request({
    url: Api.logout,
    data: data,
    method: 'post'
  })
}

/// 菜单列表 (集合)
export const menuList = data => {
  return http.request({
    url: Api.menuList,
    data: data,
    method: 'post'
  })
}

/// 菜单列表 (嵌套)
export const menuTree = data => {
  return http.request({
    url: Api.menuTree,
    data: data,
    method: 'post'
  })
}
