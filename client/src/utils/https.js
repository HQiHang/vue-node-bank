import axios from 'axios'
import { Loading, Message } from "element-ui";
axios.defaults.timeout = 10000;

let loading;

function startLoading(){
    loading = Loading.service({
        lock: true,
        text: '加载中...',
        background: 'rgba(0, 0, 0, 0.7)'
    });
}

function endLoading(){
    loading.close();
}

axios.interceptors.request.use(config => {
    startLoading();
    return config;
}, error => {
    return Promise.reject(error);
});

axios.interceptors.response.use(response => {
    const status = response.data.status;
    if(status === 404){
        Message.error(response.data.msg);
    }
    endLoading();
    return response;
}, error => {
    endLoading();
    const { status } = error.response;
    if(status === 500){
        Message.error('服务器异常！');
    }else if(error.message.includes('timeout')){
        Message.error('请求超时，请检查网络！');
    }
    return Promise.reject(error);
});
export default axios;