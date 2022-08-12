<template>
  <div class="home">
  <div id="banner">
    <h1>Welcome to TIPS</h1>
    <h3>Team India Pothole Solutions</h3>
  
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
 background-image:url("../assets/pothole-2.jpg");

  background-repeat:no-repeat;
  background-size: cover;
  height: 100vh;
  display:flex;
  justify-content: center;
  align-items:center;
  
  }
  h1{
    border-top: solid black 3px;
    border-bottom: solid black 3px;
      background-color: whitesmoke;
  opacity: 85%;
 
  border-radius: 25%;
    
  }
  #banner{
    display: flex;
          background-color: whitesmoke;
  opacity: 85%;
 
  border-radius: 25%;
  width:25%;
  flex-direction: column;
    justify-content: center;
  align-items:center;
  }


</style>
