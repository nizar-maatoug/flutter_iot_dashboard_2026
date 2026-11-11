import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'package:iot_dashboard_app/core/strings/connection.dart';
import 'package:iot_dashboard_app/features/analytics/models/mesurements_query.dart';

import '../analytics/statistics_calculator.dart';
import '../parsers/measurement_parser.dart';
import '../../models/analytics_result.dart';

class AnalyticsService {
  static const _baseUrl = ANALYTICS_URL;

  Future<AnalyticsResult> search(MeasurementQuery query) async {
    final uri = Uri.parse(_baseUrl).replace(
      queryParameters: {
        'grandeur': query.grandeurId.toString(),
        'start': query.start.toIso8601String(),
        'end': query.end.toIso8601String(),
      },
    );

    final response = await http.get(uri);

    if (response.statusCode != 200) {
      throw Exception('Failed to load measurements');
    }

    ///
    /// ISOLATE #1
    /// JSON -> List<Measurement>
    ///
    final measurements = await compute(
      parseMeasurements,
      response.body,
    );

    ///
    /// ISOLATE #2
    /// List<Measurement> -> Statistics
    ///
    final statistics = await compute(
      calculateStatistics,
      measurements,
    );

    return AnalyticsResult(
      measurements: measurements,
      statistics: statistics,
    );
  }
}
