<template>
  <div>
    <section>
      <!--for demo wrap-->
      <h1>Pending Potholes</h1>
      <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
          <thead>
            <tr>
              <th>Nearest Address</th>
              <th>Zip Code</th>
              <th>Severity</th>
              <th>Discovery Date</th>
              <th>More</th>
            </tr>
          </thead>
        </table>
      </div>
      <div class="tbl-content">
        <table cellpadding="0" cellspacing="0" border="0">
          <tbody v-for="pothole in filterByStatus" v-bind:key="pothole.potholeId">
            <tr>
              <td>
                {{ pothole.address.streetNumber }}
                {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
              </td>
              <td>{{ pothole.address.zipCode }}</td>
              <td>{{ pothole.severity }}</td>
              <td>{{ pothole.discoveryDate }}</td>
              <td><button v-on:click="retrieveId(pothole.potholeId)">More Details</button></td>
            </tr>
            <tr>
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
        return pothole.repair.status == "Pending";
      });
      return results;
    }
  },
    methods: {
      retrieveId(potholeId) {
        this.$store.commit("SET_POTHOLE_ID", potholeId);
      },
    },
  

};
</script>

<style scoped>
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
    box-shadow: 20px 20px 10px grey;
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
  box-shadow: inset 0 0 5px rgb(0, 0, 0);
  
}

</style>