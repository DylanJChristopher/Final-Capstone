import axios from "axios";

const key = 'AIzaSyCs0KV3vkvdaYxzfXSSszsWCmSxqguKZiE';

export default {
    getMapInformation(){
        return axios.get('https://maps.googleapis.com/maps/api/geocode/json?address=1275+kinnear+rd,+Columbus,+oh&key=' + key)
    }
}