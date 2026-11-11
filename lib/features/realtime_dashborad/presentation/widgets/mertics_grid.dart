import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/models/dashboard_data.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/metric_card.dart';

class MetricsGrid extends StatelessWidget {
  final bool isMobile;
  final DashboardData data;

  const MetricsGrid({
    super.key,
    required this.isMobile,
    required this.data,
  });

  @override
  Widget build(BuildContext context) {
    if (isMobile) {
      return GridView.count(
        crossAxisCount: 2,
        shrinkWrap: true,
        physics: NeverScrollableScrollPhysics(),
        crossAxisSpacing: 16,
        mainAxisSpacing: 16,
        childAspectRatio: 1.5,
        children: [
          MetricCard(
            title: "Average",
            value: data.avg.toStringAsFixed(2),
          ),
          MetricCard(
            title: "Maximum",
            value: data.max.toStringAsFixed(2),
          ),
          MetricCard(
            title: "Minimum",
            value: data.min.toStringAsFixed(2),
          ),
          MetricCard(
            title: "Points",
            value: data.history.length.toString(),
          ),
        ],
      );
    }

    return GridView.count(
      crossAxisCount: 4,
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      crossAxisSpacing: 16,
      mainAxisSpacing: 16,
      childAspectRatio: 1.1,
      children: [
        MetricCard(
          title: "Average",
          value: data.avg.toStringAsFixed(2),
        ),
        MetricCard(
          title: "Maximum",
          value: data.max.toStringAsFixed(2),
        ),
        MetricCard(
          title: "Minimum",
          value: data.min.toStringAsFixed(2),
        ),
        MetricCard(
          title: "Points",
          value: data.history.length.toString(),
        ),
      ],
    );
  }
}
