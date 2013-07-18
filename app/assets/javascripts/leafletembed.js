var map;
var ajaxRequest;
var plotlist;
var plotlayers=[];
var routePoints = [];

function initmap() {
	// set up the map
	map = new L.Map('map', {
		center: [18.488075,-69.931126], 
		zoom: 13
	});

	// create the tile layer with correct attribution
	var osmUrl='http://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png';
	var osmAttrib='Map data © OpenStreetMap contributors';
	var osm = new L.TileLayer(osmUrl, {minZoom: 8, maxZoom: 20, attribution: osmAttrib});		

	// start the map in South-East England
	//map.setView(new L.LatLng(51.3, 0.7),9);
	//map.addLayer(osm);

	//var point1 = new L.LatLng(18.488075,-69.931126);
	//var point2 = new L.LatLng(18.472812,-69.941204);
	//var point3 = new L.LatLng(18.474806,-69.935496);
	//var point4 = new L.LatLng(18.465698,-69.930298);
	//var point5 = new L.LatLng(18.461709,-69.938166);
	//var point6 = new L.LatLng(18.462508,-69.938601);
	//var latlngs = [point1, point2, point3,point4,point5,point6];
	//L.polyline(latlngs, {color: 'red'}).addTo(map)
}

var popup = L.popup();

function onMapClick(e) {
    routePoints.push(e.latlng)

}

function onMapLeftClick(e) {
    L.polyline(routePoints, {color: 'blue'}).addTo(map);
    routePoints.length = 0;
}
