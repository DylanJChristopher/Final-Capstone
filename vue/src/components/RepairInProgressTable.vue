<template>
  <div>
    <section class="pagePrint">
      <!--for demo wrap-->
      <h1>Potholes Scheduled for Repair</h1>
      <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
          <thead>
            <tr>
              <th>Pothole ID</th>
              <th>Nearest Address</th>
              <th>Zip Code</th>
              <th>Severity</th>
              <th>Repair Date</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
          <tbody v-for="pothole in filterByStatus" v-bind:key="pothole.id">
            <tr colspan="4">
              <router-link v-bind:to="{ name: 'print' }">
                <img
                  id="print"
                  v-on:click="retrieveId(pothole.potholeId)"
                  src="../assets/print.png"
                  alt="Print Icon"
                />
              </router-link>
            </tr>
            <tr v-on:click="retrieveId(pothole.potholeId)" class="clickable">
              <td>{{ pothole.potholeId }}</td>
              <td>
                {{ pothole.address.streetNumber }}
                {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
              </td>
              <td>{{ pothole.address.zipCode }}</td>
              <td>{{ pothole.severity }} / 10</td>
              <td>
                {{ dateFormat(pothole.repair.repairDate) }}
              </td>
              <!-- <td><button v-on:click="retrieveId(pothole.potholeId)">More Details</button></td> -->
            </tr>
            <tr id="description" v-on:click="retrieveId(pothole.potholeId)">
              <td colspan="5">{{ pothole.description }}</td>
            </tr>
            <tr>
              <td id="placeholder" colspan="5"></td>
            </tr>
          </tbody>
        </table>
      </div>
    </section>
  </div>
</template>

<script>
export default {
  props: ["potholes"],
  computed: {
    filterByStatus() {
      let filteredPotholes = this.potholes;
      // console.log(this.filteredPotholes);
      const results = filteredPotholes.filter((pothole) => {
        return pothole.repair.status == "Repair Scheduled";
      });
      return results;
    },
  },
  methods: {
    retrieveId(potholeId) {
      this.$store.commit("SET_POTHOLE_ID", potholeId);
    },
    dateFormat(potholeDate) {
      let date = new Date(potholeDate);
      return date.toLocaleString();
    },
  },
};
</script>

<style scoped>
.clickable:hover + #description {
  background-color: rgb(235, 219, 191);
  opacity: 85%;
  cursor: pointer;
}
.clickable:hover {
  background-color: rgb(235, 219, 191);
  opacity: 85%;
  cursor: pointer;
}
#print {
  margin: 10px 0px 0px 5px;
  width: 20px;
  height: auto;
}
#print:hover {
  cursor: pointer;
}


#placeholder {
  background-color: rgba(139, 27, 27, 0.63);
  padding: 2px;
}
section {
  width: 40vw;
  /* background-image: url("../assets/how-potholes-form.jpg");
    background-repeat: no-repeat;
    background-size: cover; */
  height: 70vh;
  border: outset 1px grey;
  border-radius: 5%;
  box-shadow: 0 5px 5px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
}
div {
  /* display: flex;
    justify-content: center;
    align-items: center; */
}
h1 {
  font-size: 20px;
  color: black;
  text-transform: uppercase;
  font-weight: bolder;
  text-align: center;
  height: 5%;
  font-family: Arial, Helvetica, sans-serif;
}
table {
  width: 100%;
  table-layout: fixed;
}
.tbl-header {
  background-color: rgba(255, 255, 255, 0.3);
  border: rgba(255, 255, 255, 0.3);
}
.tbl-content {
  height: 70%;
  overflow-x: auto;
  margin-top: 0px;
  border: 1px solid rgba(255, 255, 255, 0.3);
}
th {
  padding: 20px 15px;
  text-align: left;
  font-weight: bolder;
  font-size: 12px;
  color: black;
  text-transform: uppercase;
  font-family: Arial, Helvetica, sans-serif;
}
td {
  padding: 15px;
  text-align: left;
  vertical-align: middle;
  font-weight: bold;
  font-size: 12px;
  color: black;
  border-bottom: solid 1px rgba(255, 255, 255, 0.1);
  font-family: Arial, Helvetica, sans-serif;
}
/* width */
::-webkit-scrollbar {
  width: 15px;
  height: 5px;
}

/* Track */
::-webkit-scrollbar-track {
  box-shadow: inset 0 0 5px grey;
  border-radius: 10px;
}

/* Handle */
::-webkit-scrollbar-thumb {
  background: rgba(139, 27, 27, 0.63);
  border-radius: 10px;
  box-shadow: inset 0 0 1px rgb(0, 0, 0);
}
</style>


