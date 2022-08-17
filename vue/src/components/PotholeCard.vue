<template>
  <div id="container">
    <div v-if="$store.state.pothole != ''">
      <div
        class="innerContainer"
        v-for="pothole in filterById"
        v-bind:key="pothole.potholeId"
      >
        <div class="detail">
          <div>Discovery Date: {{ dateFormat(pothole.discoveryDate) }}</div>
          <div>Severity: {{ pothole.severity }} / 10</div>
          <div>
            {{ pothole.address.streetNumber }}
            {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
            {{ pothole.address.zipCode }}
          </div>
          <div>Direction: {{ pothole.direction }}</div>
          <div class="description">Description {{ pothole.description }}</div>
        </div>

        <form v-on:submit.prevent class="updateForm">
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
                id="repairDate"
                name="repair date"
                required
                v-model="updatedPothole.repair.repairDate"
              />
            </form>
          </div>

          <button
            v-on:click="updateRepair(pothole)"
            type="button"
            class="btn btn-submit"
          >
            Update Status
          </button>
        </form>
      </div>
    </div>
    <div v-else class="innerContainer">
      <!-- <div
        id="Container2"
        v-for="pothole in filterByStatus"
        v-bind:key="pothole.potholeId"
      > -->
      <div class="detail">
        <div>Discovery Date: {{ dateFormat(filterByStatus.discoveryDate) }}</div>
        <div>Severity: {{ filterByStatus.severity }} / 10</div>
        <div>
          {{ filterByStatus.address.streetNumber }}
          {{ filterByStatus.address.streetName }}
          {{ filterByStatus.address.city }}, OH
          {{ filterByStatus.address.zipCode }}
        </div>
        <div>Direction: {{ filterByStatus.direction }}</div>
        <div class="description">
          Description {{ filterByStatus.description }}
        </div>
      </div>

      <form v-on:submit.prevent class="updateForm">
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
              id="repairDate2"
              name="repair date"
              required
              v-model="updatedPothole.repair.repairDate"
            />
          </form>
        </div>

        <button
          v-on:click="updateFirstPothole(filterByStatus)"
          type="button"
          class="btn btn-submit"
        >
          Update Status
        </button>
      </form>
    </div>
  </div>
</template>

<script>
import PotholeService from "../services/PotholesService.js";

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
    filterByStatus() {
      let filteredPotholes = this.potholes;
      // console.log(this.filteredPotholes);
      const results = filteredPotholes.filter((pothole) => {
        return pothole.repair.status == "Pending";
      });
      return results[0];
    },
  },
  methods: {
    updateRepair() {
      console.log(this.$store.state.pothole, "string");
      PotholeService.updatePotholeRepair(
        this.updatedPothole,
        this.$store.state.pothole
      ).then((response) => {
        if (response.status == 200) {
          console.log("it worked!");
          window.location.reload();
        }
      });
    },
    dateFormat(potholeDate) {
      let date = new Date(potholeDate);
      console.log(date.getMonth);
      return date.toLocaleString();
    },

    updateFirstPothole() {
      PotholeService.updatePotholeRepair(
        this.updatedPothole,
        this.filterByStatus.potholeId
      ).then((response) => {
        if (response.status == 200) {
          console.log("it worked!");
          window.location.reload();
        }
      });
    },
  },
};
</script>

<style scoped>
.detail {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 0px 0px 20px 0px;
  padding: 20px;

  background-color: rgba(255, 255, 255, 0.3);
  opacity: 85%;
  border-radius: 15px;
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
  width: 90%;
}
.description {
  display: inline-block;
}

.innerContainer {
  box-sizing: border-box;
  width: 90%;
  padding: 50px;
  margin: 0px 0px 100px 0px;
  border: outset 1px grey;
  border-radius: 10px;
  box-shadow: 0 2px 2px 0 rgba(0, 0, 0, 0.24),
    0 2px 2px 0 rgba(0, 0, 0, 0.19);
}
#container {
  margin: 400px;
}
.updateForm {
  display: flex;
  flex-direction: column;
  align-items: center;
  margin: 2px;

  background-color: rgba(255, 255, 255, 0.3);
  opacity: 85%;
  border-radius: 10px;
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24);
  width: 60%;
}
button {
  margin: 10px;
}
.col-12 {
  margin: 7px;
  font-family: Arial, Helvetica, sans-serif;
}
</style>