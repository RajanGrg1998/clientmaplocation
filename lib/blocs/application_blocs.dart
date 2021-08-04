import 'package:flutter/cupertino.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:map_location_app/models/place_search.dart';
import 'package:map_location_app/services/geolocator_service.dart';
import 'package:map_location_app/services/placesservices.dart';

class ApplicationBloc with ChangeNotifier {
  final geolocatorService = GeolocatorService();
  final placesServices = PlacesServices();

//variables
  Position? currentLocation;
  List<dynamic> searchResults = [];

//constructor
  ApplicationBloc() {
    setCurrentLocation();
  }

//functuion
  setCurrentLocation() async {
    currentLocation = await geolocatorService.getCurrentLocation();
    notifyListeners();
  }

  serachPlaces(String searchTerm) async {
    searchResults = await placesServices.getAutoComplete(searchTerm);
    notifyListeners();
  }
}
