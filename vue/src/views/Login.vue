<template>

  <div id="login" class="text-center">
    <section id="container">
    <form class="form-signin" @submit.prevent="login">
      <h1 class="h3 mb-3 font-weight-normal">Employee Login</h1>
      <div
        class="alert alert-danger"
        role="alert"
        v-if="invalidCredentials"
      >Invalid username and password!</div>
      <div
        class="alert alert-success"
        role="alert"
        v-if="this.$route.query.registration"
      >Thank you for registering, please sign in.</div>
      <label for="username" class="sr-only">Username</label>
      <input
        type="text"
        id="username"
        class="form-control"
        placeholder="Username"
        v-model="user.username"
        required
        autofocus
      />
      <label for="password" class="sr-only">Password</label>
      <input
        type="password"
        id="password"
        class="form-control"
        placeholder="Password"
        v-model="user.password"
        required
      />
      <!-- DO NOT DELETE THIS CODE BELOW! -->
      <!-- <router-link :to="{ name: 'register' }">Need an account?</router-link> -->
      <button type="submit">Sign in</button>
    </form>
    </section>
  </div>
</template>

<script>
import authService from "../services/AuthService";

export default {
  name: "login",
  components: {},
  data() {
    return {
      user: {
        username: "",
        password: ""
      },
      invalidCredentials: false
    };
  },
  methods: {
    login() {
      authService
        .login(this.user)
        .then(response => {
          if (response.status == 200) {
            this.$store.commit("SET_AUTH_TOKEN", response.data.token);
            this.$store.commit("SET_USER", response.data.user);
            this.$router.push("/employee");
          }
        })
        .catch(error => {
          const response = error.response;

          if (response.status === 401) {
            this.invalidCredentials = true;
          }
        });
    }
  }
};
</script>
<style scoped>
button:hover{
  box-shadow: 0 12px 16px 0 rgba(0,0,0,0.24), 0 17px 50px 0 rgba(0,0,0,0.19);
  
}
.form-signin{
  display: flex;
  flex-direction: column;
  justify-content: space-around;
  height: 50%;
  width: 25%;
  background-color: whitesmoke;
  opacity: 85%;
  align-items: center;
  border-radius: 15%;


}
label, input, button{
  width: 25%;
}
#login{
  height:85vh;
   width: 100vw;
 display: flex;
 justify-content: center;

 background-color: yellowgreen;
 align-items: center;


}
#container{
  height:85vh;
   width: 100vw;
 display: flex;
 justify-content: center;
background-image:url("../assets/pothole-2.jpg");
align-items: center;
  background-repeat:no-repeat;
  background-size: cover;
}
input{
  height: 7%;
}
</style>
