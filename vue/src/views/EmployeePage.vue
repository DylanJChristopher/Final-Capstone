<template>
  <div id="container">
    <section id="top">
      <graph id="graph" class="box"/>

      <pothole-card id="card" class="box" v-bind:potholes="potholes" />
    </section>
    <section id="bottom">
      <employee-review-pending
        id="review"
        class="box"
        v-bind:potholes="potholes"
      />
      <repair-in-progress
        id="inprogress"
        class="box"
        v-bind:potholes="potholes"
      />
    </section>
    <history id="bottomBottom" v-bind:potholes="potholes"/>
  </div>
</template>

<script>
import EmployeeReviewPending from "../components/EmployeeReviewPending.vue";
import Graph from "../components/Graph.vue";
import PotholeCard from "../components/PotholeCard.vue";
import RepairInProgress from "../components/RepairInProgressTable.vue";
import History from "../components/History.vue"

import potHolesService from "../services/PotholesService.js";

export default {
  data() {
    return {
      potholes: [],
    };
  },
  created() {
    potHolesService.retrievePotholes().then((response) => {
      this.potholes = response.data;
    });
  },

  components: {
    EmployeeReviewPending,
    Graph,
    PotholeCard,
    RepairInProgress,
    History,
  },
};
</script>

<style scoped>
#graph.box{
  /* border: inset 1px grey;
  border-radius: 20%; */
  padding: 50px;
  margin: -68px 0px 100px 0px;
  width: 400px;
  height: 325px;
  border: outset 1px grey;
  border-radius: 15px;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.24),
    0 2px 2px 0 rgba(0, 0, 0, 0.19);
  backdrop-filter:sepia(30%);
}
#container {
  display: grid;
  grid-template-columns: 1fr 1fr;
  grid-template-areas:
    "top top"
    "bottom bottom"
    "section section";
}
#bottomBottom{
  grid-area: section;
  width: 100%;
  height: 25vh;
  margin: 150px 0px 100px 0px;
}
#top {
  grid-area: top;
  display: flex;
  width: 100%;
  height: 25vh;
  margin: 100px 0px 100px 200px;
}

#bottom {
  display: flex;
  grid-area: bottom;
  background-color: transparent;
  width: 100%;
  height: 60vh;
  margin: 200px 0px 100px 0px;
}
#card {
  margin: 200px 0px 200px 196px;
  
}
.box {
  width: 50vw;
  display: flex;
  justify-content: center;
  align-items: center;
}
#review {
  height: 60vh;
  /* background-image:url("../assets/how-potholes-form.jpg"); */
}
#inprogress {
  height: 60vh;
  /* background-image:url("../assets/Potholerepair.jpg"); */
}
/* #card{
  
  /* background-image: url("../assets/pothole-5.jpg"); */
/* background-size:contain; */
/* } */
</style>