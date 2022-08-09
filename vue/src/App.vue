<template>
  <div id="app">
    <header>
      <div id="nav">
        <router-link v-bind:to="{ name: 'home' }">Home</router-link
        >&nbsp;|&nbsp;
        <router-link
          v-bind:to="{ name: 'logout' }"
          v-if="$store.state.token != ''"
          >Logout</router-link
        >
        <router-link v-bind:to="{ name: 'potholes' }"
          >Pottiest Holes </router-link
        >|
        <!-- <router-link v-bind:to="{ name: '#' }">Submit a TIP</router-link> -->
      </div>
    </header>
    
    <router-view id= 'router-view'/>

    <footer>&#169; Copyright of TIPS</footer>
  </div>
</template>

<style >
#router-view{
grid-area: router-view;

}

header{
  background-color: #281C15;
  grid-area: header;
}
footer{
  background-color: #281C15;
  grid-area: footer;
}
#app{
  display: grid;
  grid-template-columns: 
                1fr 1fr 1fr;
                grid-template-areas: "header      header      header"
                                     "router-view router-view router-view"
                                     "router-view router-view router-view"
                                     "router-view router-view router-view"
                                     "footer      footer      footer";
  font-family: sans-serif;
  font-weight: bold;
  height: auto;
  
}
button{
  font-family: sans-serif;
  font-weight: bold;
}


</style>
