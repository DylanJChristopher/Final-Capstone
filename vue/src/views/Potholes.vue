<template>
  <div>
    <user-location></user-location>
  <potholes-list/>

  </div>
</template>

<script>




import PotholesList from "../components/PotholesList.vue";
import UserLocation from '../components/UserLocation.vue';


export default {
    components: {
        PotholesList,
        UserLocation
        

    }

}
</script>

<style scoped>

</style>