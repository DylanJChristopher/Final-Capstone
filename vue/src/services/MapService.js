import axios from "axios";

const api_key = 'AIzaSyCs0KV3vkvdaYxzfXSSszsWCmSxqguKZiE';

export default{
    getMapInformation(){
        return axios.get('https://maps.googleapis.com/maps/api/js?libraries=places&key=' + api_key)
    }
}