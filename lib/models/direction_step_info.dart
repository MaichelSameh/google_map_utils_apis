import '../utils/utils.dart';
import 'directions_enums.dart';
import 'location_info.dart';

class DirectionStepInfo {
  late int _distanceInMeters;
  late String _distanceInWords;
  late int _durationInSeconds;
  late String _durationInWords;
  late LocationInfo _endPoint;
  late String _htmlInstruction;
  late LocationInfo _startPoint;
  late Mode _travelMode;

  DirectionStepInfo({
    required int distanceInMeters,
    required String distanceInWords,
    required int durationInSeconds,
    required String durationInWords,
    required LocationInfo endPoint,
    required String htmlInstruction,
    required LocationInfo startPoint,
    required Mode travelMode,
  }) {
    _distanceInMeters = distanceInMeters;
    _distanceInWords = distanceInWords;
    _durationInSeconds = durationInSeconds;
    _durationInWords = durationInWords;
    _endPoint = endPoint;
    _htmlInstruction = htmlInstruction;
    _startPoint = startPoint;
    _travelMode = travelMode;
  }

  DirectionStepInfo.fromJson(Map<String, dynamic> data) {
    _distanceInMeters = data["distance"]["value"].toString().toInt()!;
    _distanceInWords = data["distance"]["text"];
    _durationInSeconds = data["duration"]["value"].toString().toInt()!;
    _durationInWords = data["duration"]["text"];
    _endPoint = LocationInfo.fromJson(data["end_location"]);
    _htmlInstruction = data["html_instructions"];
    _startPoint = LocationInfo.fromJson(data["start_location"]);
    _travelMode = Mode.values.firstWhere(
      (Mode element) =>
          element.name.convertCamelCaseToUnderscore() ==
          data["travel_mode"].toString().toLowerCase(),
    );
  }

  ///the distance between the [startPoint] and the [endPoint] measured in a specified unit, by default it's meter
  int get distanceInMeters => _distanceInMeters;

  ///the distance between the [startPoint] and the [endPoint] measured in a specified unit, by default it's kilometer, converted into humane words
  String get distanceInWords => _distanceInWords;

  ///the duration needed to go from the [startPoint] to the [endPoint] measured in seconds
  int get durationInSeconds => _durationInSeconds;

  ///the duration needed to go from the [startPoint] to the [endPoint] converted into humane words
  String get durationInWords => _durationInWords;

  ///the destination coordinates of this step
  LocationInfo get endPoint => _endPoint;

  ///the instruction of this step formatted in html
  String get htmlInstruction => _htmlInstruction;

  ///the original coordinates of this step
  LocationInfo get startPoint => _startPoint;

  ///the mode used to get this step
  Mode get travelMode => _travelMode;

  @override
  String toString() {
    return 'DirectionStepInfo(_distanceInMeters: $_distanceInMeters, _distanceInWords: $_distanceInWords, _durationInSeconds: $_durationInSeconds, _durationInWords: $_durationInWords, _endPoint: $_endPoint, _htmlInstruction: $_htmlInstruction, _startPoint: $_startPoint, _travelMode: $_travelMode)';
  }
}
