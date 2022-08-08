<template>
  <div>

<form v-show = "showForm == true" class="row g-3">
  <div class="col-md-6">
    <label for="Direction" class="form-label">Direction:  </label>
    <input type="Direction" class="form-control" placeholder="North,East, etc" required>
  </div>
  <label for="severity" class="form-label">Severity:  </label>
 <select class="form-select" aria-label="Default select example" required>
     
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
    <input type="text" class="form-control" id="inputAddress" placeholder="1234" required>
  </div>
  <div class="col-12">
    <label for="street name" class="form-label">Street Name</label>
    <input type="text" class="form-control" id="inputAddress2" placeholder="Main St" required>
  </div>
  <div class="col-md-6">
    <label for="inputCity" class="form-label">City</label>
    <input type="text" class="form-control" id="inputCity" required>
  </div>
  <div class="col-md-4">
    <label for="inputState" class="form-label">State</label>
    <select id="inputState" class="form-select" required>
      <option selected>Choose...</option>
      <option>OH</option>
    </select>
  </div>
  <div class="col-md-2">
    <label for="inputZip" class="form-label">Zip</label>
    <input type="text" class="form-control" id="inputZip" required>
  </div>
  <div class="form-floating">
      <label for="floatingTextarea2">Comments:  </label>
  <textarea class="form-control" placeholder="Leave a comment here" id="floatingTextarea2" style="height: 100px" maxlength="300"></textarea>
  
</div>
  <div class="col-12">
    <div>
<form action="/action_page.php">
  <label for="discovery date">Discovery Date (date and time): </label>
  <input type="datetime-local" id="discovery date" name="discovery date" required>
  
</form>
</div>

  </div>
<button v-on:click ="formReset()" type="button" class="btn btn-primary btn-sm">Submit TIP</button>
</form>
<button v-on:click="formSet()" v-show=" showButton == true">Submit a Tip</button>
  </div>
</template>

<script>
export default {
data() {
    return {   
        showForm: false,
        showButton: true
}

},
methods: {

formSet (){
    this.showForm = true;
    this.showButton = false;
},
formReset(){
this.showForm = false;
this.showButton = true;
}

}
}
</script>

<style>

</style>