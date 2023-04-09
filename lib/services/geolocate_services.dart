import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/location_info.dart';

class GeolocateServices {
  Future<LocationInfo> getLocation({
    required String key,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/geolocation/v1/geolocate",
        <String, String>{
          "key": key,
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return LocationInfo.fromJson(resData["location"]);
    } else {
      throw resData["error"]["message"];
    }
  }
}
