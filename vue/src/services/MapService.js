import axios from "axios";

const key = 'AIzaSyCs0KV3vkvdaYxzfXSSszsWCmSxqguKZiE';

export default {
    getMapInformation(address){
        return axios.get(`https://maps.googleapis.com/maps/api/geocode/json?address=${address}&key=${key}`)
    }
}