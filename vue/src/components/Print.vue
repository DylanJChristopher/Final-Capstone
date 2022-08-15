<template>
  <div>
    <div v-for="pothole in filterById" v-bind:key="pothole.potholeId">
      <div class="detail" v-on:click="filterById">
        <div>Date Assigned: ____________________________</div>
        <div>
          Pothole ID: {{ pothole.potholeId }}
        </div>
        <div>
          {{ pothole.address.streetNumber }}
          {{ pothole.address.streetName }} {{ pothole.address.city }}, OH
          {{ pothole.address.zipCode }}
        </div>
        <div>Discovery Date: {{ pothole.discoveryDate }}</div>
        <div>Severity: {{ pothole.severity }} / 10</div>

        <div>Status: {{ pothole.repair.status }}</div>
        <div>Scheduled Repair Day: {{ pothole.repair.repairDate }}</div>
        <div>Direction: {{ pothole.direction }}</div>
        <div class="description">Description {{ pothole.description }}</div>
        <section id="authorization">
          <div>Authorized By (Sign): _____________________________________</div>
          <div>
            Adjustment Done (Sign): ____________________________________
          </div>
          <div>Date Completed:__________________________</div>
          <div>
            Extension Needed (Sign): _____________________________________
          </div>
          <div>Days of Extension: ______ Days</div>
        </section>
      </div>
    </div>
    <span class="line"></span>
    <button id="print" @click="printWindow()">Print</button>
  </div>
</template>

<script>
export default {
  props: ["potholes"],
  methods: {
    printWindow: function () {
      window.print();
    },
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
  printPotholeId(pothole) {
    console.log(pothole.potholeId);
  },
};
</script>
<style scoped>
#authorization {
  border: 2px black solid;
}
div {
  margin: 30px 10px 10px 10px ;
}
.detail {
  margin: 50px, 0px, 100px, 0px;
}
.line {
  border-bottom: 2px solid black;
  display: block;
}
button{
    margin: 10px 0px 100px 10px;
}
</style>