<template>
  <div class="home">
  <div id="banner" >
    <h1> T.I.P.S. ensures the roads are safe!</h1>
    <h2><button class = "myButton">Submit a TIP of a pothole today!</button></h2>
  
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
.myButton {
color: rgb(255, 255, 255); font-size: 20px; line-height: 13px; padding: 8px; border-radius: 28px; font-family: Georgia, serif; font-weight: normal; text-decoration: none; font-style: normal; font-variant: normal; text-transform: none; background-image: linear-gradient(135deg, rgb(28, 110, 164) 0%, rgb(35, 136, 203) 50%, rgb(20, 78, 117) 100%); box-shadow: rgba(43, 49, 57, 0.85) 1px 3px 8px 11px; border: 2px solid rgb(28, 110, 164); display: inline-block;}
.myButton:hover {
background: #3a435a; }
.myButton:active {
background: #1e2a44; }
  #banner{
    display: flex;
          background-color:green;
  opacity: 85%;
-webkit-box-shadow: 1px 3px 8px 11px rgba(43,49,57,0.85); 
box-shadow: 1px 3px 8px 11px rgba(43,49,57,0.85);
  flex-direction: column;
   height: 200px;
  width: 200px;
  border: 10px solid var(--shield-border-color);
  border-radius: 50% 50% 50% 50% / 15% 15% 90% 90%;

  

  
  
  
  }
  
   


</style>
