import axios from "axios";

const key = "API_KEY_GOES_HERE";

export default {
    getMapInformation(addressString){
        console.log('HHHHH' + key)
        return axios.get('https://maps.googleapis.com/maps/api/geocode/json?address='+ addressString + '&key=' + key)
    }
}