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
    <!-- @click="center = m.position" -->
   
    <gmap-map  :zoom="zoomValue" :center="centerComputed" id="mapElement">

      
      <gmap-marker
        :key="index"
        @click="center = m.position"
        v-for="(m, index) in locationMarkers"
        :position="m.position"
        :icon="'https://res.cloudinary.com/tipsindia/image/upload/v1660768285/pothole-map-marker-removebg-preview.png'"
        :clickable="true"
        
      >
   
      </gmap-marker> 
    </gmap-map> 
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
    centerComputed() {
      return {
        lat: parseFloat(this.$store.state.center.lat),

        lng: parseFloat(this.$store.state.center.lng),
      };
    },
    zoomValue() {
      let key = this.$store.state.zoomValue;
      return key;
    },
  },

  methods: {


    addressToString(potholes1) {
      console.log("blake");
      let streetName = "";
      let potholeCity = "";
      for (let i = 0; i < potholes1.length; i++) {
        streetName = potholes1[i].address.streetName;
        console.log(streetName);
        if (streetName.includes(" ")) {
          streetName = streetName.replace(" ", "+");
        }
        potholeCity = potholes1[i].address.city;
        console.log(potholeCity);
        if (potholeCity.includes(" ")) {
          potholeCity = potholeCity.replace(" ", "+");
        }
        this.addressString[i] =
          potholes1[i].address.streetNumber +
          "+" +
          streetName +
          ",+" +
          potholeCity +
          ",+" +
          potholes1[i].address.state;

        //1275+Kinnear+Rd,+Columbus,+OH
      }
    },

    initMarker(loc) {
      this.existingPlace = loc;
    },
    addLocationMarker() {
      console.log("dylan")
      for (let i = 0; i < this.addressString.length; i++) {
        this.addressMarker = this.potholeLocations[i];
        this.partialData = this.addressMarker.results;
        this.partialData2 = this.partialData[0];
        console.log("marker added")

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
      
      for (let i = 0; i < this.addressString.length; i++) {
        mapService.getMapInformation(this.addressString[i]).then((response) => {
          this.potholeLocations.push(response.data);
          console.log(response.data);
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
#elise-is-yelling{
  background-color: black; 
  opacity: 100%;
}

#mapElement {
  width: 100%;
  height: 100%;
}
button {
  margin: 0;
  padding: 0;
}
</style>