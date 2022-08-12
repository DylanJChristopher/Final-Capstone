<template>

  <div id="login" class="text-center">
    <section id="container">
   <report-pothole class="form-signin"/>
    </section>
  </div>
</template>

<script>

import ReportPothole from "../components/ReportPothole.vue";

export default {
  name: "Report",
  components: {
      ReportPothole
  },
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {


  }
};
</script>
<style scoped>
button:hover{
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
  
}
.form-signin{
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  height: 70%;
  width: 40%;
  background-color: whitesmoke;
  opacity: 85%;
 
  border-radius: 6%;

 align-items: center;

}
label, input, button{
  width: 25%;
}

#container{
  height:85vh;
   width: 100vw;
 display: flex;
 justify-content: center;
/* background-image:url("../assets/pothole-2.jpg"); */
align-items: center;
  /* background-repeat:no-repeat;
  background-size: cover; */
  
}
input{
  height: 7%;
}
</style>