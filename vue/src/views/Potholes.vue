<template>
  <div>
      <report-pothole/>
      <user-location/>
<potholes-list/>

  </div>
</template>

<script>
import UserLocation from "../components/UserLocation.vue";

import ReportPothole from "../components/ReportPothole.vue";
import PotholesList from "../components/PotholesList.vue";

export default {
    components: {
        PotholesList,
        ReportPothole,
        UserLocation

    }

}
</script>

<style scoped>

</style>