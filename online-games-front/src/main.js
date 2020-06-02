import Vue from 'vue'
import App from './App.vue'
import VueRouter from 'vue-router'
import Signin from './components/Signin'

//import routes from './routes.js'
import VueAxios from 'vue-axios'
import {securedAxiosInstance, plainAxiosInstance} from './backend/axios'

import './assets/css/tailwind.css'


Vue.use(VueAxios, {
  secured: securedAxiosInstance,
  plain: plainAxiosInstance
})


Vue.use(VueRouter);
 const routes  = [
  { path: '/', component: Signin }
];

const router = new VueRouter({
  routes,
  mode: 'history',
})


new Vue({
  el: '#app',
  router,
  securedAxiosInstance,
  plainAxiosInstance,
  render: h => h(App)
})
