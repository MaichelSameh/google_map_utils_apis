import 'bounds_info.dart';
import 'location_info.dart';

class PlaceInfo {
  late String _address;
  late String _businessStatus;
  late String _icon;
  late LocationInfo _location;
  late String _name;
  late List<String> _photos;
  late String _placeId;
  late int _priceLevel;
  late double _rating;
  late String _reference;
  late int _userRatingsTotal;
  late BoundsInfo _viewPort;

  PlaceInfo({
    required String address,
    required String businessStatus,
    required String icon,
    required LocationInfo location,
    required String name,
    required List<String> photos,
    required String placeId,
    required int priceLevel,
    required double rating,
    required String reference,
    required int userRatingsTotal,
    required BoundsInfo viewPort,
  }) {
    _address = address;
    _businessStatus = businessStatus;
    _icon = icon;
    _location = location;
    _name = name;
    _photos = photos;
    _placeId = placeId;
    _priceLevel = priceLevel;
    _rating = rating;
    _reference = reference;
    _userRatingsTotal = userRatingsTotal;
    _viewPort = viewPort;
  }

  PlaceInfo.fromJson(Map<String, dynamic> data) {
    _address = data["formatted_address"];
    _businessStatus = data["business_status"];
    _icon = data["icon"];
    _location = data["geometry"]["location"];
    _name = data["name"];
    _photos = <String>[];
    _placeId = data["place_id"];
    _priceLevel = data["price_level"];
    _rating = data["rating"];
    _reference = data["reference"];
    _userRatingsTotal = data["user_ratings_total"];
    _viewPort = data["geometry"]["viewport"];
    for (Map<String, dynamic> photo in data["photos"]) {
      _photos.add(photo["html_attributions"][0]);
    }
  }

  String get address => _address;
  String get businessStatus => _businessStatus;
  String get icon => _icon;
  LocationInfo get location => _location;
  String get name => _name;
  List<String> get photos => _photos;
  String get placeId => _placeId;
  int get priceLevel => _priceLevel;
  double get rating => _rating;
  String get reference => _reference;
  int get userRatingsTotal => _userRatingsTotal;
  BoundsInfo get viewPort => _viewPort;

  @override
  String toString() {
    return 'PlaceInfo(_address: $_address, _businessStatus: $_businessStatus, _icon: $_icon, _location: $_location, _name: $_name, _photos: $_photos, _placeId: $_placeId, _priceLevel: $_priceLevel, _rating: $_rating, _reference: $_reference, _userRatingsTotal: $_userRatingsTotal, _viewPort: $_viewPort)';
  }
}
