import 'location_info.dart';

class ElevationInfo {
  late double _elevation;
  late LocationInfo _location;
  late double _resolution;

  ElevationInfo({
    required double elevation,
    required LocationInfo location,
    required double resolution,
  }) {
    _elevation = elevation;
    _location = location;
    _resolution = resolution;
  }

  ElevationInfo.fromJson(Map<String, dynamic> data) {
    _elevation = data["elevation"];
    _location = LocationInfo.fromJson(data["location"]);
    _resolution = data["resolution"];
  }

  double get elevation => _elevation;
  LocationInfo get location => _location;
  double get resolution => _resolution;

  @override
  String toString() =>
      'ElevationInfo(_elevation: $_elevation, _location: $_location, _resolution: $_resolution)';
}
