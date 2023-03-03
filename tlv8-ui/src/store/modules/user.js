import {menuList, menuTree, login, logout} from "@/api/module/user"
import {createRouteByList, createRouteByTree} from "@/route/permission"
import {message} from "ant-design-vue"

const state = {
  token: localStorage.getItem("USER_TOKEN") != null ? localStorage.getItem("USER_TOKEN") : "",
  userInfo: localStorage.getItem('USER_INFO') != null ? localStorage.getItem('USER_INFO') : null,
  userRoutes: localStorage.getItem("USER_ROUTES") != null ? localStorage.getItem("USER_ROUTES") : [],
  userPowers: localStorage.getItem("USER_POWERS") != null ? localStorage.getItem("USER_POWERS") : []
}

if (typeof state.userInfo == "string") {
  state.userInfo = JSON.parse(state.userInfo);
}

const mutations = {
  SET_USER_TOKEN(state, token) {
    if (token) {
      state.token = token;
      localStorage.setItem('USER_TOKEN', token);
    } else {
      state.token = '';
      localStorage.removeItem('USER_TOKEN')
    }
  },
  SET_USER_INFO(state, userInfo) {
    state.userInfo = userInfo
    localStorage.setItem('USER_INFO', JSON.stringify(userInfo))
  },
  SET_USER_MENU(state, menuList) {
    if (menuList && menuList.length === 0) {
      state.userRoutes = []
      localStorage.removeItem('USER_ROUTES')
    } else {
      const finalMenu = menuList
      state.userRoutes = finalMenu
      localStorage.setItem('USER_ROUTES', JSON.stringify(finalMenu))
    }
  }
}

const actions = {
  setUserToken({commit}, token) {
    return new Promise(resolve => {
      commit('SET_USER_TOKEN', token);
      resolve()
    })
  },
  async logout({commit}) {
    await logout()
    message.success("注销成功", 0.5).then(function () {
      commit('SET_USER_TOKEN');
      commit('SET_USER_MENU');
      window.location.reload();
    });
    return Promise.resolve();
  },
  async login({commit}, data) {
    const response = await login(data)
    const {code, message, token, result: userInfo} = response
    if (code === 200) {
      delete userInfo.menuList
      delete userInfo.token
      delete userInfo.password
      commit('SET_USER_TOKEN', token)
      commit('SET_USER_INFO', userInfo)
      return Promise.resolve()
    } else {
      commit('SET_USER_TOKEN');
      commit('SET_USER_MENU');
      return Promise.reject(message)
    }
  },
  async addUserRouteForArray({state: {userRoutes}, commit}) {
    const result = await menuList()
    if (result.code === 200) {
      const dynamicRoutes = createRouteByList(result.data)
      commit('SET_USER_MENU', dynamicRoutes)
    } else {
      return Promise.reject(result.message)
    }
  },
  async addUserRouteForTree({state: {userRoutes}, commit}) {
    const result = await menuTree()
    if (result.code === 200) {
      const dynamicRoutes = createRouteByTree(result.data)
      commit('SET_USER_MENU', dynamicRoutes)
    } else {
      return Promise.reject(result.message)
    }
  }
}

export default {
  namespaced: true,
  mutations,
  actions,
  state
}
