import request from '../http'

export const saveData = data => {
  return request({
    url: "/common/saveData",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

export const removeData = data => {
  return request({
    url: "/common/removeData",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

export const queryData = data => {
  return request({
    url: "/common/queryData",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}

export const queryDataList = data => {
  return request({
    url: "/common/queryDataList",
    headers: {
      isToken: true
    },
    data: data,
    method: 'post'
  })
}
