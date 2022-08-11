<template>
  <div id="review-table">
       <section>
        <h1>Reported Potholes</h1>
        <div class="tbl-header">
          <table cellpadding="0" cellspacing="0" border="0">
            <thead>
              <tr>
                <th>Nearest Address</th>
                <th>Zip Code</th>
                <th>Direction</th>
                <th>Severity</th>
                <th>Discovery Date</th>
                <th>Status</th>
                 <th>Repair Date</th>
              </tr>
            </thead>
          </table>
        </div>
        <div class="tbl-content">
          <table cellpadding="0" cellspacing="0" border="0">
            <tbody v-for="pothole in potholes" v-bind:key="pothole.id">
              <router-link v-bind:to="{ name: 'register' }"><tr>
                <td>
                  {{ pothole.address.streetNumber }}
                  {{ pothole.address.streetName }}
                </td>
                <td>{{ pothole.address.zipCode }}</td>
                <td>{{ pothole.direction }}</td>
                <td>{{ pothole.severity }}</td>
                <td>{{ pothole.discoveryDate }}</td>
                <td>{{ pothole.repair.status }}</td>
                <td>{{ pothole.repair.repairDate }}</td>
              </tr></router-link>
              <tr>
                <td colspan="7">
                  Description:
                  {{ pothole.description }}
                </td>
              </tr>
              <tr>
                <td id="placeholder" colspan="7"></td>
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
    

}
</script>

<style scoped>
section{
    background-color: tomato;
    width: 100%;
    height:100%;
    margin:0;
    padding:0;
}

#placeholder {
  background-color: rgba(255, 255, 255, 0.3);
  padding: 2px;
}
h1 {
  font-size: 30px;
  color: #fff;
  text-transform: uppercase;
  font-weight: 300;
  text-align: center;
  margin-bottom: 15px;
}
table {

  table-layout:fixed;
  margin: 0;
}
.tbl-header {
  background-color: goldenrod;
}
.tbl-content {
    overflow-x: auto;
  margin-top: 0px;
width: auto;
height:auto;
}
th {
  padding: 20px 15px;
  text-align: left;
  font-weight: bolder;
  font-size: 10px;
  color: rgba(216, 0, 0, 0.795);
  text-transform: uppercase;
  font-family: Arial, Helvetica, sans-serif;
}

td {
  padding: 15px;
  text-align: left;
  vertical-align: middle;
  font-weight: bold;
  font-size: 12px;
  font-family: Arial, Helvetica, sans-serif;

  color: rgb(255, 255, 255);
  border-bottom: solid 1px rgba(255, 255, 255, 0.1);
}

/* demo styles

@import url(https://fonts.googleapis.com/css?family=Roboto:400,500,300,700);
body {
  background: -webkit-linear-gradient(left, #25c481, #25b7c4);
  background: linear-gradient(to right, #25c481, #25b7c4);
  font-family: "Roboto", sans-serif;
}


/* follow me template */
/* .made-with-love {
  margin-top: 40px;
  padding: 10px;
  clear: left;
  text-align: center;
  font-size: 10px;
  font-family: arial;
  color: #fff;
}
.made-with-love i {
  font-style: normal;
  color: #f50057;
  font-size: 14px;
  position: relative;
  top: 2px;
}
.made-with-love a {
  color: #fff;
  text-decoration: none;
}
.made-with-love a:hover {
  text-decoration: underline;
} */
</style>
