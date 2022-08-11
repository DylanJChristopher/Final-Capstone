import axios from "axios";



export default{
    retrievePotholes(){
        return axios.get('/pothole')
    },
    reportPothole(pothole){
        console.log('blake')
        return axios.post('/pothole', pothole)
    },
    // Use tick-marks instead of quotes because we are trying to pass information inside the url
}