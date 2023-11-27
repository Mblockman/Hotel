<template>
 {{ dataChanged() }}
    <section class="home" id="home">
        <div class="container">
          <h1>Make Memories</h1>
          <p>Discover the place where you have fun & enjoy a lot</p>
    
          <div class="content grid">
            <div class="box" width=15%>
              <span>ROOM TYPE </span> <br>
              <input type="string" placeholder="방종류"  onfocus="this.value=''" list="newssources-list" v-model="selectedRoom" @keydown.enter="resetNow(selectedRoom)" v-on:mouseout="leaveNow()" />
              <datalist id="newssources-list">
               <option v-for="source in sources" v-bind:value="source.rtRoomType" v-bind:key="source.rtRoomTypeID"></option>
              </datalist>
            </div>
            <div class="box" width=15%>
              <section>
                <span>RESERVATION DATE</span> <br>
                <DatePicker
                  v-model:value="value1"
                  value-type="date"
                  format="YYYY-MM-DD"
                  type="date"
                  range
                  @change="get_data(this)"
                ></DatePicker>
              </section>
            </div>
            <div class="box" width=15%>
              <span>ADULTS</span> <br>
              <input type="number" placeholder="1">
            </div>
            <div class="box" width=15%>
              <span>CHILDREN </span> <br>
              <input type="number" placeholder="0">
            </div>
            <div class="box" width=15%>
              <button class="flex1" @click="click()">
                <span>Check Availability</span>
                <i class="fas fa-arrow-circle-right"></i>
              </button>
            </div>
          </div>
        </div>
        <div><SaveModal v-show="showModal" @close-modal="showModal = false" /></div>
        <div><guestModal v-show="modalCheck" @close-modal="modalCheck = false" @open-modal="modalCheck = true" /></div>
      </section>
    
</template>

<script>
import DatePicker from 'vue-datepicker-next';
import 'vue-datepicker-next/index.css';
import 'vue-datepicker-next/locale/ko';
import dayjs from "dayjs";
import SaveModal from '../SaveModal.vue';
import guestModal from '../guestModal.vue'

var today = new Date();
var tomorrow = new Date(today.setDate(today.getDate()+2));
let once = false;
const sleep = delay => new Promise(resolve => setTimeout(resolve, delay));

export default {
    name : "Step1_menu",

    components: {
      SaveModal,
      DatePicker,
      guestModal, 
    },
    data() {
      return {
        value1: [ new Date() , tomorrow ],
        sources:[],
        showModal: false,
        modalCheck: false,
        selectedRoom : null,
        selectData : 0,
        email: "",
        guestid:0,
        fromDay : dayjs(today).format('YYYY-MM-DD'),
        toDay : dayjs(tomorrow).format('YYYY-MM-DD'),
        roomtype : 0,
      }
    },

    methods: {
      setup(){
        this.dataChanged();
      },
      resetNow(){
      },
      leaveNow(){
      },
      async findroomrate() {
        await this.$axios.get("http://localhost:5000/api/selected/rate",
            {params:{
              DateFrom: this.fromDay,
              DateTo: this.toDay,
              RoomTypeID: this.roomtype,
            }}, // json을 json타입의 text로 변환
            {headers: {
              "Content-Type": `application/json`, // application/json 타입 선언
              },
            }
          )
          .then(response => {   
            this.rrate = response.data[0].rRate
            return;   
          })
          .catch((error) => {
            console.log(error);
            this.selectData = 0;
            return; 
          }).then(() => {
            //console.log('test1 :',this.resp.data[0].AvailableRooms);
            //return this.resp.data[0].AvailableRooms;
          });
      },
      async dataChanged() {
        if (once == true) {
          //console.log(this.sources);
          return;
        }
        once = true;
        await this.$axios.get("http://localhost:5000/api/roomtypes").then((response) => {           
          for (var i=0; i<response.data.length; i++){
            this.sources.push(response.data[i]);
          }
          console.log(this.sources);
        });
      },         
      get_data : function() {
        this.fromDay = dayjs(this.value1[0]).format('YYYY-MM-DD'); 
        this.toDay = dayjs(this.value1[1]).format('YYYY-MM-DD'); 
        console.log(this.fromDay);
        console.log(this.toDay);
      },
      async findroomidfind() {
        if (this.selectedRoom == null){
          alert("방종류를 먼저 선택해 주세요!!");
          return 0;
        } else {
          await this.$axios.get("http://localhost:5000/api/roomtypes/name/"+this.selectedRoom)
            .then(response => {
              const roomData = response.data[0].rtRoomTypeID;
            console.log("test 1",roomData, typeof roomData);
            this.roomtype = roomData;
            return roomData;
          })                            
          .catch((error) => {
            console.log(error);
            return 0;
          })
        }
      },                
      async checktypecount(){
        await this.findroomidfind();
        if (this.roomtype == 0) {
          alert("선택한 방종류를 확인해 주세요!!");
          return;
        }
        console.log("test2  : ", this.fromDay, this.toDay, this.roomtype);
        await this.$axios.get("http://localhost:5000/api/selected/typecount",
            {params:{
              DateFrom: this.fromDay,
              DateTo: this.toDay,
              RoomTypeID: this.roomtype,
            }}, // json을 json타입의 text로 변환
            {headers: {
              "Content-Type": `application/json`, // application/json 타입 선언
              },
            }
          )
          .then(response => {
            this.resp = response;
            if(this.resp.data[0].AvailableRooms > 0){
              // 예약가능한 방의 수량이 클경우
              //alert("해당 타입의 방은 예약가능합니다.");
              this.selectData = 1;
              return;      
            } else {
              console.log(this.resp.data[0].AvailableRooms);
              alert("해당 타입의 방은 이미 예약이 완료되었습니다.");
              this.selectData = 0;
              return;   
            }
          })
          .catch((error) => {
            console.log(error);
            this.selectData = 0;
            return; 
          }).then(() => {
            //console.log('test1 :',this.resp.data[0].AvailableRooms);
            //return this.resp.data[0].AvailableRooms;
          });
      },
      async click(){
        await this.checktypecount();
        if(this.selectData > 0){
          this.modalCheck = true;
        }
        sleep(3000);
        this.showModal = true;
      },        
    },
  }

</script>




