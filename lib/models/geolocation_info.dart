import 'location_info.dart';

class GeolocatorInfo {
  late double _accuracy;
  late LocationInfo _location;

  GeolocatorInfo({
    required double accuracy,
    required LocationInfo location,
  }) {
    _accuracy = accuracy;
    _location = location;
  }

  GeolocatorInfo.fromJson(Map<String, dynamic> data) {
    _accuracy = data["accuracy"];
    _location = data["location"];
  }

  ///the accuracy of the location response
  double get accuracy => _accuracy;

  ///the geo-location location
  LocationInfo get location => _location;

  @override
  String toString() =>
      'GeolocatorInfo(_accuracy: $_accuracy, _location: $_location)';
}
