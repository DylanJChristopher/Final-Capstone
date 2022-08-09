<template>
  <div>
      <div id='components'>
          <div id= 'pot-and-report'>
          <potholes-list v-bind:potholes ='potholes' id='pothole-list'  />
      
      </div>
      <user-location v-bind:potholes='potholes' id='user-location'/>
      <report-pothole/>

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
#components{
    display: flex;
    
}
#user-location{
    width: 67%;
}
#pot-and-report{
    width: 33%;
}

</style>