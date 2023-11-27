import { createApp, reactive } from 'vue'
import App from './App.vue'
import axios from "axios";

const app = createApp(App);
const globalState = reactive({
    $paths: ""
  });
app.config.globalProperties.$state = globalState;
app.config.globalProperties.$axios = axios;
app.config.globalProperties.modalmessage = "";
app.mount('#app');