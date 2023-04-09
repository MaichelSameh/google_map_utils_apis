import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/geocode_enums.dart';
import '../models/geocode_info.dart';
import '../utils/utils.dart';

class GeocodeServices {
  Future<GeocodeInfo> getByLocation({
    required String key,
    required double latitude,
    required double longitude,
    LocationType? locationType,
    String? language,
    String? region,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/geocode/json",
        <String, String>{
          "key": key,
          "latlng": "$latitude,$longitude",
          if (locationType != null)
            "location_type":
                locationType.name.convertCamelCaseToUnderscore().toUpperCase(),
          if (language != null) "language": language,
          if (region != null) "region": region,
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return GeocodeInfo.fromJson(resData["location"]);
    } else {
      throw resData["error"]["message"];
    }
  }

  Future<GeocodeInfo> getByAddress({
    required String key,
    required String address,
    LocationType? locationType,
    String? language,
    String? region,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/geocode/json",
        <String, String>{
          "key": key,
          "address": address,
          if (locationType != null)
            "location_type":
                locationType.name.convertCamelCaseToUnderscore().toUpperCase(),
          if (language != null) "language": language,
          if (region != null) "region": region,
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return GeocodeInfo.fromJson(resData["location"]);
    } else {
      throw resData["error"]["message"];
    }
  }

  Future<GeocodeInfo> getByPlaceId({
    required String key,
    required String placeId,
    LocationType? locationType,
    String? language,
    String? region,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/geocode/json",
        <String, String>{
          "key": key,
          "place_id": placeId,
          if (locationType != null)
            "location_type":
                locationType.name.convertCamelCaseToUnderscore().toUpperCase(),
          if (language != null) "language": language,
          if (region != null) "region": region,
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return GeocodeInfo.fromJson(resData["location"]);
    } else {
      throw resData["error"]["message"];
    }
  }
}
