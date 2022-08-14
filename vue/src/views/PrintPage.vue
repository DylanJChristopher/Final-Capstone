<template>
  <print v-bind:potholes="potholes"/>
</template>

<script>
import Print from "../components/Print.vue";
import potHolesService from "../services/PotholesService.js";

export default {
  data() {
    return {
      potholes: [],
    };
  },
  components: {
    Print,
  },

  created() {
    potHolesService.retrievePotholes().then((response) => {
      this.potholes = response.data;
    });
  },
};
</script>

<style>
</style>