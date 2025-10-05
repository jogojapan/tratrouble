import 'package:json_annotation/json_annotation.dart';

part 'tra_stop.g.dart';

@JsonSerializable()
class TraStop {
  final String type;
  final String id;
  final String name;
  final Location location;
  final Products products;
  final String stationDHID;
  final int distance;

  TraStop({
    required this.type,
    required this.id,
    required this.name,
    required this.location,
    required this.products,
    required this.stationDHID,
    required this.distance,
  });

  factory TraStop.fromJson(Map<String, dynamic> json) =>
      _$TraStopFromJson(json);
  Map<String, dynamic> toJson() => _$TraStopToJson(this);

  static List<TraStop> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((e) => TraStop.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> listToJson(List<TraStop> stops) {
    return stops.map((e) => e.toJson()).toList();
  }
}

@JsonSerializable()
class Location {
  final String type;
  final String id;
  final double latitude;
  final double longitude;

  Location({
    required this.type,
    required this.id,
    required this.latitude,
    required this.longitude,
  });

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
  Map<String, dynamic> toJson() => _$LocationToJson(this);
}

@JsonSerializable()
class Products {
  final bool suburban;
  final bool subway;
  final bool tram;
  final bool bus;
  final bool ferry;
  final bool express;
  final bool regional;

  Products({
    required this.suburban,
    required this.subway,
    required this.tram,
    required this.bus,
    required this.ferry,
    required this.express,
    required this.regional,
  });

  factory Products.fromJson(Map<String, dynamic> json) =>
      _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);
}
