import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/autocomplete_info.dart';

class PlaceServices {
  Future<AutocompleteInfo> getLocation({
    required String key,
    required String address,
    String? sessionToken,
    String? lang,
    String? region,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/place/autocomplete/json",
        <String, String>{
          "key": key,
          "input": address,
          if (sessionToken != null) "sessiontoken": sessionToken,
          if (lang != null) "language": lang,
          if (region != null) "region": region,
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return AutocompleteInfo.fromJson(resData);
    } else {
      throw resData["error"]["message"];
    }
  }
}
