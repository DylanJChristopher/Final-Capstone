<template>
  <div>
    <div id="components">
      
      <div id="pot-and-report">
        <potholes-list v-bind:potholes="potholes" id="pothole-list" />
        <report-pothole id="report-pothole" />
      </div>
      <user-location v-bind:potholes="potholes" id="user-location" />
    </div>
  </div>
</template>

<script>
import UserLocation from "../components/UserLocation.vue";
import ReportPothole from "../components/ReportPothole.vue";
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
    ReportPothole,
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

#report-pothole {
  background-color: #1d1d1d;
  flex-grow: 2;
}
#pothole-list{
    flex-grow: 1;
}
#components {
  display: flex;
  justify-content: space-evenly;
}
#user-location {
  width: 60vw;
  height: 100vw;
  min-width: 0;
  background-color: black;
}
#pot-and-report {
  width: 40vw;
  display: flex;
  flex-direction: column;
  background-color: #1d1d1d;
  min-width: 0;
  color:azure;
}
</style>