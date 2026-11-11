import 'dart:convert';

import 'package:iot_dashboard_app/features/realtime_dashborad/models/measurement.dart';

List<Measurement> parseMeasurements(String responseBody) {
  final List<dynamic> data = jsonDecode(responseBody);

  return data.map((json) => Measurement.fromJson(json)).toList();
}
