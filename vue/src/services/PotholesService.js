import axios from "axios";



export default{
    retrievePotholes(){
        return axios.get('/pothole')
    
    },
    reportPothole(pothole){
        console.log('blake')
        return axios.post('/pothole', pothole)
    }
  
}