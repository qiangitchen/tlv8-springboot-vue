import request from '../http'
import md5 from 'js-md5'

const Api = {
  login: '/system/User/MD5login',
  logout: '/system/User/logout',
  menuList: '/system/User/getUserMenusArray'
}

// 获取验证码
export function getCodeImg() {
  return request({
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
  return request({
    url: Api.login,
    headers: {
      isToken: false
    },
    data: data,
    method: 'post'
  })
}

/// 注销
export const logout = data => {
  return request({
    url: Api.logout,
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 菜单列表 (集合)
export const menuList = data => {
  return request({
    url: Api.menuList,
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

/// 菜单列表 (嵌套)
export const menuTree = data => {
  return request({
    url: Api.menuTree,
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}
