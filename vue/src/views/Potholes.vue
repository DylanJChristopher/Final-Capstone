<template>
  <div>
<potholes-list/>
<report-pothole/>
  </div>
</template>

<script>
import ReportPothole from "../components/ReportPothole.vue";





import PotholesList from "../components/PotholesList.vue";



export default {
    components: {
        PotholesList,
        ReportPothole

    }

}
</script>

<style scoped>

</style>