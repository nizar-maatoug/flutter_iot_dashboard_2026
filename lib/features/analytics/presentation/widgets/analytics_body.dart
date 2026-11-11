import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/features/analytics/models/analytics_result.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/mertics_grid.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/realtime_chart.dart';

class AnalyticsBody extends StatelessWidget {
  final AnalyticsResult result;

  const AnalyticsBody({super.key, required this.result});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context,constraints) {
        final isMobile = constraints.maxWidth < 600;
        return SingleChildScrollView(
          child: Column(
            children: [
              MetricsGrid(
                isMobile: isMobile,
                avg: result.statistics.avg,
                min: result.statistics.min,
                max: result.statistics.max,
                points: result.measurements.length,
              ),
        
              const SizedBox(height: 16),
        
              RealtimeChart(measurements: result.measurements),
            ],
          ),
        );
      }
    );
  }
}
