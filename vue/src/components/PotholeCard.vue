<template>
  <div>
    <div id="container" v-for="pothole in filterById" v-bind:key="pothole.id">
      <div>Discovery Time: {{ pothole.discoveryDate }}</div>
      <div>Severity: {{ pothole.severity }}</div>
      <div>
        {{ pothole.address.streetNumber }}
        {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
        {{ pothole.address.zipCode }}
      </div>
      <div>Direction: {{ pothole.direction }}</div>
      <div>Description {{ pothole.description }}</div>
    </div>
  </div>
</template>

<script>
export default {
  props: ["potholes"],
  computed: {
    filterById() {
      let results = [];
      let filteredPotholes = this.potholes;
      results = filteredPotholes.filter((pothole) => {
        return pothole.potholeId == this.$store.state.pothole;
      });
      return results;
    },
  },
};
</script>

<style scoped>
#container {
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
  /* background-image: url("../assets/National-Pothole-Day.jpg"); */
  background-size: contain;
}
</style>