import 'package:iot_dashboard_app/features/realtime_dashborad/models/measurement.dart';

import '../../models/statistics.dart';

Statistics calculateStatistics(
  List<Measurement> measurements,
) {
  if (measurements.isEmpty) {
    return const Statistics(
      min: 0,
      max: 0,
      avg: 0,
    );
  }

  final values =
      measurements.map((m) => m.value).toList();

  final min =
      values.reduce((a, b) => a < b ? a : b);

  final max =
      values.reduce((a, b) => a > b ? a : b);

  final sum =
      values.reduce((a, b) => a + b);

  final avg = sum / values.length;

  return Statistics(
    min: min,
    max: max,
    avg: avg,
  );
}