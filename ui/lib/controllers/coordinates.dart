import 'dart:convert';
import 'package:http/http.dart' as http;

class Coordinates {
  final double lat;
  final double lng;

  Coordinates({required this.lat, required this.lng});

  factory Coordinates.fromJson(Map<String, dynamic> json) {
    return Coordinates(
      lat: (json['lat'] as num).toDouble(),
      lng: (json['lng'] as num).toDouble(),
    );
  }
}


Future<Coordinates?> fetchCoordinates() async {
  final url = Uri.parse("http://192.168.1.130:8080/game/coordinates");
  try {
    final response = await http.get(url, headers: {
      'Content-Type': 'application/json',
    });

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = jsonDecode(response.body);
      return Coordinates.fromJson(jsonResponse);
    } else {
      throw Exception("Failed to fetch coordinates: HTTP ${response.statusCode}");
    }
  } catch (error) {
    throw Exception("Failed to fetch coordinates: $error");
  }
}
