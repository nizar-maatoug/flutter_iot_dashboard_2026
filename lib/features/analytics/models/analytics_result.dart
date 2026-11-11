import 'package:iot_dashboard_app/features/realtime_dashborad/models/measurement.dart';

import 'statistics.dart';

class AnalyticsResult {
  final List<Measurement> measurements;
  final Statistics statistics;

  const AnalyticsResult({
    required this.measurements,
    required this.statistics,
  });
}