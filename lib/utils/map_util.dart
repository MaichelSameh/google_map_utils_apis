import 'dart:math';

class MapUtil {
  ///this function returns the distance between two points in Km
  double calculateDistance({
    required double lat1,
    required double lon1,
    required double lat2,
    required double lon2,
  }) {
    double p = 0.017453292519943295;
    double a = 0.5 -
        cos((lat2 - lat1) * p) / 2 +
        cos(lat1 * p) * cos(lat2 * p) * (1 - cos((lon2 - lon1) * p)) / 2;
    return 12742 * asin(sqrt(a));
  }

  ///this function returns the area in Km
  double getVisibleRegionArea({
    required double southWestLatitude,
    required double southWestLongitude,
    required double northEastLatitude,
    required double northEastLongitude,
  }) {
    double length = getVisibleRegionLength(
      southWestLongitude: southWestLongitude,
      northEastLatitude: northEastLatitude,
      northEastLongitude: northEastLongitude,
    );
    double width = getVisibleRegionWidth(
      southWestLatitude: southWestLatitude,
      northEastLatitude: northEastLatitude,
      northEastLongitude: northEastLongitude,
    );
    return length * width;
  }

  ///this function returns the Perimeter in Km
  double getVisibleRegionPerimeter({
    required double southWestLatitude,
    required double southWestLongitude,
    required double northEastLatitude,
    required double northEastLongitude,
  }) {
    double length = getVisibleRegionLength(
      southWestLongitude: southWestLongitude,
      northEastLatitude: northEastLatitude,
      northEastLongitude: northEastLongitude,
    );
    double width = getVisibleRegionWidth(
      southWestLatitude: southWestLatitude,
      northEastLatitude: northEastLatitude,
      northEastLongitude: northEastLongitude,
    );
    return (length + width) * 2;
  }

  ///this function returns the length in Km
  double getVisibleRegionLength({
    required double southWestLongitude,
    required double northEastLatitude,
    required double northEastLongitude,
  }) {
    return calculateDistance(
      lat1: northEastLatitude,
      lon1: northEastLongitude,
      lat2: northEastLatitude,
      lon2: southWestLongitude,
    );
  }

  ///this function returns the width in Km
  double getVisibleRegionWidth({
    required double southWestLatitude,
    required double northEastLatitude,
    required double northEastLongitude,
  }) {
    return calculateDistance(
      lat1: northEastLatitude,
      lon1: northEastLongitude,
      lat2: southWestLatitude,
      lon2: northEastLongitude,
    );
  }
}
