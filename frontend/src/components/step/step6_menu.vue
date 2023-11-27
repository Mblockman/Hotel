<template>

  <section class="timer about wrapper">
    <div class="background"> </div>
    <div class="container">
      <div class="heading">
        <h5>LAST MINUTE!</h5>
        <h2> <span>Incredible!</span> Are you coming today</h2>
      </div>

      <div id="time" class="flex1 mtop"> </div>
    </div>
    <div>
      <div class="clock" style="border: none; float: left; width: 25%;"><span>%Y</span> <p>Days</p></div> 
      <div class="clock" style="border: none; float: left; width: 25%;"><span>%H</span> <p>Hours</p></div> 
      <div class="clock" style="border: none; float: left; width: 25%;"><span>%M</span> <p>Minutes</p></div> 
      <div class="clock" style="border: none; float: left; width: 25%;"><span>%S</span> <p>Seconds</p></div> 
    </div>
  </section>
    
</template>

<script>

export default {
    name : "Step6_menu",
}
</script>