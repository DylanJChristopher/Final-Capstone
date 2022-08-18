<template>
  <div class="container">
    <p>Pothole ID: {{ filterById.potholeId }}</p>

    <form ref="form" @submit.prevent="sendEmail">
     <h2>Message Pothole Inspection Team</h2>
      <label>Message</label>
      <textarea name="message" cols="30" rows="5" placeholder="Message">
      </textarea>

      <input type="submit" value="Send" />
    </form>
  </div>
</template>

<script>
import emailjs from "@emailjs/browser";

export default {
  props: ["potholes"],
  methods: {
    clearForm() {
      this.name = "";
      this.email = "";
      this.message = "";
    },
    sendEmail() {
      console.log("Dylan");
      emailjs
        .sendForm(
          "inspection_form",
          "inspection_form",
          this.$refs.form,
          "i1hwz5MOefNbjQBqs"
        )
        .then(
          (result) => {
            console.log("SUCCESS!", result.text);
            this.$router.push({ name: "employee" });
          },
          (error) => {
            console.log("FAILED...", error.text);
            this.$router.push({ name: "employee" });
          }
        );
    },
    dateFormat(potholeDate) {
      let date = new Date(potholeDate);
      return date.toLocaleString();
    },
  },
  computed: {
    filterById() {
      let results = [];
      let filteredPotholes = this.potholes;
      results = filteredPotholes.filter((pothole) => {
        return pothole.potholeId == this.$store.state.pothole;
      });
      return results[0];
    },
  },
};
</script>
<style scoped>
* {
  box-sizing: border-box;
}

.container {
  display: flex;
  flex-direction: column;
  text-align: center;
  padding: 20px;
   height:100vh;
   width: 100%;
  justify-content: center;
  background-color: rgb(255, 240, 212);;
  opacity: 85%;
  border-radius:15px;
  align-items: center;
  box-shadow: 0 2px 2px 0 rgba(0,0,0,0.24), 0 2px 2px 0 rgba(0,0,0,0.19);
}

label {
  float: left;
}

input[type="text"],
[type="email"],
textarea {
  width: 100%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  box-sizing: border-box;
  margin-top: 6px;
  margin-bottom: 16px;
  resize: vertical;
}

input[type="submit"] {
  background-color: #646F4B;;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type="submit"]:hover {
   box-shadow: 0 2px 2px 0 rgba(0,0,0,0.24), 0 2px 2px 0 rgba(0,0,0,0.19);
   background-color: #7b8b54;
}

</style>