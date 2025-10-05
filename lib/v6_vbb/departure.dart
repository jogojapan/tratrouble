import 'package:json_annotation/json_annotation.dart';

part 'departure.g.dart';

@JsonSerializable()
class Departure {
  final String tripId;
  final Stop stop;
  final String when;
  final String plannedWhen;
  final dynamic delay;
  final dynamic platform;
  final dynamic plannedPlatform;
  final dynamic prognosisType;
  final String direction;
  final String? provenance;
  final Line line;
  final List<Remark>? remarks;
  final dynamic origin;
  final Destination destination;
  final CurrentTripPosition? currentTripPosition;

  Departure({
    required this.tripId,
    required this.stop,
    required this.when,
    required this.plannedWhen,
    this.delay,
    this.platform,
    this.plannedPlatform,
    this.prognosisType,
    required this.direction,
    this.provenance,
    required this.line,
    this.remarks,
    this.origin,
    required this.destination,
    this.currentTripPosition,
  });

  factory Departure.fromJson(Map<String, dynamic> json) =>
      _$DepartureFromJson(json);
  Map<String, dynamic> toJson() => _$DepartureToJson(this);

  static List<Departure> listFromJson(List<dynamic> jsonList) {
    return jsonList
        .map((e) => Departure.fromJson(e as Map<String, dynamic>))
        .toList();
  }

  static List<Map<String, dynamic>> listToJson(List<Departure> departures) {
    return departures.map((e) => e.toJson()).toList();
  }
}

@JsonSerializable()
class Stop {
  final String type;
  final String id;
  final String name;
  final Location location;
  final Products products;
  final String stationDHID;

  Stop({
    required this.type,
    required this.id,
    required this.name,
    required this.location,
    required this.products,
    required this.stationDHID,
  });

  factory Stop.fromJson(Map<String, dynamic> json) => _$StopFromJson(json);
  Map<String, dynamic> toJson() => _$StopToJson(this);
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

@JsonSerializable()
class Line {
  final String type;
  final String id;
  final String fahrtNr;
  final String name;
  @JsonKey(name: 'public')
  final bool isPublic;
  final String adminCode;
  final String productName;
  final String mode;
  final String product;
  final Operator operator;

  Line({
    required this.type,
    required this.id,
    required this.fahrtNr,
    required this.name,
    required this.isPublic,
    required this.adminCode,
    required this.productName,
    required this.mode,
    required this.product,
    required this.operator,
  });

  factory Line.fromJson(Map<String, dynamic> json) => _$LineFromJson(json);
  Map<String, dynamic> toJson() => _$LineToJson(this);
}

@JsonSerializable()
class Operator {
  final String type;
  final String id;
  final String name;

  Operator({required this.type, required this.id, required this.name});

  factory Operator.fromJson(Map<String, dynamic> json) =>
      _$OperatorFromJson(json);
  Map<String, dynamic> toJson() => _$OperatorToJson(this);
}

@JsonSerializable()
class Remark {
  final String type;
  final String code;
  final String text;

  Remark({required this.type, required this.code, required this.text});

  factory Remark.fromJson(Map<String, dynamic> json) => _$RemarkFromJson(json);
  Map<String, dynamic> toJson() => _$RemarkToJson(this);
}

@JsonSerializable()
class Destination {
  final String type;
  final String id;
  final String name;
  final Location location;
  final Products products;
  final String stationDHID;

  Destination({
    required this.type,
    required this.id,
    required this.name,
    required this.location,
    required this.products,
    required this.stationDHID,
  });

  factory Destination.fromJson(Map<String, dynamic> json) =>
      _$DestinationFromJson(json);
  Map<String, dynamic> toJson() => _$DestinationToJson(this);
}

@JsonSerializable()
class CurrentTripPosition {
  final String type;
  final double latitude;
  final double longitude;

  CurrentTripPosition({
    required this.type,
    required this.latitude,
    required this.longitude,
  });

  factory CurrentTripPosition.fromJson(Map<String, dynamic> json) =>
      _$CurrentTripPositionFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentTripPositionToJson(this);
}
