<template>
    <div class="modal-wrap" id="modal">
        <div class="modal-container">
            <div class="container">

            <!-- <form class="form-basic" action=" " method="post"  id="contact_form"> -->
            <form class="form-basic" id="contact_form"> 
            <fieldset>
            
            <!-- Form Name -->
            <legend class="form-title-row">Contact Us Today!</legend>
            
            <!-- Text input-->
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label" >성</span>  
                    <input v-model="first_name" placeholder="First Name" class="form-control"  type="text" width="80%">
                </label>
            </div>
            <!-- Text input-->         
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label" >이름</span> 
                    <input v-model="last_name" placeholder="Last Name" class="form-control"  type="text">
                </label>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">주소1</span>  
                    <input v-model="Address1" placeholder="Address1" class="form-control"  type="text">
                </label>
            </div>          
            <!-- Text input-->
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">주소2</span>  
                    <input v-model="Address2" placeholder="Address2" class="form-control"  type="text">
                </label>
                    
            </div>                
            <!-- Select Basic -->    
            <div class="form-group"> 
                <label>
                    <span class="col-md-4-control-label">시도</span>
                    <select v-model="state" class="form-control selectpicker" >
                      <option value=" " >해당 지역을 선택하세요</option>
                      <option>서울특별시</option>
                      <option>부산광역시</option>
                      <option>인천광역시</option>
                      <option>대구광역시</option>
                      <option>대전광역시</option>
                      <option>광주광역시</option>
                      <option>경기도</option>
                      <option>강원도</option>
                      <option>충청북도</option>
                      <option>충청남도</option>
                      <option>경상북도</option>
                      <option>경상남도</option>
                      <option>전라북도</option>
                      <option>전라남도</option>
                      <option>제주도</option>
                    </select>
                </label>
              </div>  
            <!-- Text input-->
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">우편번호</span>  
                    <input v-model="zipcode" placeholder="ZipCode" class="form-control"  type="text">
                </label>
            </div>     
            <!-- Text input-->
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">국가</span>  
                    <input v-model="country" placeholder="대한민국" class="form-control"  type="text">
                </label>
            </div> 
            
            <!-- Text input-->                  
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">전화번호</span>  
                    <input v-model="phone" placeholder="(845)555-1212" class="form-control" type="text">
                </label>
            </div>
            <!-- Text input-->                  
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">핸드폰</span>  
                    <input v-model="handphone" placeholder="010-1234-1212" class="form-control" type="text">
                </label>
            </div>
            <!-- Text input-->
            <div class="form-group">
                <label>
                    <span class="col-md-4-control-label">E-Mail</span>  
                    <input v-model="email" placeholder="E-Mail Address" class="form-control"  type="text">
                </label>  
            </div>
    
            <!-- radio checks -->
             <div class="form-group">
                 <label class="radio">
                    <span class="form-radio-buttons" >성별</span>
                    <!-- <input type="radio" v-model="mgender" value="yes" checked /> 남 
                    <input type="radio" v-model="fgender" value="no" /> 여 -->
                    <input type="radio" :checked="radio === '남'" value="남" @change="radio = $event.target.value" /> 남
                    <input type="radio" :checked="radio === '여'" value="여" @change="radio = $event.target.value" /> 여
                </label>
            </div>
                      
            <!-- Success message -->
            <div class="alert alert-success" role="alert" id="success_message">등록 :<i class="glyphicon glyphicon-thumbs-up"></i> 원할한 예약을 위해 예약정보를 입력해 주세요.</div>
            
            <!-- Button -->
            <div class="modal-btn">
                
                <button type="submit" class="btn-saving" @click="saveData">저장</button> 
                <button type="submit" class="btn-canceling" @click="closeModal">취소</button>
            </div>            
            
            </fieldset>
            </form>
            </div>          
          
        </div>
      </div>
</template>

