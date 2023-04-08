import '../utils/numbers_util.dart';
import 'bounds_info.dart';
import 'direction_step_info.dart';
import 'location_info.dart';

///The Directions API is a web service that uses an HTTP request to return JSON or XML-formatted directions between locations.
///You can receive directions for several modes of transportation, such as transit, driving, walking, or cycling.
class DirectionsInfo {
  late BoundsInfo _bounds;
  late String _copyrights;
  late String _endAddress;
  late LocationInfo _endPoint;
  late int _estimatedDistance;
  late int _estimatedDuration;
  late String _estimatedFormattedDistance;
  late String _estimatedFormattedDuration;
  late String _startAddress;
  late LocationInfo _startPoint;
  late List<DirectionStepInfo> _steps;
  late String _summary;

  DirectionsInfo({
    required BoundsInfo bounds,
    required String copyrights,
    required String endAddress,
    required LocationInfo endPoint,
    required int estimatedDistance,
    required int estimatedDuration,
    required String estimatedFormattedDistance,
    required String estimatedFormattedDuration,
    required String startAddress,
    required LocationInfo startPoint,
    required List<DirectionStepInfo> steps,
    required String summary,
  }) {
    _bounds = bounds;
    _copyrights = copyrights;
    _endAddress = endAddress;
    _endPoint = endPoint;
    _estimatedDistance = estimatedDistance;
    _estimatedDuration = estimatedDuration;
    _estimatedFormattedDistance = estimatedFormattedDistance;
    _estimatedFormattedDuration = estimatedFormattedDuration;
    _startAddress = startAddress;
    _startPoint = startPoint;
    _steps = steps;
    _summary = summary;
  }

  DirectionsInfo.fromJson(Map<String, dynamic> data) {
    _bounds = BoundsInfo.fromJson(data["routes"][0]["bounds"]);
    _copyrights = data["routes"][0]["copyrights"];
    _endAddress = data["routes"][0]["legs"][0]["end_address"];
    _endPoint =
        LocationInfo.fromJson(data["routes"][0]["legs"][0]["end_location"]);
    _estimatedDistance =
        data["routes"][0]["legs"][0]["distance"]["value"].toString().toInt()!;
    _estimatedDuration =
        data["routes"][0]["legs"][0]["duration"]["value"].toString().toInt()!;
    _estimatedFormattedDistance =
        data["routes"][0]["legs"][0]["distance"]["text"];
    _estimatedFormattedDuration =
        data["routes"][0]["legs"][0]["duration"]["text"];
    _startAddress = data["routes"][0]["legs"][0]["start_address"];
    _startPoint = LocationInfo.fromJson(data["routes"][0]["start_location"]);
    _steps = <DirectionStepInfo>[];
    _summary = data["routes"][0]["summary"];
    for (Map<String, dynamic> step in data["routes"][0]["legs"][0]["steps"]) {
      _steps.add(DirectionStepInfo.fromJson(step));
    }
  }

  ///the bounds of the seen area
  BoundsInfo get bounds => _bounds;

  ///the copyrights of the api
  String get copyrights => _copyrights;

  ///the final address of the route
  String get endAddress => _endAddress;

  ///the final destination of the route
  LocationInfo get endPoint => _endPoint;

  ///the estimates distance between the [startPoint] and the [endPoint]
  int get estimatedDistance => _estimatedDistance;

  ///the estimated time to get to the [endPoint]
  int get estimatedDuration => _estimatedDuration;

  ///the estimates formatted distance between the [startPoint] and the [endPoint]
  String get estimatedFormattedDistance => _estimatedFormattedDistance;

  ///the estimated formatted time to get to the [endPoint]
  String get estimatedFormattedDuration => _estimatedFormattedDuration;

  ///the original moving address
  String get startAddress => _startAddress;

  ///the original moving point
  LocationInfo get startPoint => _startPoint;

  ///the steps needed to get to the [endPoint]
  List<DirectionStepInfo> get steps => _steps;

  ///the summary of the route
  String get summary => _summary;

  @override
  String toString() {
    return 'DirectionsInfo(_bounds: $_bounds, _copyrights: $_copyrights, _endAddress: $_endAddress, _endPoint: $_endPoint, _estimatedDistance: $_estimatedDistance, _estimatedDuration: $_estimatedDuration, _estimatedFormattedDistance: $_estimatedFormattedDistance, _estimatedFormattedDuration: $_estimatedFormattedDuration, _startAddress: $_startAddress, _startPoint: $_startPoint, _steps: $_steps, _summary: $_summary)';
  }
}
