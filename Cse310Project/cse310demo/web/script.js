/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


const getLocation = document.getElementById('search-btn');
var ip;
let latitude,longitude;

$.getJSON('https://ipapi.co/json/', function(data){
    ip = data.ip;
  console.log(data.ip)
})
getLocation.addEventListener('click',evt=>{
    if('geolocation' in navigator){
    navigator.geolocation.getCurrentPosition(position=>{
        latitude = position.coords.latitude;
        longitude = position.coords.longitude;
        console.log(position);

        const api =`http://api.ipstack.com/`+ ip +`?access_key=db5097a2f686df84870b828476450f45`; 
        fetch(api)
        .then(response=>{
            return response.json();
        })
        .then(data=>{
            console.log(data);
            q = data.city+","+data.region_name+","+data.country_name;
            place();
        })
    });
    }
  });
  var q = '';
  function place(){
      document.getElementById("search-box").value = q;
  }