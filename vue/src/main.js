import Vue from 'vue'
// import VueFusionCharts from 'vue-fusion-charts';
// import FusionCharts from 'FusionCharts';
// import Charts from 'fusioncharts/fusioncharts.Charts'
import App from './App.vue'
import router from './router/index'
import store from './store/index'
import axios from 'axios'
import * as VueGoogleMaps from "vue2-google-maps"

// Vue.use(VueFusionCharts, FusionCharts, Charts)

Vue.config.productionTip = false

axios.defaults.baseURL = process.env.VUE_APP_REMOTE_API;
Vue.use(VueGoogleMaps, {
  load: {
    key: "AIzaSyCs0KV3vkvdaYxzfXSSszsWCmSxqguKZiE",
    libraries: "places"
  }
});

new Vue({
  router,
  store,
  render: h => h(App)
}).$mount('#app');

// const myDataSource = {
//   "chart": {
//     "caption": "Recommended Portfolio Split",
//     "subCaption": "for a net-worth of $1M",
//     "showValues":"1",
//     "showPercentInTooltip":"0",
//     "numberPrefix":"$",
//     "enableMultiSlicing":"1",
//     "theme":"fusion"
//   },
//   "data": [{
//     "label": "Equity",
//     "value": "3000"
//   }, {
//     "label": "Debt",
//     "value": "230000"
//   }, {
//     "label": "Billion",
//     "value": "3000"
//   }, {
//     "label": "Equity",
//     "value": "3000"
//   }, {
//     "label": "Equity",
//     "value": "3000"
//   }]
// };

// const chart = new Vue({
//   el: '#app',
//   data: {
//     type: 'pie2d',
//     width: '500',
//     height: '300',
//     dataFormat: 'json',
//     dataSource: myDataSource
//   }
// })



