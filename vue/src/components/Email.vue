<template>
  <div class="container">
    <p>Pothole ID: {{ filterById.potholeId }}</p>

    <form ref="form" @submit.prevent="sendEmail">
      <label>Name</label>
      <input type="text" name="name" placeholder="Your Name" />
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
  display: block;
  margin: auto;
  text-align: center;
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
  width: 50%;
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
  background-color: #4caf50;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
}

input[type="submit"]:hover {
  background-color: #45a049;
}
</style>