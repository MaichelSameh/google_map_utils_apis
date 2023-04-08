///Indicates that the calculated route(s) should avoid the indicated features.
enum Avoid {
  ///indicates that the calculated route should avoid toll roads/bridges.
  tolls,

  ///indicates that the calculated route should avoid highways.
  highways,

  ///indicates that the calculated route should avoid ferries.
  ferries,

  /// indicates that the calculated route should avoid indoor steps for walking and transit directions.
  indoor,
}

///Directions results contain text within distance fields that may be displayed to the user to indicate the distance of a particular "step" of the route.
///By default, this text uses the unit system of the origin's country or region.
enum Unit {
  ///specifies usage of the metric system. Textual distances are returned using kilometers and meters.
  metric,

  ///specifies usage of the Imperial (English) system. Textual distances are returned using miles and feet.
  imperial,
}

///For the calculation of distances and directions, you may specify the transportation mode to use.
enum Mode {
  ///indicates standard driving directions or distance using the road network.
  driving,

  ///requests walking directions or distance via pedestrian paths & sidewalks (where available).
  walking,

  ///requests bicycling directions or distance via bicycle paths & preferred streets (where available).
  bicycling,

  ///requests directions or distance via public transit routes (where available).
  ///If you set the mode to transit, you can optionally specify either a departure_time or an arrival_time.
  ///If neither time is specified, the departure_time defaults to now (that is, the departure time defaults to the current time).
  ///You can also optionally include a transit_mode and/or a transit_routing_preference.
  transit,
}

///Specifies the assumptions to use when calculating time in traffic.
///This setting affects the value returned in the duration_in_traffic field in the response, which contains the predicted time in traffic based on historical averages.
///The traffic_model parameter may only be specified for driving directions where the request includes a departure_time
enum TrafficModel {
  ///indicates that the returned duration_in_traffic should be the best estimate of travel time given what is known about both historical traffic conditions and live traffic.
  ///Live traffic becomes more important the closer the departure_time is to now.
  bestGuess,

  ///indicates that the returned duration_in_traffic should be longer than the actual travel time on most days, though occasional days with particularly bad traffic conditions may exceed this value.
  pessimistic,

  ///indicates that the returned duration_in_traffic should be shorter than the actual travel time on most days, though occasional days with particularly good traffic conditions may be faster than this value.
  optimistic,
}

///Specifies one or more preferred modes of transit.
///This parameter may only be specified for transit directions.
enum TransitMode {
  ///indicates that the calculated route should prefer travel by bus.
  bus,

  ///indicates that the calculated route should prefer travel by subway.
  subway,

  ///indicates that the calculated route should prefer travel by train.
  train,

  ///indicates that the calculated route should prefer travel by tram and light rail.
  tram,

  ///indicates that the calculated route should prefer travel by train, tram, light rail, and subway. This is equivalent to
  rail,
}

///Specifies preferences for transit routes. Using this parameter, you can bias the options returned, rather than accepting the default best route chosen by the API.
///This parameter may only be specified for transit directions.
enum TransitRoutingPreference {
  ///indicates that the calculated route should prefer limited amounts of walking.
  lessWalking,

  ///indicates that the calculated route should prefer a limited number of transfers.
  fewerTransfers,
}
