<template>
  <div>
    <div id="container" v-for="pothole in filterById" v-bind:key="pothole.potholeId">
      <div>Discovery Time: {{ pothole.discoveryDate }}</div>
      <div>Severity: {{ pothole.severity }}</div>
      <div>
        {{ pothole.address.streetNumber }}
        {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
        {{ pothole.address.zipCode }}
      </div>
      <div>Direction: {{ pothole.direction }}</div>
      <div>Description {{ pothole.description }}</div>
      <form v-on:submit.prevent>
        <p>Update Pothole Status:</p>
        <label for="status" class="form-label">Status: </label>
        <select
          class="form-select"
          aria-label="Default select example"
          required
          v-model="updatedPothole.repair.status"
        >
          <option selected></option>
          <option value="Pending">Pending</option>
          <option value="Repair Scheduled">Repair Scheduled</option>
          <option value="Reject">Reject</option>
          <option value="Fixed">Fixed</option>
        </select>

        <div class="col-12">
          <form action="/action_page.php">
            <label for="repair date">Repair Date (Date and Time): </label>
            <input
              type="datetime-local"
              id="repair date"
              name="repair date"
              required
              v-model="updatedPothole.repair.repairDate"
            />
          </form>
        </div>

        <button v-on:click="updateRepair(pothole)" type="button" class="btn btn-submit">
          Update Status
        </button>
      </form>
    </div>
  </div>
</template>

<script>

import PotholeService from "../services/PotholesService.js"

export default {
  props: ["potholes"],
  data() {
    return {
      updatedPothole: {
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
  methods: {
    updateRepair(pothole){
      console.log(this.$store.state.pothole, "string");
      PotholeService.updatePotholeRepair(this.updatedPothole, this.$store.state.pothole).then(response =>{
        if(response.status == 200){
          console.log("it worked!")
          pothole.repair.status="Repair Scheduled"
        }
      })
    }

  }

};
</script>

<style scoped>
#container {
  display: flex;
  /* flex-direction: column; */
  justify-content: center;
  align-items: center;
  /* background-image: url("../assets/National-Pothole-Day.jpg"); */
  background-size: contain;
}
</style>