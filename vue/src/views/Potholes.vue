<template>
  <div>
    <div id="components">
      
      <div id="pot-and-report">
        <potholes-list v-bind:potholes="potholes" id="pothole-list" />
        <!-- <report-pothole id="report-pothole" /> -->
      </div>
      <user-location v-bind:potholes="potholes" id="user-location" />
    </div>
  </div>
</template>

<script>
import UserLocation from "../components/UserLocation.vue";
// import ReportPothole from "../components/ReportPothole.vue";
import PotholesList from "../components/PotholesList.vue";
// import MapService from "../services/MapService.js";
import potHolesService from "../services/PotholesService.js";

export default {
  data() {
    return {
      potholes: [],
    };
  },
  components: {
    PotholesList,
    // ReportPothole,
    UserLocation,
  },

  created() {
    potHolesService.retrievePotholes().then((response) => {
      this.potholes = response.data;
    });
  },
};
</script>

<style scoped>


#pothole-list{
    width: 40vw;
    /* background-image: url("../assets/how-potholes-form.jpg");
    background-repeat: no-repeat;
    background-size: cover; */
    height: 70vh;
    border: outset 1px grey;
    border-radius: 5%;
    box-shadow: 20px 20px 10px grey;
}
#components {
  display: flex;
  justify-content: space-evenly;
  width: 100%;
  height: 85vh;
}
#user-location {
  width: 50vw;
  height: 85vh;
  min-width: 0;
  /* background-color: black; */
}
#pot-and-report {
  width: 50vw;
  height: 85vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  /* background-color: #1d1d1d; */
  min-width: 0;
  color:azure;
}
</style>