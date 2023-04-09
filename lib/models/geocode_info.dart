import '../utils/string_util.dart';
import 'bounds_info.dart';
import 'geocode_component_info.dart';
import 'geocode_enums.dart';
import 'location_info.dart';

class GeocodeInfo {
  late String _address;
  late BoundsInfo _bounds;
  late List<GeocodeComponentInfo> _components;
  late LocationInfo _location;
  late LocationType _locationType;
  late String _placeId;
  late List<ResultType> _types;
  late BoundsInfo _viewport;

  GeocodeInfo({
    required String address,
    required BoundsInfo bounds,
    required List<GeocodeComponentInfo> components,
    required LocationInfo location,
    required LocationType locationType,
    required String placeId,
    required List<ResultType> types,
    required BoundsInfo viewport,
  }) {
    _address = address;
    _bounds = bounds;
    _components = components;
    _location = location;
    _locationType = locationType;
    _placeId = placeId;
    _types = types;
    _viewport = viewport;
  }

  GeocodeInfo.fromJson(Map<String, dynamic> data) {
    _address = data["formatted_address"];
    _bounds = BoundsInfo.fromJson(
        data["geometry"]["bounds"] ?? data["geometry"]["viewport"]);
    _components = <GeocodeComponentInfo>[];
    _location = LocationInfo.fromJson(data["geometry"]["location"]);
    _locationType = LocationType.values.firstWhere((LocationType element) =>
        element.name.convertCamelCaseToUnderscore() ==
        data["geometry"]["location_type"].toString().toLowerCase());
    _placeId = data["place_id"];
    _types = <ResultType>[];
    _viewport = BoundsInfo.fromJson(data["geometry"]["viewport"]);
    for (Map<String, dynamic> component in data["address_components"]) {
      _components.add(GeocodeComponentInfo.fromJson(component));
    }
    for (String type in data["types"]) {
      if (ResultType.values.any((ResultType element) =>
          element.name.convertCamelCaseToUnderscore() == type)) {
        _types.add(ResultType.values.firstWhere((ResultType element) =>
            element.name.convertCamelCaseToUnderscore() == type));
      }
    }
  }

  String get address => _address;
  BoundsInfo get bounds => _bounds;
  List<GeocodeComponentInfo> get components => _components;
  LocationInfo get location => _location;
  LocationType get locationType => _locationType;
  String get placeId => _placeId;
  List<ResultType> get types => _types;
  BoundsInfo get viewport => _viewport;

  @override
  String toString() {
    return 'GeocodeInfo(_address: $_address, _bounds: $_bounds, _components: $_components, _location: $_location, _locationType: $_locationType, _placeId: $_placeId, _types: $_types, _viewport: $_viewport)';
  }
}
