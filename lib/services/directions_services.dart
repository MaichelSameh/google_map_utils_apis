import 'dart:convert';

import 'package:http/http.dart' as http;

import '../models/directions_enums.dart';
import '../models/directions_info.dart';
import '../utils/utils.dart';

class DirectionsServices {
  Future<DirectionsInfo> getByLocation({
    required String key,

    ///Specifies the desired time of arrival for transit directions, in seconds since midnight, January 1, 1970 UTC.
    ///You can specify either `departure_time` or `arrival_time`, but not both.
    ///Note that `arrival_time` must be specified as an integer.
    int? arrivalTime,

    ///Specifies the desired time of departure. You can specify the time as an integer in seconds since midnight, January 1, 1970 UTC. If a `departure_time` later than 9999-12-31T23:59:59.999999999Z is specified, the API will fall back the `departure_time` to 9999-12-31T23:59:59.999999999Z.
    ///Alternatively, you can specify a value of now, which sets the departure time to the current time (correct to the nearest second).
    ///The departure time may be specified in two cases:
    ///For requests where the travel mode is transit:
    ///You can optionally specify one of `departure_time` or `arrival_time`.
    ///If neither time is specified, the `departure_time` defaults to now (that is, the departure time defaults to the current time).
    ///For requests where the travel mode is driving:
    ///You can specify the `departure_time` to receive a route and trip duration (response field: duration_in_traffic) that take traffic conditions into account.
    ///The `departure_time` must be set to the current time or some time in the future.
    ///It cannot be in the past.
    int? departureTime,

    ///If set to `true`, specifies that the Directions service may provide more than one route alternative in the response.
    ///Note that providing route alternatives may increase the response time from the server.
    ///This is only available for requests without intermediate waypoints.
    ///For more information, see the [guide to waypoints](https://developers.google.com/maps/documentation/directions/get-directions#Waypoints).
    bool? alternatives,

    ///Indicates that the calculated route(s) should avoid the indicated features. This parameter supports the following arguments:
    ///`tolls` indicates that the calculated route should avoid toll roads/bridges.
    ///`highways` indicates that the calculated route should avoid highways.
    ///`ferries` indicates that the calculated route should avoid ferries.
    ///`indoor` indicates that the calculated route should avoid indoor steps for walking and transit directions.
    ///It's possible to request a route that avoids any combination of tolls, highways and ferries by passing multiple restrictions to the avoid parameter. For example:
    ///```
    ///avoid=tolls|highways|ferries.
    ///```
    Avoid? avoid,

    ///latitude value to which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required double destinationLatitude,

    ///longitude value to which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required double destinationLongitude,

    ///longitude value from which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required double originLatitude,

    ///longitude value from which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required double originLongitude,

    ///Specifies the unit system to use when displaying results.
    ///Directions results contain text within distance fields that may be displayed to the user to indicate the distance of a particular "step" of the route. By default, this text uses the unit system of the origin's country or region.
    Unit? unit,
    String? waypoints,
    String? language,
    Mode? mode,
    String? region,
    TrafficModel? trafficModel,
    TransitMode? transitMode,
    TransitRoutingPreference? transitRoutingPreference,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/directions/json",
        <String, String>{
          "key": key,
          if (arrivalTime != null) "arrival_time": arrivalTime.toString(),
          if (departureTime != null) "departure_time": departureTime.toString(),
          if (alternatives != null) "alternatives": alternatives.toString(),
          "destination": "$destinationLatitude,$destinationLongitude",
          "origin": "$originLatitude,$originLongitude",
          if (unit != null) "units": unit.name.convertCamelCaseToUnderscore(),
          if (waypoints != null) "waypoints": waypoints,
          if (language != null) "language": language,
          if (mode != null) "mode": mode.name.convertCamelCaseToUnderscore(),
          if (region != null) "region": region,
          if (trafficModel != null)
            "traffic_model": trafficModel.name.convertCamelCaseToUnderscore(),
          if (transitMode != null)
            "transit_mode": transitMode.name.convertCamelCaseToUnderscore(),
          if (transitRoutingPreference != null)
            "transit_routing_preference":
                transitRoutingPreference.name.convertCamelCaseToUnderscore(),
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return DirectionsInfo.fromJson(resData);
    } else {
      throw resData["error"]["message"];
    }
  }

  Future<DirectionsInfo> getByPlaceId({
    required String key,

    ///Specifies the desired time of arrival for transit directions, in seconds since midnight, January 1, 1970 UTC.
    ///You can specify either `departure_time` or `arrival_time`, but not both.
    ///Note that `arrival_time` must be specified as an integer.
    int? arrivalTime,

    ///Specifies the desired time of departure. You can specify the time as an integer in seconds since midnight, January 1, 1970 UTC. If a `departure_time` later than 9999-12-31T23:59:59.999999999Z is specified, the API will fall back the `departure_time` to 9999-12-31T23:59:59.999999999Z.
    ///Alternatively, you can specify a value of now, which sets the departure time to the current time (correct to the nearest second).
    ///The departure time may be specified in two cases:
    ///For requests where the travel mode is transit:
    ///You can optionally specify one of `departure_time` or `arrival_time`.
    ///If neither time is specified, the `departure_time` defaults to now (that is, the departure time defaults to the current time).
    ///For requests where the travel mode is driving:
    ///You can specify the `departure_time` to receive a route and trip duration (response field: duration_in_traffic) that take traffic conditions into account.
    ///The `departure_time` must be set to the current time or some time in the future.
    ///It cannot be in the past.
    int? departureTime,

    ///If set to `true`, specifies that the Directions service may provide more than one route alternative in the response.
    ///Note that providing route alternatives may increase the response time from the server.
    ///This is only available for requests without intermediate waypoints.
    ///For more information, see the [guide to waypoints](https://developers.google.com/maps/documentation/directions/get-directions#Waypoints).
    bool? alternatives,

    ///Indicates that the calculated route(s) should avoid the indicated features. This parameter supports the following arguments:
    ///`tolls` indicates that the calculated route should avoid toll roads/bridges.
    ///`highways` indicates that the calculated route should avoid highways.
    ///`ferries` indicates that the calculated route should avoid ferries.
    ///`indoor` indicates that the calculated route should avoid indoor steps for walking and transit directions.
    ///It's possible to request a route that avoids any combination of tolls, highways and ferries by passing multiple restrictions to the avoid parameter. For example:
    ///```
    ///avoid=tolls|highways|ferries.
    ///```
    Avoid? avoid,

    ///latitude value to which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required String destinationPlaceId,

    ///longitude value from which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required String originPlaceId,

    ///Specifies the unit system to use when displaying results.
    ///Directions results contain text within distance fields that may be displayed to the user to indicate the distance of a particular "step" of the route. By default, this text uses the unit system of the origin's country or region.
    Unit? unit,
    String? waypoints,
    String? language,
    Mode? mode,
    String? region,
    TrafficModel? trafficModel,
    TransitMode? transitMode,
    TransitRoutingPreference? transitRoutingPreference,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/directions/json",
        <String, String>{
          "key": key,
          if (arrivalTime != null) "arrival_time": arrivalTime.toString(),
          if (departureTime != null) "departure_time": departureTime.toString(),
          if (alternatives != null) "alternatives": alternatives.toString(),
          "destination": destinationPlaceId,
          "origin": originPlaceId,
          if (unit != null) "units": unit.name.convertCamelCaseToUnderscore(),
          if (waypoints != null) "waypoints": waypoints,
          if (language != null) "language": language,
          if (mode != null) "mode": mode.name.convertCamelCaseToUnderscore(),
          if (region != null) "region": region,
          if (trafficModel != null)
            "traffic_model": trafficModel.name.convertCamelCaseToUnderscore(),
          if (transitMode != null)
            "transit_mode": transitMode.name.convertCamelCaseToUnderscore(),
          if (transitRoutingPreference != null)
            "transit_routing_preference":
                transitRoutingPreference.name.convertCamelCaseToUnderscore(),
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return DirectionsInfo.fromJson(resData);
    } else {
      throw resData["error"]["message"];
    }
  }

  Future<DirectionsInfo> getByAddress({
    required String key,

    ///Specifies the desired time of arrival for transit directions, in seconds since midnight, January 1, 1970 UTC.
    ///You can specify either `departure_time` or `arrival_time`, but not both.
    ///Note that `arrival_time` must be specified as an integer.
    int? arrivalTime,

    ///Specifies the desired time of departure. You can specify the time as an integer in seconds since midnight, January 1, 1970 UTC. If a `departure_time` later than 9999-12-31T23:59:59.999999999Z is specified, the API will fall back the `departure_time` to 9999-12-31T23:59:59.999999999Z.
    ///Alternatively, you can specify a value of now, which sets the departure time to the current time (correct to the nearest second).
    ///The departure time may be specified in two cases:
    ///For requests where the travel mode is transit:
    ///You can optionally specify one of `departure_time` or `arrival_time`.
    ///If neither time is specified, the `departure_time` defaults to now (that is, the departure time defaults to the current time).
    ///For requests where the travel mode is driving:
    ///You can specify the `departure_time` to receive a route and trip duration (response field: duration_in_traffic) that take traffic conditions into account.
    ///The `departure_time` must be set to the current time or some time in the future.
    ///It cannot be in the past.
    int? departureTime,

    ///If set to `true`, specifies that the Directions service may provide more than one route alternative in the response.
    ///Note that providing route alternatives may increase the response time from the server.
    ///This is only available for requests without intermediate waypoints.
    ///For more information, see the [guide to waypoints](https://developers.google.com/maps/documentation/directions/get-directions#Waypoints).
    bool? alternatives,

    ///Indicates that the calculated route(s) should avoid the indicated features. This parameter supports the following arguments:
    ///`tolls` indicates that the calculated route should avoid toll roads/bridges.
    ///`highways` indicates that the calculated route should avoid highways.
    ///`ferries` indicates that the calculated route should avoid ferries.
    ///`indoor` indicates that the calculated route should avoid indoor steps for walking and transit directions.
    ///It's possible to request a route that avoids any combination of tolls, highways and ferries by passing multiple restrictions to the avoid parameter. For example:
    ///```
    ///avoid=tolls|highways|ferries.
    ///```
    Avoid? avoid,

    ///latitude value to which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required String destinationAddress,

    ///longitude value from which you wish to calculate directions.
    ///The options for the destination parameter are the same as for the origin parameter.
    required String originAddress,

    ///Specifies the unit system to use when displaying results.
    ///Directions results contain text within distance fields that may be displayed to the user to indicate the distance of a particular "step" of the route. By default, this text uses the unit system of the origin's country or region.
    Unit? unit,
    String? waypoints,
    String? language,
    Mode? mode,
    String? region,
    TrafficModel? trafficModel,
    TransitMode? transitMode,
    TransitRoutingPreference? transitRoutingPreference,
  }) async {
    http.Response res = await http.post(
      Uri.https(
        "www.googleapis.com",
        "/maps/api/directions/json",
        <String, String>{
          "key": key,
          if (arrivalTime != null) "arrival_time": arrivalTime.toString(),
          if (departureTime != null) "departure_time": departureTime.toString(),
          if (alternatives != null) "alternatives": alternatives.toString(),
          "destination": destinationAddress,
          "origin": originAddress,
          if (unit != null) "units": unit.name.convertCamelCaseToUnderscore(),
          if (waypoints != null) "waypoints": waypoints,
          if (language != null) "language": language,
          if (mode != null) "mode": mode.name.convertCamelCaseToUnderscore(),
          if (region != null) "region": region,
          if (trafficModel != null)
            "traffic_model": trafficModel.name.convertCamelCaseToUnderscore(),
          if (transitMode != null)
            "transit_mode": transitMode.name.convertCamelCaseToUnderscore(),
          if (transitRoutingPreference != null)
            "transit_routing_preference":
                transitRoutingPreference.name.convertCamelCaseToUnderscore(),
        },
      ),
    );
    final Map<String, dynamic> resData = json.decode(res.body);
    if (res.statusCode == 200 || res.statusCode == 201) {
      return DirectionsInfo.fromJson(resData);
    } else {
      throw resData["error"]["message"];
    }
  }
}
