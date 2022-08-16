<template>
  <div>
    <div id="container">
      <div></div>
      <div class="home">
        <div class="shield-button">
          <div id="banner">
            <h1>T.I.P.S. is dedicated to empowering community members by providing real-time pothole reporting. Every pothole will be inspected and repaired within 72 hours of its report.</h1>
          </div>
          <h2>
            <button class="myButton">
              <a id = "report-link" href="http://localhost:8080/report"
                >Submit a TIP of a pothole today!</a
              >
            </button>
          </h2>
        </div>
      </div>
    </div>

    <div id="homepart2">
      <h3>"Paving the way to the Future."</h3>
      <section id="home-cards">
        <div class="card" style="width: 40rem" id="left-card">
          <img
            src="../assets/about-us.jpg"
            class="card-img-top"
            alt="About TIPS"
          />
          <div class="card-body">
            <h5 class="card-title">About TIPS</h5>
            <p class="card-text">
              Learn all about the brilliant minds behind TIPS and how you can be
              a part of our team!
            </p>
            <a href="#" class="btn btn-primary card-button">Learn More</a>
          </div>
        </div>
          <div class="card" style="width: 40rem" id="right-card">
          <img
            src="../assets/pothole-5.jpg"
            class="card-img-top"
            alt="What are potholes"
          />
          <div class="card-body">
            <h5 class="card-title">What are potholes?</h5>
            <p class="card-text">
              Learn from leading Road Technologist about Potholes and how they
              form.
            </p>
            <a href="#" class="btn btn-primary card-button">Learn More</a>
          </div>
        </div>

        <div class="card" id="middle-card" style="width: 40rem">
          <img
            src="../assets/faq.jpg"
            class="card-img-top"
            alt="Frequently Asked Questions"
          />
          <div class="card-body">
            <h5 class="card-title">F.A.Q.</h5>
            <p class="card-text">
              Answers to our common questions. What is TIPS? What do we do? How
              can you help?
            </p>
            <a href="#" class="btn btn-primary card-button">Learn More</a>
          </div>
        </div>

      
      </section>
    </div>
  </div>
</template>

<script>
export default {
  name: "home",
};
</script>
<style scoped>
#homepart2 h3 {
  font-size: 5em;
  font-weight: bold;
  text-align: center;
  color: #2e5266;
  font-family: Arial, Helvetica, sans-serif;
}
h2{
  align-self: center;
}
#home-cards {
  display: flex;
  justify-content: space-evenly;
}
.card-title {
  font-size: 3em;
  color: #2e5266;
  font-family: Arial, Helvetica, sans-serif;
}
.card-text {
  font-size: 2em;
  color: #2e5266;
  font-family: Arial, Helvetica, sans-serif;
}
.card-button {
  font-size: 2em;
  background-color: var(--green);
  font-family: Arial, Helvetica, sans-serif;
}
.card-img-top {
  width: 25vw;
  height: 25vh;
  margin-left: 2rem;
  margin-right: 2rem;
-webkit-box-shadow: 1px 1px 6px 4px rgba(0,0,0,0.31); 
box-shadow: 1px 1px 6px 4px rgba(0,0,0,0.31);

  border-radius: 5%;
}
#left-card {
  padding-right: 2rem;
  padding-left: 2rem;
  border-right: black solid 1px;
}
#middle-card {
  padding-right: 2rem;
  padding-left: 2rem;
  
  border-left: black solid 1px;
}
#right-card {
  padding-right: 2rem;
  padding-left: 2rem;
  border-left: black solid 1%;
  border-right: black solid 1%;
}

#container {
  background-image: url("../assets/pothole-2.jpg");
  background-repeat: no-repeat;
  background-size: cover;
}
.home {
  /* background-image:url("../assets/pothole-2.jpg"); */

  opacity: 100%;

  background-repeat: no-repeat;
  background-size: cover;
  height: 100vh;
  
  display: flex;
  justify-content: center;
  align-items: center;
}
h1 {
  align-self: center;
  text-align: center;
  color: white;
  width: 21rem;
  height: 25rem;
  font-size: 31px;
  padding-top: 25px;
  font-family: Arial, Helvetica, sans-serif;
  
  
}

.myButton {
  color: rgb(255, 255, 255);
  font-size: 20px;
  line-height: 20px;
  padding: 8px;
  border-radius: 28px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: normal;
  text-decoration: none;
  font-style: normal;
  font-variant: normal;
  text-transform: none;
  background-image: linear-gradient(
    135deg,
    forestgreen 0%,
    #646F4B 100%
  );
  box-shadow: rgba(43, 49, 57, 0.85) 1px 3px 8px 11px;
  border: 2px solid rgb(28, 110, 164);
  display: inline-block;
  
}
.myButton:hover {
  background: #3a435a;
}
.myButton:active {
  background: #1e2a44;
}
#banner {
  display: flex;
  background-color: #646F4B;
  opacity: 100%;
  -webkit-box-shadow: 1px 3px 8px 11px rgba(43, 49, 57, 0.85);
  box-shadow: 1px 3px 8px 11px rgba(43, 49, 57, 0.85);
  flex-direction: column;
  height: 50vh;
  width: 25vw;
  border: 10px solid var(--shield-border-color);
  border-radius: 50% 50% 50% 50% / 15% 15% 90% 90%;
  align-self: center;
}
#fullscreenimg {
  width: 100%;
  opacity: 60%;
  max-height: 2000px;
  overflow: hidden;
}

.shield-button {
  display: flex;
  flex-direction: column;
  justify-content: center;
  flex-grow: 1;
}


.btn-primary {
  color: blue;
}
.card-button:hover {
  color: black;
}

#report-link{
  color: white;
  text-decoration: none;
  font-family: Arial, Helvetica, sans-serif;
}
</style>
