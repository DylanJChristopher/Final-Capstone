import axios from "axios";



export default{
    retrievePotholes(){
        return axios.get('/pothole')
    }
}