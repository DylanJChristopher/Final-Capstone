<template>
  <div id="container">
    <section id="top" >
      <graph id="graph" class="box" v-bind:potholes="potholes"/>
      <pothole-card id="card" class="box" v-bind:potholes="potholes" />
    </section>
    <section id="bottom" >
      <employee-review-pending id="review" class="box" v-bind:potholes="potholes" />
      <repair-in-progress id="inprogress" class="box" v-bind:potholes="potholes" />
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
    height: 170vh;
    
    

}
#top{

display: flex;
width:100%;
height:25vh;
}

#bottom{
background-color: transparent;
display: flex;
width:100%;
height: 60vh;


}
.box{
  width: 50vw;
  display:flex;
  justify-content: center;
  align-items: center;
  
}
#review{
  height: 60vh;
/* background-image:url("../assets/how-potholes-form.jpg"); */
}
#inprogress{
  height: 60vh;
  /* background-image:url("../assets/Potholerepair.jpg"); */
  
}
/* #card{
  
  /* background-image: url("../assets/pothole-5.jpg"); */
  /* background-size:contain; */
/* } */ 





</style>