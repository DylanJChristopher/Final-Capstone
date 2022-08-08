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

export default {
  name: "user-location",
  props: ['pothole'],
  data() {
    return {
      center: { 
        lat: 39.983334,
        lng: -82.983330
      },
      locationMarkers: [],
      locPlaces: [],
      existingPlace: null,

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
      if (this.existingPlace) {
        const marker = {
          lat: this.existingPlace.geometry.location.lat(),
          lng: this.existingPlace.geometry.location.lng()
        };
        this.locationMarkers.push({ position: marker });
        this.locPlaces.push(this.existingPlace);
        this.center = marker;
        this.existingPlace = null;
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