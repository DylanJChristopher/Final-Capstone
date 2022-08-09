<template>
  <div>
    <div>
      <label>
        <gmap-autocomplete @place_changed="initMarker"></gmap-autocomplete>
        <button @click="addLocationMarker">Add</button>
      </label>
      <br/>
 
    </div>
    <br>
    <gmap-map
        :zoom="14"    
        :center="center"
        style="width:100%;  height: 600px;"
      >
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
import mapService from '../services/MapService.js'

export default {
  name: "user-location",
  props: ['pothole'],
  data() {
    return {
      center: { 
        lat: 40.0155,
        lng: -82.9932
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null,

       addressMarker: null,
       partialData: [],
       partialData2: null,

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
    addLocationMarker() {
      mapService.getMapInformation().then((response) => {
        this.addressMarker = response.data;
        this.partialData = this.addressMarker.results;
        this.partialData2 = this.partialData[0];
      });
      
      if (this.existingPlace) {
        const marker = {
          lat: this.partialData2.geometry.location.lat,
          lng: this.partialData2.geometry.location.lng
        };
        this.locationMarkers.push({ position: marker });
        this.locPlaces.push(this.partialData2);
        this.center = marker;
        this.partialData2 = null;
      }
    },
    locateGeoLocation: function() {
      navigator.geolocation.getCurrentPosition(res => {
        this.center = {
          lat: res.coords.latitude,
          lng: res.coords.longitude
        };
      });
    }
  }
};
</script>