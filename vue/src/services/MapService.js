import axios from "axios";

const key = 'AIzaSyDB2LKekobExfOpTHmglGUOhnUyduno0ho';

export default {
    getMapInformation(addressString){
        console.log('HHHHH' + key)
        return axios.get('https://maps.googleapis.com/maps/api/geocode/json?address='+ addressString + '&key=' + key)
    }
}