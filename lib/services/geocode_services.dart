import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/geocode_enums.dart';
import '../models/geocode_info.dart';
import '../utils/utils.dart';

class GeocodeServices {
  Future<List<GeocodeInfo>> getByLocation({
    required String key,
    required double latitude,
    required double longitude,
    LocationType? locationType,
    String? language,
    String? region,
  }) async {
    http.Response res = await http.post(
        Uri.parse(
          "https://maps.googleapis.com/maps/api/geocode/json?key=$key&latlng=$latitude,$longitude${(locationType != null) ? "&location_type=${locationType.name.convertCamelCaseToUnderscore().toUpperCase()}" : ""}${(language != null) ? "&language=$language" : ""}${(region != null) ? "&region=$region" : ""}",
        ),
        headers: <String, String>{
          "Accept": "application/json",
        });
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      List<GeocodeInfo> result = <GeocodeInfo>[];
      for (Map<String, dynamic> data in resData["results"]) {
        result.add(GeocodeInfo.fromJson(data));
      }
      return result;
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
      Uri.parse(
          "https://maps.googleapis.com/maps/api/geocode/json?key=$key&address=$address${(locationType != null) ? "&location_type=${locationType.name.convertCamelCaseToUnderscore().toUpperCase()}" : ""}${(language != null) ? "&language=$language" : ""}${(region != null) ? "&region=$region" : ""}",
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
    http.Response res = await http.post(Uri.parse(
          "https://maps.googleapis.com/maps/api/geocode/json?key=$key&place_id=$placeId${(locationType != null) ? "&location_type=${locationType.name.convertCamelCaseToUnderscore().toUpperCase()}" : ""}${(language != null) ? "&language=$language" : ""}${(region != null) ? "&region=$region" : ""}",
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
