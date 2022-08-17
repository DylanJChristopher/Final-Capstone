<template>
  <div>
      <input type="file" @change = "onFileSelected">
      <button @click= "onUpload">Upload</button>
  </div>
</template>
<script>
import axios from 'axios'
export default {
    data() {
        return{
            selectedFile: null,
        }
        
    },
    methods: {
        onFileSelected(event){
            this.selectedFile = event.target.files[0];
        },
        onUpload(){
            const fd = new FormData();
            fd.append
            axios.post('https://res.cloudinary.com/tipsindia/image/upload/v1660577309/')
        },
    }
}
</script>
<style scoped>

</style>
