// LEAFLET MAP

let leafletMap = L.map('map').setView([41.394457, 2.177307], 13);
leafletMap.locate({ setView: true, maxZoom: 12 }); // get user location

let leafletTiles = L.tileLayer('https://tile.thunderforest.com/mobile-atlas/{z}/{x}/{y}.png?apikey=d31e8c30b7434c41ac1ba1085b1be7b7', {
	attribution: '&copy; <a href="http://www.thunderforest.com/">Thunderforest</a>, &copy; <a href="https://www.openstreetmap.org/copyright">OpenStreetMap</a> contributors',
	apikey: 'd31e8c30b7434c41ac1ba1085b1be7b7',
	maxZoom: 22
}).addTo(leafletMap);

// MARKERS MAP

/* global variables */
let all;
let food;
let foodTypes = [];
let markers = L.markerClusterGroup();
onMapLoad();

// JSON DATA AND DYNAMIC SELECT

/* load map and request to the api */
function onMapLoad() {
	$.getJSON('http://localhost/mapa/api/apiRestaurants.php', function (allRestaurants) {
		/* fill the select types from the database and filter them */
		allRestaurants.map(restaurant => {
			food = restaurant.kind_food.split(","); // remove duplicates values in the select
			for (i = 0; i < food.length; i++) {
				let check = foodTypes.includes(food[i]); // check is false
				if (!check) {
					foodTypes.push(food[i]); // add the no duplicates values in the select
					$(kind_food_selector).append(`<option value='${[food[i]]}'>${food[i]}</option>`);
				}
			}
		});
		/* get all data and call the function to show the markers */
		all = allRestaurants;
		render_to_map(all);
		console.log("database", all); // data console
	});
}


// SHOW THE MARKERS

/* add the icons and markers to the cluster and show them from the beginning */
function render_to_map(data) {
	for (i = 0; i < data.length; i++) {
		let iconUrlTimeout = $('script[src$="script.js"]').attr('src').replace('script.js', '');
		let iconTimeout = L.icon({
			iconUrl: iconUrlTimeout + 'images/timeoutbox.png',
			iconRetinaUrl: iconUrlTimeout + 'images/timeoutbox.png',
			iconSize: [65, 80],
			popupAnchor: [-4, -40]
		}); // icon image and info
		let popup = (`<h4><b>${"&#10026 RESTAURANT &#10026"}</b></h4><p>${data[i].name}<br><br><i>${data[i].address}</i></p>`);
		let m = L.marker([data[i].lat, data[i].lng], { icon: iconTimeout }).bindPopup(popup); // print markers
		markers.addLayer(m);
	}
	leafletMap.addLayer(markers);
};

// CLICK SELECT MARKERS

/* add the markers that matches the select filter with the types */
$(kind_food_selector).on("change", function () {
	let restaurantTypes = [];
	for (i = 0; i < all.length; i++) {
		markers.clearLayers(); // clean all markers
		let types = this.value;
		let check = all[i].kind_food.includes(types); // check is true
		if (check) {
			let coordinates = { lat: all[i].lat, lng: all[i].lng, name: all[i].name, address: all[i].address }; // data object
			restaurantTypes.push(coordinates);
		}
	}
	/* call again the function to show the filtered markers */
	render_to_map(restaurantTypes);
});