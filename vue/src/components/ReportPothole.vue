<template>
  <div>
    <!-- v-show="showForm == true" Goes in form element -->

    <form class="row g-3" v-on:submit.prevent="upload">
      <h1 class="h3 mb-3 font-weight-normal">Report a Pothole</h1>
      <div class="col-12">
        <label for="Direction" class="form-label">Direction of Travel: </label>
        <input
          type="Direction"
          class="form-control"
          placeholder="North,East, etc"
          required
          v-model="pothole.direction"
        />
      </div>
      <div class="col-12">
        <label for="severity" class="form-label">Pothole Severity: </label>
        <select
          class="form-select"
          aria-label="Default select example"
          required
          v-model="pothole.severity"
        >
          <option selected></option>
          <option value="1">1: Just a crack</option>
          <option value="2">2: Noticeable</option>
          <option value="3">3: Bit of a nuisance</option>
          <option value="4">4: Annoying</option>
          <option value="5">5: Big pothole</option>
          <option value="6">6: Swerve to avoid</option>
          <option value="7">7: A crater</option>
          <option value="8">8: Like staring into an abyss</option>
          <option value="9">9: I see it from space</option>
          <option value="10">10: Mariana Trench</option>
        </select>
      </div>
      <div class="col-12">
        <label for="street number" class="form-label">Street Number: </label>
        <input
          type="text"
          class="form-control"
          id="inputAddress"
          placeholder="1234"
          required
          v-model="pothole.address.streetNumber"
        />
      </div>
      <div class="col-12">
        <label for="street name" class="form-label">Street Name: </label>
        <input
          type="text"
          class="form-control"
          id="inputAddress2"
          placeholder="Main St"
          required
          v-model="pothole.address.streetName"
        />
      </div>
      <div class="col-12">
        <label for="inputCity" class="form-label">City: </label>
        <input
          type="text"
          class="form-control"
          id="inputCity"
          required
          v-model="pothole.address.city"
        />
      </div>
      <div class="col-12">
        <label for="inputState" class="form-label">State: </label>
        <select
          id="inputState"
          class="form-select"
          required
          v-model="pothole.address.state"
        >
          <option selected>Choose...</option>
          <option>OH</option>
        </select>
      </div>
      <div class="col-12">
        <label for="inputZip" class="form-label">Zip Code: </label>
        <input
          type="text"
          class="form-control"
          id="inputZip"
          required
          v-model="pothole.address.zipCode"
        />
      </div>
      <div class="col-12">
        <label for="floatingTextarea2">Comments: </label>
        <input
          type="text"
          class="form-control"
          id="floatingTextarea2"
          required
          v-model="pothole.description"
          placeholder="Leave a comment here"
        />
        <!-- <textarea
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea2"
          style="height: 15px"
          maxlength="300"
          v-model="pothole.description"
        ></textarea> -->
      </div>
      <div class="col-12">
        <div>
          <form action="/action_page.php">
            <label for="discovery date">Discovery Date (date and time): </label>
            <input
              type="datetime-local"
              id="discovery date"
              name="discovery date"
              required
              v-model="pothole.discoveryDate"
            />
          </form>
          <button @click="openUploadModal">Upload Pothole Photo</button>
        </div>

        <div class="col-12">
          <button
            v-on:click="submitPothole()"
            type="button"
            class="btn btn-submit"
          >
            Submit TIP
          </button>
        </div>
      </div>
    </form>

    <!-- <button v-on:click="formSet()" v-show="showButton == true">
      Submit a Tip
    </button> -->
    <div>
      <!-- <cl-upload /> -->
    </div>

    
  </div>
</template>

<script>
import PotholeService from "../services/PotholesService";
// import CloudiaryUpload from "../components/CloudiaryComponent.vue"

export default {
  components: {
    // "cl-upload" : CloudiaryUpload,
  },

  data() {
    return {
      showForm: false,
      showButton: true,

      imageData: null,

      pothole: {
        address: {
          streetName: "",
          streetNumber: "",
          city: "",
          state: "",
          zipCode: "",
        },
        repair: {
          status: "Pending",
          repairDate: "",
        },
        direction: "",
        severity: "",
        discoveryDate: "",
        description: "",
        secureUrl:
          "https://res.cloudinary.com/tipsindia/image/upload/v1660593331/placeholder-image.png",
      },
    };
  },
  methods: {
    submitPothole() {
      console.log("yageen");
      PotholeService.reportPothole(this.pothole).then((response) => {
        if (response.status == 200) {
          console.log("elise");
          this.$router.push({ name: "potholes" });
        }
      });
    },
    openUploadModal() {
      window.cloudinary
        .openUploadWidget(
          {
            cloud_name: "tipsindia",
            upload_preset: "test123",
          },
          (error, result) => {
            if (!error && result && result.event === "success") {
              console.log("Done uploading..: ", result.info);
              this.imageData = result.info;
              this.pothole.secureUrl = this.imageData.secure_url;
            }
          }
        )
        .open();
    },
  },
};
</script>

<style scoped>
.col-12 {
  margin: 7px;
  font-family: Arial, Helvetica, sans-serif;
}
h1 {
  text-align: center;
  height: 7vh;
}
button{
  margin: 5px 0px 5px 0px;
}
</style>