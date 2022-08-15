<template>
  <div>
    <section class="pagePrint">
      <h1>All Potholes</h1>
      <div class="tbl-header">
        <table cellpadding="0" cellspacing="0" border="0">
          <thead>
            <tr>
              <td colspan="8">
                Search:
                <input type="text" placeholder="Enter Pothole ID" v-model="searchId">

              </td>
            </tr>
            <tr>
              <th>Pothole ID</th>
              <th>Nearest Address</th>
              <th>Zip Code</th>
              <th>Direction of Travel</th>
              <th>Severity</th>
              <th>Discovery Date</th>
              <th>Status</th>
              <th>Repair Date</th>
            </tr>
          </thead>
        </table>
      </div>


      <div class="tbl-content" v-if="searchId ==''">
        <table cellpadding="0" cellspacing="0" border="0">
          <tbody v-for="pothole in sortedArray" v-bind:key="pothole.id">
            <tr v-on:click="retrieveId(pothole.potholeId)" class="clickable">
              <td>{{ pothole.potholeId }}</td>
              <td>
                {{ pothole.address.streetNumber }}
                {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
              </td>
              <td>{{ pothole.address.zipCode }}</td>
              <td>{{ pothole.direction }}</td>
              <td>{{ pothole.severity }} / 10</td>
              <td>{{ dateFormat(pothole.discoveryDate) }}</td>
              <td>{{ pothole.repair.status }}</td>
              <td>
                {{ dateFormat(pothole.repair.repairDate) }}
              </td>
            </tr>
            <tr id="description">
              <td colspan="8">{{ pothole.description }}</td>
            </tr>
            <tr>
              <td id="placeholder" colspan="8"></td>
            </tr>
          </tbody>
        </table>

      </div>

      <div class="tbl-content" v-else>

        <table cellpadding="0" cellspacing="0" border="0">
          <tbody v-for="pothole in searchById" v-bind:key="pothole.id">
            <tr v-on:click="retrieveId(pothole.potholeId)" class="clickable">
              <td>{{ pothole.potholeId }}</td>
              <td>
                {{ pothole.address.streetNumber }}
                {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
              </td>
              <td>{{ pothole.address.zipCode }}</td>
              <td>{{ pothole.direction }}</td>
              <td>{{ pothole.severity }} / 10</td>
              <td>{{ dateFormat(pothole.discoveryDate) }}</td>
              <td>{{ pothole.repair.status }}</td>
              <td>
                {{ dateFormat(pothole.repair.repairDate) }}
              </td>
            </tr>
            <tr id="description">
              <td colspan="8">{{ pothole.description }}</td>
            </tr>
            <tr>
              <td id="placeholder" colspan="8"></td>
            </tr>
          </tbody>
        </table>

      </div>





    </section>
  </div>
</template>

<script>
export default {
  data(){
    return{
       searchId: '',
    }
  },
 
 props: ["potholes"],
 

  methods: {
    dateFormat(potholeDate) {
      let date = new Date(potholeDate);
      return date.toLocaleString();
    },
  },

  computed: {
    sortedArray() {
      let filterPotholes = this.potholes;
      filterPotholes = filterPotholes.sort((potholeA, potholeB) => {
        let a = potholeA.repair.status.toLowerCase();
        let b = potholeB.repair.status.toLowerCase();
        if (a < b) {
          return -1;
        } else if (a > b) {
          return 1;
        } else {
          return 0;
        }
      });
      return filterPotholes;
    },
    searchById(){
     let specificPothole = this.potholes;
     let results = specificPothole.filter((pothole) => {
        return pothole.potholeId == this.searchId;
      });
      return results;


    }
  },
};
</script>

<style scoped>
#placeholder {
  background-color: rgba(139, 27, 27, 0.63);
  padding: 2px;
}
section {
  width: 90vw;
  margin: 0px 0px 1000px 100px;
  height: 60vh;
  border: outset 1px grey;
  border-radius: 3%;
  box-shadow: 0 12px 16px 0 rgba(0, 0, 0, 0.24),
    0 17px 50px 0 rgba(0, 0, 0, 0.19);
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