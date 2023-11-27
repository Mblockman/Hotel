<template>
    <div class="modal-overlay">
      <div class="modal">
        <img class="check" src="../../public/theme1/assets/check-icon.png" alt="" />
        <br><br><br>
        <h5>예약이 완료되었습니다.</h5>
        <br><br>
        <a>Your Reservation is saved Successfully</a><br><br><br>
        <button class="gohome" @click="$emit('close-modal')">Go Home</button>
      </div>
      <div class="close" @click="$emit('close-modal')">
        <img class="close-img" src="../../public/theme1/assets/close-icon.png" alt="" />
      </div>
    </div>
  </template>
  
  <script>
    export default {
      //console.log(this.modalmessage)
       // const message = this.modalmessage,
   }
  </script>

<style scoped>

.modal-overlay {
  position: fixed;
  top: 0;
  bottom: 0;
  left: 0;
  right: 0;
  display: flex;
  justify-content: center;
  background-color: #000000da;
}

.modal {
  text-align: center;
  background-color: white;
  height: 500px;
  width: 500px;
  margin-top: 10%;
  padding: 60px 0;
  border-radius: 20px;
}
.close {
  margin: 10% 0 0 16px;
  cursor: pointer;
}

.close-img {
  width: 25px;
}

.check {
  width: 150px;
}
</style >