import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';

import '../../models/measurement.dart';

class RealtimeChart extends StatelessWidget {
  final List<Measurement> measurements;

  const RealtimeChart({super.key, required this.measurements});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: SizedBox(
          height: 300,
          child: measurements.isEmpty
              ? const Center(
                  child: const CircularProgressIndicator(),
                )
              : LineChart(_buildChartData(context)),
        ),
      ),
    );
  }

  LineChartData _buildChartData(BuildContext context) {
    return LineChartData(
      minX: 0,
      maxX: (measurements.length - 1).toDouble(),

      gridData: const FlGridData(show: true),

      borderData: FlBorderData(show: true),

      titlesData: const FlTitlesData(
        topTitles: AxisTitles(),
        rightTitles: AxisTitles(),
      ),

      lineTouchData: LineTouchData(enabled: true),

      lineBarsData: [
        LineChartBarData(
          spots: _buildSpots(),
          isCurved: true,
          barWidth: 3,

          color: Theme.of(context).colorScheme.primary,

          dotData: const FlDotData(show: false),

          belowBarData: BarAreaData(
            show: true,
            color: Theme.of(context).colorScheme.primary
                .withValues(alpha: .15),
          ),
        ),
      ],
    );
  }

  List<FlSpot> _buildSpots() {
    return measurements
        .asMap()
        .entries
        .map(
          (entry) =>
              FlSpot(entry.key.toDouble(), entry.value.value),
        )
        .toList();
  }
}
