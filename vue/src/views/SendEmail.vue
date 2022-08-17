<template>
  <email id="container" v-bind:potholes="potholes"/>
</template>

<script>
import Email from "../components/Email.vue";
import potHolesService from "../services/PotholesService.js";
export default {
    data() {
    return {
      potholes: [],
    };
  },
  components: {
    Email,
  },
  created() {
    potHolesService.retrievePotholes().then((response) => {
      this.potholes = response.data;
    });
  },
};
</script>

<style>
.container{

  margin: 200px;
}
</style>