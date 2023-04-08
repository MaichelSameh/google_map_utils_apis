class TimeZoneInfo {
  late double _dstOffset;
  late double _rawOffset;
  late String _timeZoneId;
  late String _timeZoneName;

  TimeZoneInfo({
    required double dstOffset,
    required double rawOffset,
    required String timeZoneId,
    required String timeZoneName,
  }) {
    _dstOffset = dstOffset;
    _rawOffset = rawOffset;
    _timeZoneId = timeZoneId;
    _timeZoneName = timeZoneName;
  }

  TimeZoneInfo.fromJson(Map<String, dynamic> data) {
    _dstOffset = data["dstOffset"];
    _rawOffset = data["rawOffset"];
    _timeZoneId = data["timeZoneId"];
    _timeZoneName = data["timeZoneName"];
  }

  double get dstOffset => _dstOffset;
  double get rawOffset => _rawOffset;
  String get timeZoneId => _timeZoneId;
  String get timeZoneName => _timeZoneName;

  @override
  String toString() {
    return 'TimeZoneInfo(_dstOffset: $_dstOffset, _rawOffset: $_rawOffset, _timeZoneId: $_timeZoneId, _timeZoneName: $_timeZoneName)';
  }
}
