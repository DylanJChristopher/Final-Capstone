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
      <form>
        <label for="status" class="form-label">Status: </label>
        <select
          class="form-select"
          aria-label="Default select example"
          required
          v-model="pothole.repair.severity"
        >
          <option selected></option>
          <option value="Pending">Pending</option>
          <option value="Repair Scheduled">Repair Scheduled</option>
          <option value="Reject">Reject</option>
          <option value="Fixed">Fixed</option>
        </select>
      </form>
    </div>
  </div>
</template>

<script>
export default {
  props: ["potholes"],
  data() {
    return {
      pothole: {
        address: {
          streetName: "",
          streetNumber: "",
          city: "",
          state: "",
          zipCode: "",
        },
        repair: {
          status: "",
          repairDate: "",
        },
        direction: "",
        severity: "",
        discoveryDate: "",
        description: "",
      },
    };
  },
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