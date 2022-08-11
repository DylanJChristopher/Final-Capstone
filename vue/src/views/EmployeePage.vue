<template>
  <employee-review-pending v-bind:potholes="potholes"/>
</template>

<script>
import EmployeeReviewPending from '../components/EmployeeReviewPending.vue';
import potHolesService from "../services/PotholesService.js";
export default {

    data(){
        return{
            potholes: []
        }
    },
     created() {
    potHolesService.retrievePotholes().then((response) => {
      this.potholes = response.data;
    });
  },

components: {
    EmployeeReviewPending
    
}


}
</script>

<style>

</style>