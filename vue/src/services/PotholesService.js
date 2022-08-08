import axios from "axios";



export default{
    retrievePotholes(){
        return axios.get('/pothole')
    
    },
    reportPothole(pothole){
        return axios.post('/pothole', pothole)
    }
  
}