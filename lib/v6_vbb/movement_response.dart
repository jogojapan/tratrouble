import 'package:json_annotation/json_annotation.dart';
import 'departure.dart';

part 'movement_response.g.dart';

@JsonSerializable()
class MovementResponse {
  final List<Movement> movements;
  final int? realtimeDataUpdatedAt;

  MovementResponse({required this.movements, this.realtimeDataUpdatedAt});

  factory MovementResponse.fromJson(Map<String, dynamic> json) =>
      _$MovementResponseFromJson(json);
  Map<String, dynamic> toJson() => _$MovementResponseToJson(this);
}

@JsonSerializable()
class Movement {
  final String direction;
  final String tripId;
  final Line line;
  final Location location;
  final List<NextStopover>? nextStopovers;
  final List<Frame>? frames;
  final Polyline? polyline;

  Movement({
    required this.direction,
    required this.tripId,
    required this.line,
    required this.location,
    this.nextStopovers,
    this.frames,
    this.polyline,
  });

  factory Movement.fromJson(Map<String, dynamic> json) =>
      _$MovementFromJson(json);
  Map<String, dynamic> toJson() => _$MovementToJson(this);
}

@JsonSerializable()
class NextStopover {
  final Stop stop;
  final String? arrival;
  final String? plannedArrival;
  final int? arrivalDelay;
  final String? arrivalPlatform;
  final String? arrivalPrognosisType;
  final String? plannedArrivalPlatform;
  final String? departure;
  final String? plannedDeparture;
  final int? departureDelay;
  final String? departurePlatform;
  final String? departurePrognosisType;
  final String? plannedDeparturePlatform;

  NextStopover({
    required this.stop,
    this.arrival,
    this.plannedArrival,
    this.arrivalDelay,
    this.arrivalPlatform,
    this.arrivalPrognosisType,
    this.plannedArrivalPlatform,
    this.departure,
    this.plannedDeparture,
    this.departureDelay,
    this.departurePlatform,
    this.departurePrognosisType,
    this.plannedDeparturePlatform,
  });

  factory NextStopover.fromJson(Map<String, dynamic> json) =>
      _$NextStopoverFromJson(json);
  Map<String, dynamic> toJson() => _$NextStopoverToJson(this);
}

@JsonSerializable()
class Frame {
  final Stop origin;
  final Stop destination;
  final int t;

  Frame({required this.origin, required this.destination, required this.t});

  factory Frame.fromJson(Map<String, dynamic> json) => _$FrameFromJson(json);
  Map<String, dynamic> toJson() => _$FrameToJson(this);
}

@JsonSerializable()
class Polyline {
  final String type;
  final List<Feature> features;

  Polyline({required this.type, required this.features});

  factory Polyline.fromJson(Map<String, dynamic> json) =>
      _$PolylineFromJson(json);
  Map<String, dynamic> toJson() => _$PolylineToJson(this);
}

@JsonSerializable()
class Feature {
  final String type;
  final Map<String, dynamic> properties;
  final Geometry geometry;

  Feature({
    required this.type,
    required this.properties,
    required this.geometry,
  });

  factory Feature.fromJson(Map<String, dynamic> json) =>
      _$FeatureFromJson(json);
  Map<String, dynamic> toJson() => _$FeatureToJson(this);
}

@JsonSerializable()
class Geometry {
  final String type;
  final List<double> coordinates;

  Geometry({required this.type, required this.coordinates});

  factory Geometry.fromJson(Map<String, dynamic> json) =>
      _$GeometryFromJson(json);
  Map<String, dynamic> toJson() => _$GeometryToJson(this);
}
