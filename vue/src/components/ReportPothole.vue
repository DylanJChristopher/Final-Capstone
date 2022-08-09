<template>
  <div>
    <form v-show="showForm == true" class="row g-3" v-on:submit.prevent >
      <div class="col-md-6">
        <label for="Direction" class="form-label">Direction: </label>
        <input
          type="Direction"
          class="form-control"
          placeholder="North,East, etc"
          required
          v-model="pothole.direction"
        />
      </div>
      <label for="severity" class="form-label">Severity: </label>
      <select class="form-select" aria-label="Default select example" required
      v-model="pothole.severity">
        <option selected></option>
        <option value="1">1</option>
        <option value="2">2</option>
        <option value="3">3</option>
        <option value="4">4</option>
        <option value="5">5</option>
        <option value="6">6</option>
        <option value="7">7</option>
        <option value="8">8</option>
        <option value="9">9</option>
        <option value="10">10</option>
      </select>
      <div class="col-12">
        <label for="street number" class="form-label">Street Number</label>
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
        <label for="street name" class="form-label">Street Name</label>
        <input
          type="text"
          class="form-control"
          id="inputAddress2"
          placeholder="Main St"
          required
          v-model="pothole.address.streetName"
        />
      </div>
      <div class="col-md-6">
        <label for="inputCity" class="form-label">City</label>
        <input
          type="text"
          class="form-control"
          id="inputCity"
          required
          v-model="pothole.address.city"
        />
      </div>
      <div class="col-md-4">
        <label for="inputState" class="form-label">State</label>
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
      <div class="col-md-2">
        <label for="inputZip" class="form-label">Zip</label>
        <input
          type="text"
          class="form-control"
          id="inputZip"
          required
          v-model="pothole.address.zipCode"
        />
      </div>
      <div class="form-floating">
        <label for="floatingTextarea2">Comments: </label>
        <textarea
          class="form-control"
          placeholder="Leave a comment here"
          id="floatingTextarea2"
          style="height: 100px"
          maxlength="300"
          v-model="pothole.description"
        ></textarea>
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
        </div>
         <button v-on:click="submitPothole" 
        
        type="button"
        class="btn btn-submit"
      >
        Submit TIP
      </button>
      
      </div>
     
    </form>
    <button v-on:click="formSet()" v-show="showButton == true">
      Submit a Tip
    </button>
  </div>
</template>

<script>
import PotholeService from "../services/PotholesService";
export default {
  data() {
    return {
      showForm: false,
      showButton: true,
      pothole: {
        address: {
          streetName: "",
          streetNumber: "",
          city: "",
          state: "",
          zipCode: "",
        },
        repair: {
          status: false,
          repairDate: "",
        },
        direction: "",
        severity: "",
        discoveryDate: "",
        description: "",
      },
    };
  },
  methods: {
    formSet() {
      this.showForm = true;
      this.showButton = false;
    },
    formReset() {
      this.showForm = false;
      this.showButton = true;
    },
    submitPothole() {
        console.log("yageen");
        this.formReset()
      PotholeService.reportPothole(this.pothole).then((response) => {
          if(response.status == 200){
              console.log('elise');
            
          }
      });
          
      
    
          
      
    },
  },
};
</script>

<style>
</style>