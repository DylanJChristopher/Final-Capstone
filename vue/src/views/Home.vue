<template>
  <div>
    <div id="container">
      <div></div>
      <div class="home">
        <div class="shield-button">
          <div id="banner">
            <h1 id="first-h1">
              Real-time pothole reporting for your community.
            </h1>
            <button class="myButton">
              <a id="report-link" href="http://localhost:8080/report"
                >Report Pothole</a
              >
            </button>
            <h1 id="last-h1">
              Potholes inspected and repaired within 72 hours.
            </h1>
          </div>
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
#first-h1 {
  height: 10%;
  padding-bottom: 14%;
}
#last-h1 {
  width: 60%;
  height: 20%;
  font-size: 18px;
  font-weight: bold;
}
#homepart2 h3 {
  font-size: 5em;
  font-weight: bold;
  text-align: center;
  color: #2e5266;
  font-family: Arial, Helvetica, sans-serif;
}
h2 {
  align-self: center;
}
#home-cards {
  display: flex;
  justify-content: center;
  width: 100vw;
}
.card-title {
  font-size: 2em;
  font-weight: normal;
  color: #2e5266;
  font-family: Arial, Helvetica, sans-serif;
  text-align: center;
}
.card-text {
  height: 5vh;
  font-size: 1em;
  font-weight: normal;
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
  /* margin-left: 2rem;
  margin-right: 2rem; */
  -webkit-box-shadow: 1px 1px 6px 4px rgba(0, 0, 0, 0.31);
  box-shadow: 1px 1px 6px 4px rgba(0, 0, 0, 0.31);

  border-radius: 2%;
}
#left-card {
  padding-right: 2rem;
  padding-left: 2rem;
  /* border-right: black solid 1px; */
  width: 33vw;
  display: flex;
  flex-direction: column;
  align-items: center;
}
#middle-card {
  padding-right: 2rem;
  padding-left: 2rem;

  /* border-left: black solid 1px; */
  width: 33vw;
  display: flex;
  flex-direction: column;
  align-items: center;
}
#right-card {
  padding-right: 2rem;
  padding-left: 2rem;
  /* border-left: black solid 1%;
  border-right: black solid 1%; */
  width: 33vw;
  display: flex;
  flex-direction: column;
  align-items: center;
}
.card-body {
  border-right: black 2px;
  right: 50%;
  display: flex;
  flex-direction: column;
  align-items: center;
}

#container {
  background-image: url("../assets/pothole-2.jpg");
  background-repeat: no-repeat;
  background-size: cover;
  opacity: 100%;
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
  /* width: 21rem;
  height: 25rem; */
  font-size: 35px;

  font-family: Arial, Helvetica, sans-serif;
}

.myButton {
  color: rgb(255, 255, 255);
  font-size: 30px;

  /* line-height: 20px; */
  height: 10px;
  padding: 8px;
  border-radius: 12px;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: normal;
  text-decoration: none;
  font-style: normal;
  font-variant: normal;
  text-transform: none;
  background-image: linear-gradient(135deg, #f1881d 0%, #f6861a 100%);
  -webkit-box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.97);
  box-shadow: 0px 0px 6px 0px rgba(0, 0, 0, 0.97);
  border: 2px solid #fa0201;
  display: inline-block;
  height: 5rem;
  margin-top: 2rem;
  align-self: center;
}
.myButton:hover {
  background: #fa0201;
  border: 2px solid #f1881d;
}
.myButton:hover + #report-link {
  color: #fff500;
}
.myButton:active {
  background: #fa0201;
}
#banner {
  display: flex;
  background-color: #646f4b;
  opacity: 100%;
  -webkit-box-shadow: 0px 0px 6px 1px rgba(0, 0, 0, 0.97);
  box-shadow: 0px 0px 6px 1px rgba(0, 0, 0, 0.97);
  flex-direction: column;
  height: 50vh;
  width: 25vw;
  border: 10px solid var(--shield-border-color);
  border-radius: 50% 50% 50% 50% / 15% 15% 90% 90%;
  align-self: center;
  justify-content: center;
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
.home {
  background-color: rgba(255, 255, 255, 0.432);
}

.btn-primary {
  color: blue;
  text-align: center;
  font-size: 20px;
}
.card-button:hover {
  color: black;
}

#report-link {
  color: white;
  text-decoration: none;
  font-family: Arial, Helvetica, sans-serif;
  height: 100%;
  width: 100%;
}
#report-link:hover {
  color: #fff500;
}
</style>
