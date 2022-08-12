<template>
  <div class="home">
  <div id="banner">
    <h1> T.I.P.S. ensures the roads are safe!</h1>
    <h3>Submit a TIP of a pothole to repair today!</h3>
  
</div>
  </div>
</template>

<script>
export default {
  name: "home"
};
</script>
<style scoped>
.home{
 /* background-image:url("../assets/pothole-2.jpg"); */

 opacity:100%;


  background-repeat:no-repeat;
  background-size: cover;
  height: 100vh;
  display:flex;
  justify-content: center;
  align-items:center;
  
  }
  h1{
     text-align: center;
     color: white
    
  }
  h3{
    text-align: center;
    color: white;
  }
  #banner{
    display: flex;
          background-color:darkgrey;
  opacity: 85%;
-webkit-box-shadow: 1px 3px 8px 11px rgba(43,49,57,0.85); 
box-shadow: 1px 3px 8px 11px rgba(43,49,57,0.85);
 
  border-radius: 7%;
  width:25%;
  flex-direction: column;
  
  
  }
   


</style>
