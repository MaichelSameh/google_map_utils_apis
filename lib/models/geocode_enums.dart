///A components filter with elements separated by a pipe (|).
///The components filter is also accepted as an optional parameter if an address is provided.
///Each element in the components filter consists of a component:value pair, and fully restricts the results from the geocoder.
enum Components {
  /// matches postal_code and postal_code_prefix.
  postalCode,

  /// matches a country name or a two letter ISO 3166-1 country code. The API follows the ISO standard for defining countries, and the filtering works best when using the corresponding ISO code of the country.
  ///Note: If you receive unexpected results with a country code, verify that you are using a code which includes the countries, dependent territories, and special areas of geographical interest you intend.
  ///You can find code information at Wikipedia: List of ISO 3166 country codes or the ISO Online Browsing Platform.
  country,

  ///matches the long or short name of a route.
  route,

  ///matches against locality and sublocality types.
  locality,

  /// matches all the administrative_area levels.
  administrativeArea,
}

///A filter of one or more location types, separated by a pipe (|).
///If the parameter contains multiple location types, the API returns all addresses that match any of the types.
///A note about processing: The location_type parameter does not restrict the search to the specified location type(s).
///Rather, the location_type acts as a post-search filter: the API fetches all results for the specified latlng, then discards those results that do not match the specified location type(s)
enum LocationType {
  ///returns only the addresses that are characterized as approximate.
  approximate,

  /// returns only geometric centers of a location such as a polyline (for example, a street) or polygon (region).
  geometricCenter,

  ///returns only the addresses that reflect an approximation (usually on a road) interpolated between two precise points (such as intersections).
  ///An interpolated range generally indicates that rooftop geocodes are unavailable for a street address.
  rangeInterpolated,

  ///returns only the addresses for which Google has location information accurate down to street address precision.
  rooftop,
}

///A filter of one or more address types, separated by a pipe (|).
///If the parameter contains multiple address types, the API returns all addresses that match any of the types.
///A note about processing: The result_type parameter does not restrict the search to the specified address type(s).
///Rather, the result_type acts as a post-search filter: the API fetches all results for the specified latlng, then discards those results that do not match the specified address type(s).
enum ResultType {
  ///indicates a first-order civil entity below the country level. Within the United States, these administrative levels are states.
  ///Not all nations exhibit these administrative levels.
  ///In most cases, administrative_area_level_1 * short names will closely match ISO 3166-2 subdivisions and other widely circulated lists; however this is not guaranteed as our geocoding results are based on a variety of sig
  administrativeAreaLevel1,

  ///indicates a second-order civil entity below the country level.
  ///Within the United States, these administrative levels are counties.
  ///Not all nations exhibit these administrative levels.
  administrativeAreaLevel2,

  ///indicates a third-order civil entity below the country level.
  ///This type indicates a minor civil division.
  ///Not all nations exhibit these administrative levels.
  administrativeAreaLevel3,

  ///indicates a fourth-order civil entity below the country level.
  ///This type indicates a minor civil division.
  ///Not all nations exhibit these administrative levels.
  administrativeAreaLevel4,

  ///indicates a fifth-order civil entity below the country level.
  ///This type indicates a minor civil division.
  ///Not all nations exhibit these administrative levels.
  administrativeAreaLevel5,

  /// indicates an airport.
  airport,

  ///indicates a commonly-used alternative name for the entity.
  colloquialArea,

  ///indicates the national political entity, and is typically the highest order type returned by the Geocoder.
  country,

  /// indicates a major intersection, usually of two major roads
  intersection,

  ///indicates an incorporated city or town political entity.
  locality,

  ///indicates a prominent natural feature.
  naturalFeature,

  /// indicates a named neighborhood
  neighborhood,

  ///indicates a named park.
  park,

  /// indicates an encoded location reference, derived from latitude and longitude.
  /// Plus codes can be used as a replacement for street addresses in places where they do not exist (where buildings are not numbered or streets are not named).
  /// See https://plus.codes/ for details.
  plusCode,

  ///indicates a named point of interest. Typically, these "POI"s are prominent local entities that don't easily fit in another category, such as "Empire State Building" or "Eiffel Tower".
  pointOfInterest,

  /// indicates a political entity. Usually, this type indicates a polygon of some civil administration.
  political,

  ///indicates a postal code as used to address postal mail within the country.
  postalCode,

  /// indicates a named location, usually a building or collection of buildings with a common name
  premise,

  ///indicates a named route (such as "US 101").
  route,

  /// indicates a precise street address.
  streetAddress,

  /// indicates a first-order civil entity below a locality.
  sublocality,

  /// Each sublocality level is a civil entity. Larger numbers indicate a smaller geographic area.
  sublocalityLevel1,

  /// Each sublocality level is a civil entity. Larger numbers indicate a smaller geographic area.
  sublocalityLevel2,

  /// Each sublocality level is a civil entity. Larger numbers indicate a smaller geographic area.
  sublocalityLevel3,

  /// Each sublocality level is a civil entity. Larger numbers indicate a smaller geographic area.
  sublocalityLevel4,

  /// Each sublocality level is a civil entity. Larger numbers indicate a smaller geographic area.
  sublocalityLevel5,

  ///indicates a first-order entity below a named location, usually a singular building within a collection of buildings with a common name
  subpremise,
}
