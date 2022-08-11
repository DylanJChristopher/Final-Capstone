<template>
  <div id="container">
    <section id="top" >
      <graph id="graph" class="box" />
      <pothole-card id="card" class="box"/>
    </section>
    <section id="bottom" >
      <employee-review-pending id="review" class="box" v-bind:potholes="potholes" />
      <repair-in-progress id="inprogress" class="box" />
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

<style scoped>
#container{
    display:flex;
    flex-direction: column;
    height: 85vh;

}
#top{
background-color: grey;
display: flex;
width:100%;
height:45vh;
}

#bottom{
background-color: yellowgreen;
display: flex;
width:100%;
height: 40vh;


}
.box{
  width: 50vw;
  display:flex;
  justify-content: center;
  align-items: center;
  
}
.review{
  height: 40vh;

}
.review{
  height: 40vh;
  
}





</style>