
<template>
    <div>
        <progress-bar/>
        <form v-on:submit.prevent="upload()">
<label for="file-input">Upload:</label>
<input
id= "file-input"
type="file"
accept="image/png, image/jpeg"
@change="handleFileChange($event)"
/>
<button v-on:click="upload()" type="submit" :disabled="filesSelected<1"> Upload</button>
    </form>
    <section v-if="results && results.secure_url">
        <img src="results.secure_url" alt="results.public_id">
    </section>
    </div>
</template>






<script>
import ProgressBar from "vuejs-progress-bar";
import axios from "axios";


export default {
    name: "CloudiaryUpload",
components: {
    ProgressBar
    
},
data() {
    return {
    file : null,
     filesSelected : null,
     formData : null,
     fileContents: [],
     progress: null,
     showProgress : false,
     results : null,
     errors : [],
     reader : null,

    }

},
methods:{
    handleFileChange: function(event){
        this.file = event.target.files[0];
        this.filesSelected = event.target.files.length;
    },
    
    

    prepareFormData(){
        console.log("did it make it?")
        this.formData = new FormData();
        this.formData.append("upload_preset","vue-upload");
        this.formData.append("file",this.fileContents);
    },
    upload: function() {
        const reader = new FileReader();
         console.log("before removeEventListener")
        reader.addEventListener("load", function(){
            console.log("elise is yelling at me");
            this.fileContents = reader.result;
            
            this.prepareFormData();
           
        let cloudinaryUploadURL = 'https://cors-anywhere.herokuapp.com/https://api.cloudinary.com/v1_1/team-india/upload';
        console.log(" before requestObj")
        let requestObj ={
            url: cloudinaryUploadURL,
            method: "POST",
            DATA: this.formData,
            onUploadProgress: function(progressEvent){
                console.log("progress", progressEvent);
                this.progress=Math.round(
                    (progressEvent.loaded * 100.0) / progressEvent.total
                );
                console.log(this.progress);
            }.bind(this)
        };
        this.showProgress = true;
        axios(requestObj)
        .then(response => {
            this.results = response.data;
            console.log(this.results);
            console.log("public_id", this.results.public_id);
        })
        .catch(error => {
            this.errors.push(error);
            console.log(this.error);
        })
        .finally(()=> {
            setTimeout(
                function() {
                    this.showProgress = false;
                }.bind(this),
                1000
            );
        });
        
        }.bind(this),false);

        if(this.file && this.file.name){
            reader.readAsDataURL(this.file);
        }


        

     

                
            }
        }
    }




        
   
</script>

