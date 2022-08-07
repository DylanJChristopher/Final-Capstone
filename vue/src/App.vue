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
        <router-link v-bind:to="{ name: '#' }">Submit a TIP</router-link>
      </div>
    </header>

    <router-view />
    <footer>&#169; Copyright of TIPS</footer>
  </div>
</template>
