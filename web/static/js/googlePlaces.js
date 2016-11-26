
function initSearch(container, callback) {
	// Geocode + Establishment
	const placesInput = document.createElement("input");
  const searchBox = new google.maps.places.Autocomplete(placesInput);
  searchBox.addListener('place_changed', function() {
    const place = searchBox.getPlace();
    // Just returning name for testing
    callback(place.name)
  });
  container.appendChild(placesInput);
};

export { initSearch };
