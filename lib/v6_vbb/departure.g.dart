// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'departure.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Departure _$DepartureFromJson(Map<String, dynamic> json) => Departure(
  tripId: json['tripId'] as String,
  stop: Stop.fromJson(json['stop'] as Map<String, dynamic>),
  when: json['when'] as String,
  plannedWhen: json['plannedWhen'] as String,
  delay: json['delay'],
  platform: json['platform'],
  plannedPlatform: json['plannedPlatform'],
  prognosisType: json['prognosisType'],
  direction: json['direction'] as String,
  provenance: json['provenance'] as String?,
  line: Line.fromJson(json['line'] as Map<String, dynamic>),
  remarks: (json['remarks'] as List<dynamic>?)
      ?.map((e) => Remark.fromJson(e as Map<String, dynamic>))
      .toList(),
  origin: json['origin'],
  destination: Destination.fromJson(
    json['destination'] as Map<String, dynamic>,
  ),
  currentTripPosition: json['currentTripPosition'] == null
      ? null
      : CurrentTripPosition.fromJson(
          json['currentTripPosition'] as Map<String, dynamic>,
        ),
);

Map<String, dynamic> _$DepartureToJson(Departure instance) => <String, dynamic>{
  'tripId': instance.tripId,
  'stop': instance.stop,
  'when': instance.when,
  'plannedWhen': instance.plannedWhen,
  'delay': instance.delay,
  'platform': instance.platform,
  'plannedPlatform': instance.plannedPlatform,
  'prognosisType': instance.prognosisType,
  'direction': instance.direction,
  'provenance': instance.provenance,
  'line': instance.line,
  'remarks': instance.remarks,
  'origin': instance.origin,
  'destination': instance.destination,
  'currentTripPosition': instance.currentTripPosition,
};

Stop _$StopFromJson(Map<String, dynamic> json) => Stop(
  type: json['type'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  products: Products.fromJson(json['products'] as Map<String, dynamic>),
  stationDHID: json['stationDHID'] as String,
);

Map<String, dynamic> _$StopToJson(Stop instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
  'products': instance.products,
  'stationDHID': instance.stationDHID,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  type: json['type'] as String,
  id: json['id'] as String?,
  latitude: (json['latitude'] as num).toDouble(),
  longitude: (json['longitude'] as num).toDouble(),
);

Map<String, dynamic> _$LocationToJson(Location instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};

Products _$ProductsFromJson(Map<String, dynamic> json) => Products(
  suburban: json['suburban'] as bool,
  subway: json['subway'] as bool,
  tram: json['tram'] as bool,
  bus: json['bus'] as bool,
  ferry: json['ferry'] as bool,
  express: json['express'] as bool,
  regional: json['regional'] as bool,
);

Map<String, dynamic> _$ProductsToJson(Products instance) => <String, dynamic>{
  'suburban': instance.suburban,
  'subway': instance.subway,
  'tram': instance.tram,
  'bus': instance.bus,
  'ferry': instance.ferry,
  'express': instance.express,
  'regional': instance.regional,
};

Line _$LineFromJson(Map<String, dynamic> json) => Line(
  type: json['type'] as String,
  id: json['id'] as String,
  fahrtNr: json['fahrtNr'] as String?,
  name: json['name'] as String,
  isPublic: json['public'] as bool,
  adminCode: json['adminCode'] as String?,
  productName: json['productName'] as String,
  mode: json['mode'] as String,
  product: json['product'] as String,
  operator: Operator.fromJson(json['operator'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LineToJson(Line instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'fahrtNr': instance.fahrtNr,
  'name': instance.name,
  'public': instance.isPublic,
  'adminCode': instance.adminCode,
  'productName': instance.productName,
  'mode': instance.mode,
  'product': instance.product,
  'operator': instance.operator,
};

Operator _$OperatorFromJson(Map<String, dynamic> json) => Operator(
  type: json['type'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
);

Map<String, dynamic> _$OperatorToJson(Operator instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
};

Remark _$RemarkFromJson(Map<String, dynamic> json) => Remark(
  type: json['type'] as String,
  code: json['code'] as String,
  text: json['text'] as String,
);

Map<String, dynamic> _$RemarkToJson(Remark instance) => <String, dynamic>{
  'type': instance.type,
  'code': instance.code,
  'text': instance.text,
};

Destination _$DestinationFromJson(Map<String, dynamic> json) => Destination(
  type: json['type'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  products: Products.fromJson(json['products'] as Map<String, dynamic>),
  stationDHID: json['stationDHID'] as String,
);

Map<String, dynamic> _$DestinationToJson(Destination instance) =>
    <String, dynamic>{
      'type': instance.type,
      'id': instance.id,
      'name': instance.name,
      'location': instance.location,
      'products': instance.products,
      'stationDHID': instance.stationDHID,
    };

CurrentTripPosition _$CurrentTripPositionFromJson(Map<String, dynamic> json) =>
    CurrentTripPosition(
      type: json['type'] as String,
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
    );

Map<String, dynamic> _$CurrentTripPositionToJson(
  CurrentTripPosition instance,
) => <String, dynamic>{
  'type': instance.type,
  'latitude': instance.latitude,
  'longitude': instance.longitude,
};
