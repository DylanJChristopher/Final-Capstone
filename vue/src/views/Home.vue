<template>
  <div class="home">
  <div id="banner" >
    <h1> T.I.P.S. ensures the roads are safe!</h1>
    <h2>Submit a TIP of a pothole today!</h2>
  
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
  h2{
    text-align: center;
    color: black
  }
  #banner{
    display: flex;
          background-color:green;
  opacity: 85%;
-webkit-box-shadow: 1px 3px 8px 11px rgba(43,49,57,0.85); 
box-shadow: 1px 3px 8px 11px rgba(43,49,57,0.85);
  /* border-radius: 7%; */
  /* width:25%; */
  flex-direction: column;
   height: 200px;
  width: 200px;
  border: 10px solid var(--shield-border-color);
  border-radius: 50% 50% 50% 50% / 15% 15% 90% 90%;

  

  
  
  
  }
  
   


</style>
