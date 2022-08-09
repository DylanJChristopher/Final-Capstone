<template>
  <div>
      <report-pothole/>
      <user-location v-bind:potholes='potholes'/>
<potholes-list v-bind:potholes ='potholes'  />

  </div>
</template>

<script>
import UserLocation from "../components/UserLocation.vue";
import ReportPothole from "../components/ReportPothole.vue";
import PotholesList from "../components/PotholesList.vue";
// import MapService from "../services/MapService.js";
import potHolesService from "../services/PotholesService.js";

export default {
    data(){
        return {
            potholes: []
        }
    },
    components: {
        PotholesList,
        ReportPothole,
        UserLocation,
        

    },


created(){
    potHolesService.retrievePotholes().then(response => {
        this.potholes= response.data;
});

}
}
</script>

<style scoped>

</style>