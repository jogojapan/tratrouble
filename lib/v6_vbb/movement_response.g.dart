// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movement_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MovementResponse _$MovementResponseFromJson(Map<String, dynamic> json) =>
    MovementResponse(
      movements: (json['movements'] as List<dynamic>)
          .map((e) => Movement.fromJson(e as Map<String, dynamic>))
          .toList(),
      realtimeDataUpdatedAt: (json['realtimeDataUpdatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$MovementResponseToJson(MovementResponse instance) =>
    <String, dynamic>{
      'movements': instance.movements,
      'realtimeDataUpdatedAt': instance.realtimeDataUpdatedAt,
    };

Movement _$MovementFromJson(Map<String, dynamic> json) => Movement(
  direction: json['direction'] as String,
  tripId: json['tripId'] as String,
  line: Line.fromJson(json['line'] as Map<String, dynamic>),
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  nextStopovers: (json['nextStopovers'] as List<dynamic>?)
      ?.map((e) => NextStopover.fromJson(e as Map<String, dynamic>))
      .toList(),
  frames: (json['frames'] as List<dynamic>?)
      ?.map((e) => Frame.fromJson(e as Map<String, dynamic>))
      .toList(),
  polyline: json['polyline'] == null
      ? null
      : Polyline.fromJson(json['polyline'] as Map<String, dynamic>),
);

Map<String, dynamic> _$MovementToJson(Movement instance) => <String, dynamic>{
  'direction': instance.direction,
  'tripId': instance.tripId,
  'line': instance.line,
  'location': instance.location,
  'nextStopovers': instance.nextStopovers,
  'frames': instance.frames,
  'polyline': instance.polyline,
};

NextStopover _$NextStopoverFromJson(Map<String, dynamic> json) => NextStopover(
  stop: Stop.fromJson(json['stop'] as Map<String, dynamic>),
  arrival: json['arrival'] as String?,
  plannedArrival: json['plannedArrival'] as String?,
  arrivalDelay: (json['arrivalDelay'] as num?)?.toInt(),
  arrivalPlatform: json['arrivalPlatform'] as String?,
  arrivalPrognosisType: json['arrivalPrognosisType'] as String?,
  plannedArrivalPlatform: json['plannedArrivalPlatform'] as String?,
  departure: json['departure'] as String?,
  plannedDeparture: json['plannedDeparture'] as String?,
  departureDelay: (json['departureDelay'] as num?)?.toInt(),
  departurePlatform: json['departurePlatform'] as String?,
  departurePrognosisType: json['departurePrognosisType'] as String?,
  plannedDeparturePlatform: json['plannedDeparturePlatform'] as String?,
);

Map<String, dynamic> _$NextStopoverToJson(NextStopover instance) =>
    <String, dynamic>{
      'stop': instance.stop,
      'arrival': instance.arrival,
      'plannedArrival': instance.plannedArrival,
      'arrivalDelay': instance.arrivalDelay,
      'arrivalPlatform': instance.arrivalPlatform,
      'arrivalPrognosisType': instance.arrivalPrognosisType,
      'plannedArrivalPlatform': instance.plannedArrivalPlatform,
      'departure': instance.departure,
      'plannedDeparture': instance.plannedDeparture,
      'departureDelay': instance.departureDelay,
      'departurePlatform': instance.departurePlatform,
      'departurePrognosisType': instance.departurePrognosisType,
      'plannedDeparturePlatform': instance.plannedDeparturePlatform,
    };

Frame _$FrameFromJson(Map<String, dynamic> json) => Frame(
  origin: Stop.fromJson(json['origin'] as Map<String, dynamic>),
  destination: Stop.fromJson(json['destination'] as Map<String, dynamic>),
  t: (json['t'] as num).toInt(),
);

Map<String, dynamic> _$FrameToJson(Frame instance) => <String, dynamic>{
  'origin': instance.origin,
  'destination': instance.destination,
  't': instance.t,
};

Polyline _$PolylineFromJson(Map<String, dynamic> json) => Polyline(
  type: json['type'] as String,
  features: (json['features'] as List<dynamic>)
      .map((e) => Feature.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$PolylineToJson(Polyline instance) => <String, dynamic>{
  'type': instance.type,
  'features': instance.features,
};

Feature _$FeatureFromJson(Map<String, dynamic> json) => Feature(
  type: json['type'] as String,
  properties: json['properties'] as Map<String, dynamic>,
  geometry: Geometry.fromJson(json['geometry'] as Map<String, dynamic>),
);

Map<String, dynamic> _$FeatureToJson(Feature instance) => <String, dynamic>{
  'type': instance.type,
  'properties': instance.properties,
  'geometry': instance.geometry,
};

Geometry _$GeometryFromJson(Map<String, dynamic> json) => Geometry(
  type: json['type'] as String,
  coordinates: (json['coordinates'] as List<dynamic>)
      .map((e) => (e as num).toDouble())
      .toList(),
);

Map<String, dynamic> _$GeometryToJson(Geometry instance) => <String, dynamic>{
  'type': instance.type,
  'coordinates': instance.coordinates,
};
