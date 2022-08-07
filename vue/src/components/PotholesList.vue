<template>
  <div>
      <table class="cinereousTable">
<thead>
<tr>
<th>Pothole Image</th>
<th>Nearest Address</th>
<th>Zip Code</th>
<th>Direction</th>
<th>Status</th>
<th>Severity</th>
<th>Discovery Date</th>
<th>Description</th>
</tr>
</thead>
<tbody>
<tr v-for="pothole in potholes" v-bind:key="pothole.id">
<td>Pothole Image</td>
<td>{{pothole.address.streetNumber}} {{pothole.address.streetName}}</td>
<td>{{pothole.address.zipCode}}</td>
<td>{{pothole.direction}}</td>
<td>Status</td>
<td>{{pothole.severity}}</td>
<td>{{pothole.discoveryDate}}</td>
<td>{{pothole.description}}</td>
</tr>
</tbody>
</table>
  </div>
</template>

<script>

import potHolesService from '../services/PotholesService';
export default {
    data(){
        return {
            potholes: [
                
            ]
            
        
        }
    },
created(){
    potHolesService.retrievePotholes().then(response => {
        this.potholes= response.data
        

    })
}

}
</script>

<style>
table.cinereousTable {
  border: 1px solid #1C6EA4;
  background-color: #EEEEEE;
  width: 100%;
  text-align: center;
}
table.cinereousTable td, table.cinereousTable th {
  padding: 3px 2px;
}
table.cinereousTable tbody td {
  font-size: 13px;
}
table.cinereousTable thead {
  background: #1C6EA4;
  background: -moz-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: -webkit-linear-gradient(top, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
  background: linear-gradient(to bottom, #5592bb 0%, #327cad 66%, #1C6EA4 100%);
}
table.cinereousTable thead th {
  font-size: 15px;
  font-weight: bold;
  color: #FFFFFF;
  text-align: left;
}
table.cinereousTable tfoot td {
  font-size: 14px;
}
</style>