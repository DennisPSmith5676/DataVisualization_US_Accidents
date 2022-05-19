// Add console.log to check to see if our code is working.
console.log("working");

// Default values
var year = 2016;
var severity = 1;
var count = 0;

// Runs getCount() when severity dropdown is modified
document.getElementById("severity").addEventListener("change", function () {
    var e = document.getElementById("severity");
    severity = e.value;

    getCount();
});

// Runs getCount() when years dropdown is modified
document.getElementById("years").addEventListener("change", function () {
    var e = document.getElementById("years");
    year = e.value;

    getCount();
});

// Locates results div, to edit
const results = document.getElementById("results");

// Generates map
let streets = L.tileLayer('https://api.mapbox.com/styles/v1/mapbox/streets-v11/tiles/{z}/{x}/{y}?access_token={accessToken}', {
	attribution: 'Map data &copy; <a href="https://www.openstreetmap.org/">OpenStreetMap</a> contributors, <a href="https://creativecommons.org/licenses/by-sa/2.0/">CC-BY-SA</a>, Imagery (c) <a href="https://www.mapbox.com/">Mapbox</a>',
	maxZoom: 8,
	accessToken: config.apiKey
});

let map = L.map('map', {
	center: [40.7, -94.5],
	zoom: 3,
	layers: [streets]
});

// pop up markers
var popupGroup = L.layerGroup().addTo(map);

// Makes a GET request to the locally hosted server, using the provided year and severity
// Calculates the number of entries in the returned JSON, and displays the count of rows
// The JSON is still fully valid, so it can be used to display other data about the entries
const getCount = async () => {
    const response = await fetch('http://192.168.1.11:5000/api/accidents?year=' + year + '&severity=' + severity);
    const accidentsJSON = await response.json();
    var count = Object.keys(accidentsJSON).length;
    
    // Displays the number of accidents
    results.innerHTML = "<strong>Count: </strong>" + count;

    // Ensures that no more than 1000 points are displayed at once on the map
    // Mathematically samples every n points based on the size of the dataset
    var threshold = Math.pow(10, (count.toString().length-3));
    console.log("Threshold: " + threshold);
    console.log("Points Displayed: " + Math.floor(count/threshold));
    
    // Clears the map of any markers
    popupGroup.clearLayers();

    // Loops through the JSON, and adds markers to the map
    for (var i = 0; i < count; i=i+threshold) {
        var lat = accidentsJSON[i].Start_Lat;
        var lon = accidentsJSON[i].Start_Lng;
        var marker = L.circleMarker([lat, lon], {radius: 4,closeOnClick: false, autoClose: false, closeButton: true}).addTo(popupGroup);
        marker.bindPopup(
            "Humidity: " + accidentsJSON[i]["Humidity(%)"] + 
            "<br>Pressure(in): " + accidentsJSON[i]["Pressure(in)"] + 
            "<br>Temperature(F): " + accidentsJSON[i]["Temperature(F)"] + 
            "<br>Wind Chill(F): " + accidentsJSON[i]["Wind_Chill(F)"]
            );
        popupGroup.addTo(map);
    }
}