<template>
  <div id="container">
    <section id="top-section">
      <graph />
      <pothole-card />
    </section>
    <section id="bottom-section">
      <employee-review-pending v-bind:potholes="potholes" />
      <repair-in-progress />
    </section>
  </div>
</template>

<script>
import EmployeeReviewPending from "../components/EmployeeReviewPending.vue";
import Graph from "../components/Graph.vue";
import PotholeCard from "../components/PotholeCard.vue";
import RepairInProgress from "../components/RepairInProgressTable.vue";

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
  },
};
</script>

<style>
#container{
    display:flex;
    flex-direction: column;
    justify-content: space-around;
}
#top-section, #bottom-section{
background-color: yellowgreen;
}

</style>