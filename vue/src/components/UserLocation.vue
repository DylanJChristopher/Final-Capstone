<template>
  <div>
    <!-- <button
      v-on:click.prevent="
        addressToString();
        retrieveAllPotholeLocations();
        addLocationMarker();

      "
    >
      Refresh
    </button> -->
    <!-- <div>
      <label> Pothole Map </label>
    </div> -->
    <gmap-map :zoom="9" :center="center" id="mapElement">
      <!--  was after :key="index" -->
      <gmap-marker
        :key="index"
        @click="center = m.position"
        v-for="(m, index) in locationMarkers"
        :position="m.position"
      ></gmap-marker>
    </gmap-map>
    <button @click="centerWhenClicked">HWLPPPPP</button>
  </div>
</template>
 
<script>
import mapService from "../services/MapService.js";
import potholesService from "../services/PotholesService.js";

export default {
  name: "user-location",
  props: ["potholes"],
  data() {
    return {
      center: {
        lat: 39.983334,
        lng: -82.98333,
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null,

      addressMarker: null,
      partialData: null,
      partialData2: null,

      addressString: [],
      filteredPotholes: [],

      potholes1: [],
      potholes33: [],

      potholeLocations: [],
      //1275+Kinnear+Rd,+Columbus,+OH
    };
  },
  computed: {
    currentTHings() {
      return this.$store.state.center.lng;
    },
  },

  methods: {
    centerWhenClicked() {
      console.log(this.currentTHings);
      this.center = {
        lat: parseFloat(this.$store.state.center.lat),

        lng: parseFloat(this.$store.state.center.lng),
      };
      console.log("elise");
    },
    addressToString(potholes1) {
      console.log("blake");
      let streetName = "";
      for (let i = 0; i < potholes1.length; i++) {
        streetName = potholes1[i].address.streetName;
        console.log(streetName);
        if (streetName.includes(" ")) {
          streetName = streetName.replace(" ", "+");
        }
        this.addressString[i] =
          potholes1[i].address.streetNumber +
          "+" +
          streetName +
          ",+" +
          potholes1[i].address.city +
          ",+" +
          potholes1[i].address.state;

        //1275+Kinnear+Rd,+Columbus,+OH
      }
    },

    initMarker(loc) {
      this.existingPlace = loc;
    },
    addLocationMarker() {
      for (let i = 0; i < this.addressString.length; i++) {
        this.addressMarker = this.potholeLocations[i];
        this.partialData = this.addressMarker.results;
        this.partialData2 = this.partialData[0];

        const marker = {
          lat: this.partialData2.geometry.location.lat,
          lng: this.partialData2.geometry.location.lng,
        };
        this.locationMarkers.push({ position: marker });
        this.locPlaces.push(this.partialData2);
        // this.center = marker;
        // this.partialData2 = null;
      }
    },
    retrieveAllPotholeLocations() {
      console.log("elise");
      for (let i = 0; i < this.addressString.length; i++) {
        mapService.getMapInformation(this.addressString[i]).then((response) => {
          this.potholeLocations.push(response.data);
          this.addLocationMarker();
        });
      }
    },

    locateGeoLocation: function () {
      this.center = {
        lat: this.$store.state.center.lat,
        lng: this.$store.state.center.lng,
      };
    },
  },
  mounted() {
    this.locateGeoLocation();
  },

  created() {
    potholesService.retrievePotholes().then((response) => {
      this.potholes1 = response.data;
      this.filteredPotholes = this.potholes1;
      this.filteredPotholes = this.potholes1.filter((pothole) => {
        return pothole.repair.status == "Pending";
      });
      this.addressToString(this.filteredPotholes);
      this.retrieveAllPotholeLocations();

      //this.potholeLocations.push(response.data);
    });
  },
};
</script>
<style scoped>
#mapElement {
  width: 100%;
  height: 100%;
}
button {
  margin: 0;
  padding: 0;
}
</style>