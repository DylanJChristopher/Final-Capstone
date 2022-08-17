<template>
  <div id="container">
    <div id="miniContainer">
      <nav>
        <a href="#">Careers</a>
        <a href="#">FAQ</a>
        <a href="#">FeedBack</a>
      </nav>

      <div id="together">
        <div id="newsletter">
          <label for="Email">Newsletter: </label>
          <input type="email" placeholder="Email" v-model="value" />
          <button v-on:click="clearForm">Sign up</button>
        </div>

        <div id="socialMedia">
          <img class="icons" src="../assets/Linkedin.png" alt="Linkedin Logo" />
          <a href="https://twitter.com/Vaderstill/status/1556636656941387776?s=20&t=jWx6WvvGoJqCrk0eM53t4w">
          <img class="icons" src="../assets/twitter.png" alt="Twitter Logo" />
          </a>
          <a href="https://www.facebook.com/pothole.info/">
          <img class="icons" src="../assets/FB.png" alt="FaceBook Logo" />
          </a>
         <a href="https://www.instagram.com/reel/ChKUvnZrGR9/?igshid=YmMyMTA2M2Y="><img
            id="instagram"
            src="../assets/Instagram.png"
            alt="Instagram Logo"
          /></a> 
         <a href="https://youtu.be/G_iJrc7KJyU">
         <img class="icons" src="../assets/YT.png" alt="YouTube Logo" />
         </a>
        </div>
      </div>

      <div id="companyInfo">
        <p>1275 Kinnear Rd Columbus, OH 43212</p>
        <p>(877)606-3203</p>
        <p>help@tips.com</p>
      </div>

      
    </div>

   <span class="line"></span>

    <p id="copyright">Copyright &#169; 2022 TIPS</p>
  </div>
</template>

<script>
export default {
  data(){
    return{
      value: ""

    }
  },
  methods:{
    clearForm(){
      this.value=""

    }
  }
};
</script>

<style scoped>
#miniContainer {
  display: flex;
  justify-content: space-evenly;
}
nav{
    display: flex;
    flex-direction: column;
}
a {
  padding: 2px;
  color: black;
  text-decoration: underline;
  font-size: 23px;
}
#copyright {
  color: black;
  text-align: center;
}
.line{
  border-bottom: 2px solid black;
  display: block;
}
#container {
  background-color: white;
  bottom: 0;
  width: 100%;
  height: 5vh;
  font-size: small;
  display: flex;
  flex-direction: column;
  align-items: center;
}
#newsletter button {
  margin: 2px;
}
img {
  height: 30px;
  width: 30px;
}
.icons {
  margin: 4px;
}
#instagram {
  height: 30px;
  width: 35px;
  margin: 4px;
}
#socialMedia {
  cursor: pointer;
}
button:hover{
    cursor: pointer;
}
</style>