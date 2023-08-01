import 'geocode_enums.dart';

class GeocodeComponentInfo {
  late String _longName;
  late String _shortName;
  late List<ResultType> _types;

  GeocodeComponentInfo({
    required String longName,
    required String shortName,
    required List<ResultType> types,
  }) {
    _longName = longName;
    _shortName = shortName;
    _types = types;
  }

  GeocodeComponentInfo.fromJson(Map<String, dynamic> data) {
    _longName = data["long_name"];
    _shortName = data["short_name"];
    _types = <ResultType>[];
    for (String type in data["types"]) {
      if (ResultType.values.any((ResultType element) {
        String elementType = "";
        for (String string in element.name.split("")) {
          if (RegExp("[A-Z]").hasMatch(string) ||
              RegExp("[0-9]").hasMatch(string)) {
            elementType += "_${string.toLowerCase()}";
          } else {
            elementType += string;
          }
        }
        return elementType == type;
      })) {
        _types.add(ResultType.values.firstWhere((ResultType element) {
          String elementType = "";
          for (String string in element.name.split("")) {
            if (RegExp("[A-Z]").hasMatch(string) ||
                RegExp("[0-9]").hasMatch(string)) {
              elementType += "_${string.toLowerCase()}";
            } else {
              elementType += string;
            }
          }
          return elementType == type;
        }));
      }
    }
  }

  String get longName => _longName;
  String get shortName => _shortName;
  List<ResultType> get types => _types;

  @override
  String toString() =>
      'GeocodeComponentInfo(_longName: $_longName, _shortName: $_shortName, _types: $_types)';
}
