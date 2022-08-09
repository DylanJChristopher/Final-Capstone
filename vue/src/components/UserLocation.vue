<template>
  <div>
    <div>
      <label>
        
        <button
          v-on:click="
          addressToString();
          retrieveAllPotholeLocations();
            addLocationMarker();
            
          "
        >
           Click Twice but do NOT double click to Display Reported Potholes
        </button>
      </label>
      <br />
    </div>
    <br />
    <gmap-map :zoom="14" :center="center" style="width: 100%; height: 600px">
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
        lat: 40.0155,
        lng: -82.9932,
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null,

      addressMarker: null,
      partialData: [],
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
    retrieveAllPotholeLocations(){
      for (let i = 0; i < this.addressString.length; i++) {
         mapService.getMapInformation(this.addressString[i]).then((response) => {
         this.potholeLocations.push(response.data);
        });
      }

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
          this.center = marker;
           this.partialData2 = null;
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
computed: {
 
},
}
</script>