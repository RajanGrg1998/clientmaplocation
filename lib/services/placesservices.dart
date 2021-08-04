import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:map_location_app/models/place_search.dart';

class PlacesServices {
  //final key = 'AIzaSyAZzaxnar7oE9Rvfn57OCNMvkwDSmD8Iw0';

  Future<List<PlaceSearch>> getAutoComplete(String search) async {
    var url =
        'https://maps.googleapis.com/maps/api/place/autocomplete/json?input=$search&types=(cities)&key=AIzaSyAZzaxnar7oE9Rvfn57OCNMvkwDSmD8Iw0';
    var response = await http.get(Uri.parse(url));
    var json = jsonDecode(response.body);
    var jsonResults = json['predictions'] as List;
    return jsonResults.map((place) => PlaceSearch.fromJson(place)).toList();
  }
}