<script>
export default {
   data () {
      return {
        first_name:"",
        last_name: "",
        Address1: "",
        Address2: "",
        state:"",
        zipcode:"",
        country: "",
        phone: "",
        handphone: "",
        email: "",
        radio: "남"
    }
  },
  methods: {
    closeModal() {
      this.$emit('close-modal');
      this.$parent.selectData = 0;
    },

    async checkguestid(){
        alert("시작");
        if (this.email == ""){
          return;
        } else {
          await this.$axios.get("http://localhost:5000/api/guests/email/"+this.email)
            .then(response => {
            this.$parent.guestid = response.data[0].gGuestID;
            console.log(response.data[0].gGuestID);
            alert("Guest ID is "+this.$parent.guestid);
          })                            
          .catch((error) => {
            console.log(error);
            return;
          })
        }
    },
    async makebooking(){
        if (this.$parent.guestid == 0) {
          alert("정보부족으로 예약이 불가합니다.\n다시시작해 주세요");
          return;
        }
        await this.$axios.post("http://localhost:5000/api/bookings",
            {
                "bHotelID": 1,
                "bGuestID": this.$parent.guestid,
                "bReservationAgentID": null,
                "bDateFrom": this.$parent.fromDay + "T06:00:00.000Z",
                "bDateTo": this.$parent.toDay + "T01:00:00.000Z",
                "bRoomCount": 1,
                "bBookingStatusID": 2
            })
          .then(response => {
            console.log(response);
            alert('예약되었습니다.');
          })
          .catch((error) => {
            console.log(error);
            //alert('에러 발생');
            return;
          }).then(() => {
            //alert('결과 확인');
          });
    },
    async saveData() {
        await this.saveguest();
    },
    async saveguest() {
      if (this.email == "") {
          alert("정보부족으로 고객등록이 불가합니다.\n다시시작해 주세요");
          return;
      }
      this.$parent.email =  this.email;
      await this.$axios.post("http://localhost:5000/api/selected/booking",
            {
                "FromDate": this.$parent.fromDay,
                "ToDate" : this.$parent.toDay,
                "RoomType": this.$parent.roomtype,
                "gFirstName": this.first_name,
                "gLastName": this.last_name,
                "gAddress": this.Address1,
                "gAddress2": this.Address2,
                "gCity": this.state,
                "gState": this.state,
                "gZipCode": this.zipcode,
                "gCounty": this.country,
                "gHomePhoneNumber": this.phone,
                "gCellularNumber": this.handphone,
                "geMailAddress": this.email,
                "gGender": this.radio==='남'?'M':'F'
            })
          .then(response => {
            console.log(response);
            this.$parent.email = this.email;
          })
          .catch((error) => {
            console.log(error);
            this.$parent.guestid = 0;
            //alert('에러 발생');
            return;
          }).then(() => {
            //alert('결과 확인');
          });      
    } 

  },
};
</script>

<style>
/* dimmed */
.modal-wrap {
  position: fixed;
  left: 0;
  top: 0;
  width: 100%; 
  height: 100%;
  background: rgba(0, 0, 0, 0.4);
}
/* modal or popup */
.modal-container {
  position: relative;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 650px;
  background: #fff;
  border-radius: 10px;
  padding: 20px;
  box-sizing: border-box;
}

.form-basic{
    /*max-width: 750px;*/
    margin: 0 auto;
    padding-top: 30px;
    padding-bottom: 30px;
    box-sizing: border-box;
    background-color:  #ffffff;
    box-shadow: 0 1px 3px 0 rgba(0, 0, 0, 0.1);
    font: bold 14px sans-serif;
    text-align: center;
}

.form-basic .form-group{
    text-align: left;
    margin-bottom: 22px;
}

.form-basic .form-title-row{
    text-align: center;
    margin-left: 15px;
    margin-right: 15px;
    margin-bottom: 15px;
}

/* The form title */

.form-basic h1{
    display: inline-block;
    box-sizing: border-box;
    color:  #4c565e;
    font-size: 24px;
    padding: 0 10px 15px;
    border-bottom: 2px solid #6caee0;
    margin: 0;
    position: absolute;
}


.form-basic .form-group > label span{
    display: inline-block;
    box-sizing: border-box;
    color: #5F5F5F;
    width: 120px;
    text-align: right;
    vertical-align: top;
    padding: 12px 25px;
}

.form-basic input{
    color:  #5f5f5f;
    box-sizing: border-box;
    width: 390px;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 12px 8px;
    border: 1px solid #dbdbdb;
}

.form-basic input[type=radio],
.form-basic input[type=checkbox]{
    box-shadow: none;
    width: auto;
}

.form-basic input[type=checkbox]{
    margin-top: 13px;
}

.form-basic select{
    background-color: #ffffff;
    color:  #5f5f5f;
    box-sizing: border-box;
    width: 390px;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 12px 8px;
    border: 1px solid #dbdbdb;
}

.form-basic textarea{
    color:  #5f5f5f;
    box-sizing: border-box;
    width: 240px;
    height: 80px;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    font: normal 13px sans-serif;
    padding: 12px;
    border: 1px solid #dbdbdb;
    resize: vertical;
}

.form-basic .form-radio-buttons{
    display: inline-block;
    vertical-align: top;
}

.form-basic .form-radio-buttons > div{
    margin-top: 10px;
}

.form-basic .form-radio-buttons label span{
    margin-left: 8px;
    color: #5f5f5f;
    font-weight: normal;
}

.form-basic .form-radio-buttons input{
    width: auto;
}

.form-basic button{
    background-color:  #6caee0;
    color: #ffffff;
    font-weight: bold;
    box-shadow: 1px 2px 4px 0 rgba(0, 0, 0, 0.08);
    padding: 14px 22px;
    border: 0;
    margin: 30px 23px 0;
    margin-bottom: 20px;
}

</style>