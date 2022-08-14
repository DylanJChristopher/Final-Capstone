<template>
<div>
  <div id = "container">
  <div class="home">
  <div id="banner" >
    <h1> T.I.P.S. ensures the roads are safe!</h1>
    <h2><button  class = "myButton">Submit a TIP of a pothole today!</button></h2>
  
</div>
  </div>
</div>

 
<div id="homepart2">
      <h2>Other Things like about or whatever</h2>
      <section id="home-cards">
      <div class="card" style="width: 40rem;">
        <img src="../assets/about-us.jpg" class="card-img-top" alt="Wallace Residence">
        <div class="card-body">
          <h5 class="card-title">About TIPS</h5>
          <p class="card-text">Learn all about the brilliant minds behind TIPS</p>
          <a href="#" class="btn btn-primary card-button">Learn More</a>
        </div>
      </div>

      <div class="card" style="width: 40rem;">
        <img src="../assets/faq.jpg" class="card-img-top" alt="McDonald Residence">
        <div class="card-body">
          <h5 class="card-title">FAQ</h5>
          <p class="card-text">Answers to our common questiosn</p>
          <a href="#" class="btn btn-primary card-button">Learn More</a>
        </div>
      </div>

      <div class="card" style="width: 40rem;">
        <img src="../assets/pothole-5.jpg" class="card-img-top" alt="Kent Residence">
        <div class="card-body">
          <h5 class="card-title">Potholes? What are they and how do they form!</h5>
          <p class="card-text">Many things go into forming a pothole. Here we ask leading Road Technologist how these keep coming back.</p>
          <a href="#" class="btn btn-primary card-button">Learn More</a>
        </div>
      </div>
    </section>

    </div>
















  </div>
</template>

<script>
export default {
  name: "home"
};
</script>
<style scoped>
#homepart2 h2{
    font-size: 7em;
    font-weight: bold;
    text-align: center;
    color: var(--indigo);
}
#home-cards{
    display: flex;
    justify-content: space-evenly;
}
.card-title{
    font-size: 3em;

}
.card-text{
    font-size: 2em;
}
.card-button{
    font-size: 2em;
    background-color: var(--green);
}
.card-img-top{
  width: 20vw;
}






























#container{
  background-image:url("../assets/pothole-2.jpg");
  background-repeat:no-repeat;
  background-size: cover;

}
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
  #fullscreenimg{
    width: 100%;
    opacity: 60%;
    max-height: 2000px;
    overflow: hidden;
  }
  
   


</style>
