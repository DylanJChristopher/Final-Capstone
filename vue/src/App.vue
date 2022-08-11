
<template>
  <div id="app">
    <header>
      <img src="./assets/final logo.jpg" id="logo" />
      <nav id="nav">
        <div id="spaceHolder"></div>
        <ul>
                   <li>
            <router-link class="links" v-bind:to="{ name: 'login' }" v-show="$store.state.token == ''"
              >Login</router-link
            >
          </li>
          <li>
            <router-link class="links" v-bind:to="{ name: 'home' }"
              >Home</router-link
            >
          </li>
          <li>
            <router-link class="links" v-bind:to="{ name: 'potholes' }"
              >Potholes
            </router-link>
          </li>
          <li><a class="links" href="contact.asp">Contact</a></li>

           <li>
            <router-link
              class="links"
              v-bind:to="{ name: 'logout' }"
              v-show="$store.state.token != ''"
              >Logout</router-link
            >
          </li>
        </ul>
      </nav>
    </header>

    <router-view id="router-view" />

    <footer>&#169; Copyright of TIPS</footer>
  </div>
</template>
<style >
body {
  margin: 0%;
  padding: 0%;
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
#spaceHolder {
  flex-grow: 2;
}
#nav {
  flex-grow: 2;
  align-content: flex-end;
  display: flex;
  flex-direction: column;
}
.links {
  color: #f5851f;
  text-decoration: unset;
}
.links:hover{
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
}

ul {
  display: flex;
  justify-content: space-evenly;
  list-style-type: none;
  margin: 0;
  padding: 0;
}
#logo {
  border-radius: 50%;
  height: auto;
  /* width: 5%; */
  padding: 5px;
  size-adjust: 50%;
}
#router-view {
  grid-area: router-view;
  height: 85vh;
}

header {
  display: flex;
  height: auto;
  width: 100%;
  margin: 0;
  justify-content: space-between;
  background-color: black;
  grid-area: header;
  height: 10vh;
}
footer {
  background-color: black;
  grid-area: footer;
  color: #f5851f;
  position: relative;
  bottom: 0;
  width: 100%;
  height: 5vh;
  font-size: small;
  display:flex;
  justify-content: center;
  align-items: center;
}
#app {
  display: grid;
  grid-template-columns: 1fr 1fr 1fr;
  grid-template-areas:
    "header      header      header"
    "router-view router-view router-view"
    "router-view router-view router-view"
    "router-view router-view router-view"
    "footer      footer      footer";
  font-family: sans-serif;
  font-weight: bold;
  height: auto;
  margin: 0%;
  padding: 0%;
}
button {
  font-family: Arial, Helvetica, sans-serif;
  font-weight: bold;
}
</style>
