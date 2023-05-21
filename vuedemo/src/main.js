import Vue from 'vue'
//element-ui
import ElementUI from 'element-ui';
import 'element-ui/lib/theme-chalk/index.css';
import App from './App.vue'
Vue.config.productionTip = false
//bootstrap
import 'bootstrap/dist/css/bootstrap.min.css'
import 'bootstrap/dist/js/bootstrap.min.js'
Vue.use(ElementUI);

new Vue({
  render: h => h(App),
}).$mount('#app')
