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

// Makes a GET request to the locally hosted server, using the provided year and severity
// Calculates the number of entries in the returned JSON, and displays the count of rows
// The JSON is still fully valid, so it can be used to display other data about the entries
const getCount = async () => {
    const response = await fetch('http://192.168.1.11:5000/api/accidents?year=' + year + '&severity=' + severity);
    const accidentsJSON = await response.json();
    var count = Object.keys(accidentsJSON).length;

    results.innerHTML = "Count: " + count;
}
