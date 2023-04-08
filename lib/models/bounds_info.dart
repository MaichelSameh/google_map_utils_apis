import 'location_info.dart';

///this class describe the bounds of area using coordinates
class BoundsInfo {
  late LocationInfo _northeast;
  late LocationInfo _southwest;

  BoundsInfo({
    required LocationInfo northeast,
    required LocationInfo southwest,
  }) {
    _northeast = northeast;
    _southwest = southwest;
  }

  BoundsInfo.fromJson(Map<String, dynamic> data) {
    _northeast = LocationInfo.fromJson(data["northeast"]);
    _southwest = LocationInfo.fromJson(data["southwest"]);
  }

  ///the coordinates of the northeast point
  LocationInfo get northeast => _northeast;

  ///the coordinates of the southwest point
  LocationInfo get southwest => _southwest;

  ///the coordinates of the northwest point
  LocationInfo get northwest => LocationInfo(
        latitude: southwest.latitude,
        longitude: northeast.longitude,
      );

  ///the coordinates of the southeast point
  LocationInfo get southeast => LocationInfo(
        latitude: northeast.latitude,
        longitude: southwest.longitude,
      );

  @override
  String toString() =>
      'BoundsInfo(_northeast: $_northeast, _southwest: $_southwest)';
}
