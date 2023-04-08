class AutocompleteInfo {
  late String _description;
  late String _placeId;
  late String _reference;

  AutocompleteInfo({
    required String description,
    required String placeId,
    required String reference,
  }) {
    _description = description;
    _placeId = placeId;
    _reference = reference;
  }

  AutocompleteInfo.fromJson(Map<String, dynamic> data) {
    _description = data["description"];
    _placeId = data["place_id"];
    _reference = data["reference"];
  }

  String get description => _description;
  String get placeId => _placeId;
  String get reference => _reference;

  @override
  String toString() =>
      'AutocompleteInfo(_description: $_description, _placeId: $_placeId, _reference: $_reference)';
}
