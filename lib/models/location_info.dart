import '../utils/numbers_util.dart';

class LocationInfo {
  late double _latitude;
  late double _longitude;

  LocationInfo({
    required double latitude,
    required double longitude,
  }) {
    _latitude = latitude;
    _longitude = longitude;
  }

  LocationInfo.fromJson(Map<String, dynamic> data) {
    _latitude = (data["lat"] ?? data["latitude"]).toString().toDouble()!;
    _longitude = (data["lng"] ?? data["longitude"]).toString().toDouble()!;
  }

  ///the location's latitude
  double get latitude => _latitude;

  ///the location's longitude
  double get longitude => _longitude;

  @override
  String toString() =>
      'LocationInfo(_latitude: $_latitude, _longitude: $_longitude)';
}
