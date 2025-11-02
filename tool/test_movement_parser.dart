import 'dart:convert';
import 'dart:io';

import 'package:tratrouble/v6_vbb/movement_response.dart';

void main(List<String> arguments) {
  if (arguments.isEmpty) {
    print('Usage: dart test_movement_parser.dart <path_to_json_file>');
    exit(1);
  }

  final filePath = arguments[0];
  final file = File(filePath);

  if (!file.existsSync()) {
    print('File not found: $filePath');
    exit(2);
  }

  try {
    final content = file.readAsStringSync();
    final jsonData = json.decode(content);
    final movementResponse = MovementResponse.fromJson(jsonData);

    print('Parsed movements:');
    for (final movement in movementResponse.movements) {
      print('  Direction: \u001b[32m${movement.direction}\u001b[0m');
      print(
        '  Location: lat=${movement.location.latitude}, lon=${movement.location.longitude}',
      );
      print('  Line Name: \u001b[36m${movement.line.name}\u001b[0m');
      print('  Line Product: \u001b[36m${movement.line.productName}\u001b[0m');
      print('-----');
    }
  } catch (e) {
    print('Error parsing JSON: $e');
    exit(3);
  }
}
