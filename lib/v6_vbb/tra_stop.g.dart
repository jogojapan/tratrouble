// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tra_stop.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TraStop _$TraStopFromJson(Map<String, dynamic> json) => TraStop(
  type: json['type'] as String,
  id: json['id'] as String,
  name: json['name'] as String,
  location: Location.fromJson(json['location'] as Map<String, dynamic>),
  products: Products.fromJson(json['products'] as Map<String, dynamic>),
  stationDHID: json['stationDHID'] as String,
  distance: (json['distance'] as num).toInt(),
);

Map<String, dynamic> _$TraStopToJson(TraStop instance) => <String, dynamic>{
  'type': instance.type,
  'id': instance.id,
  'name': instance.name,
  'location': instance.location,
  'products': instance.products,
  'stationDHID': instance.stationDHID,
  'distance': instance.distance,
};

Location _$LocationFromJson(Map<String, dynamic> json) => Location(
  type: json['type'] as String,
  id: json['id'] as String,
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
