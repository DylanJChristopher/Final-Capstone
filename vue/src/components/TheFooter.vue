<template>
    <div id="container">

        <div>

            <img class="icons" src="../assets/Linkedin.png" alt="Linkedin Logo">
            <img class="icons" src="../assets/twitter.png" alt="Twitter Logo">
            <img class="icons" src="../assets/FB.png" alt="FaceBook Logo">
            <img id="instagram" src="../assets/Instagram.png" alt="Instagram Logo">
            <img class="icons" src="../assets/YT.png" alt="YouTube Logo">


        </div>


        <p> Copyright &#169; 2022 TIPS</p>

    </div>

</template>

<script>
export default {

}
</script>

<style scoped>
p{
    color: black;
}
#container {
  background-color: white;
  bottom: 0;
  width: 100%;
  height: 5vh;
  font-size: small;
  display:flex;
  justify-content: space-between;
  align-items: center;
}
#logo{
    display: flex;
    

}
img {
    height: 30px;
    width: 30px;
}
#instagram{
    height: 30px;
    width: 35px;
}
</style>