<template>
  <div>
    <button
      v-on:click.prevent="
        addressToString();
        retrieveAllPotholeLocations();
        addLocationMarker();
        addLocationMarker();

      "
    >
      Refresh
    </button>
    <div>
      <label> Pothole Map </label>
    </div>
    <gmap-map :zoom="11" :center="center" id="mapElement">
      // @click="center=m.position" was after :key="index"
      <gmap-marker
        :key="index"
        v-for="(m, index) in locationMarkers"
        :position="m.position"
      ></gmap-marker>
    </gmap-map>
  </div>
</template>
 
<script>
import mapService from "../services/MapService.js";

export default {
  name: "user-location",
  props: ["potholes"],
  data() {
    return {
      center: {
        lat: 39.0155,
        lng: -82.9932,
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null,

      addressMarker: null,
      partialData: null,
      partialData2: null,
      addressString: [],
      potholeLocations: [],
      //1275+Kinnear+Rd,+Columbus,+OH
    };
  },

  mounted() {
    this.locateGeoLocation();
  },

  methods: {
    initMarker(loc) {
      this.existingPlace = loc;
    },
    retrieveAllPotholeLocations() {
      console.log("elise");
      for (let i = 0; i < this.addressString.length; i++) {
        mapService.getMapInformation(this.addressString[i]).then((response) => {
          this.potholeLocations.push(response.data);
        });
      }
    },
    addLocationMarker() {
      console.log("yageen");
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
        this.center = marker;
        // this.partialData2 = null;
      }
    },
    locateGeoLocation: function () {
      navigator.geolocation.getCurrentPosition((res) => {
        this.center = {
          lat: res.coords.latitude,
          lng: res.coords.longitude,
        };
      });
    },
    addressToString() {
      console.log("blake");
      for (let i = 0; i < this.potholes.length; i++) {
        let streetName = this.potholes[i].address.streetName;
        if (streetName.includes(" ")) {
          streetName = streetName.replace(" ", "+");
        }
        this.addressString[i] =
          this.potholes[i].address.streetNumber +
          "+" +
          streetName +
          ",+" +
          this.potholes[i].address.city +
          ",+" +
          this.potholes[i].address.state;

        //1275+Kinnear+Rd,+Columbus,+OH
      }
    },
  },
  computed: {},
};
</script>
<style scoped>
#mapElement {
  width: 100%;
  height: 85vh;
  opacity: 100%;
}
button {
  margin: 0;
  padding: 0;
}
</style>