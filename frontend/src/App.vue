<template>
  <!-- <img alt="Vue logo" src="./assets/logo.png">
  <HelloWorld msg="Welcome to Your Vue.js App"/> -->
  <Header_step/>
  <Step1_menu></Step1_menu>
  <Step2_menu></Step2_menu>
  <Step3_menu></Step3_menu>
  <Step4_menu></Step4_menu>
  <Step5_menu></Step5_menu>
  <Step6_menu></Step6_menu>
  <Step7_menu></Step7_menu>
  <Step8_menu></Step8_menu>  
  <Step9_menu></Step9_menu>   
  <Step10_menu></Step10_menu>  
  <Step11_menu></Step11_menu>    
  <Step12_menu></Step12_menu>    
  <Step13_menu></Step13_menu>   
  <Footer_step></Footer_step>  
  <SaveModal v-show="showModal" />
</template>

<script>
//import HelloWorld from './components/HelloWorld.vue'
import Header_step from './components/step/header_step.vue'
import Step1_menu from './components/step/step1_menu.vue'
import Step2_menu from './components/step/step2_menu.vue'
import Step3_menu from './components/step/step3_menu.vue'
import Step4_menu from './components/step/step4_menu.vue'
import Step5_menu from './components/step/step5_menu.vue'
import Step6_menu from './components/step/step6_menu.vue'
import Step7_menu from './components/step/step7_menu.vue'
import Step8_menu from './components/step/step8_menu.vue'
import Step9_menu from './components/step/step9_menu.vue'
import Step10_menu from './components/step/step10_menu.vue'
import Step11_menu from './components/step/step11_menu.vue'
import Step12_menu from './components/step/step12_menu.vue'
import Step13_menu from './components/step/step13_menu.vue'
import Footer_step from './components/step/footer_step.vue'
import SaveModal from './components/SaveModal.vue'


export default {
  name: 'App',
  components: {
    // HelloWorld,
    Header_step,
    Step1_menu,
    Step2_menu,
    Step3_menu,
    Step4_menu,
    Step5_menu,
    Step6_menu,
    Step7_menu,
    Step8_menu,
    Step9_menu,
    Step10_menu,
    Step11_menu,
    Step12_menu,
    Step13_menu,
    Footer_step,
    SaveModal,
},
data() {
    return {
      showModal: false,
    }
  },
  /*
  beforeMount() {
    this.getData(); // Ensure this is being called
  },
  methods: {
    getData() {
      this.$axios
        .get("http://localhost:5000/api/hotels")
        .then((res) => {
          //console.log(res.staus);
          //console.log(res.data[0].hImagePath);
          this.$state.$paths = res.data[0].hImagePath;
          console.log(this.$state.$paths);
        })
        .catch((error) => {
          console.log(error);
        });
    },
  },
  setup(){
    this.$axios
        .get("http://localhost:5000/api/hotels")
        .then((res) => {
          //console.log(res.staus);
          //console.log(res.data[0].hImagePath);
          this.$state.$paths = res.data[0].hImagePath;
          console.log(this.$state.$paths);
        })
  },*/
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
