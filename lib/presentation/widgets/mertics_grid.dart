import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/presentation/widgets/metric_card.dart';

class MetricsGrid extends StatelessWidget {
  final bool isMobile;

  const MetricsGrid({super.key, required this.isMobile});

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
        children: const [
          MetricCard(title: "Average", value: "28.4"),
          MetricCard(title: "Maximum", value: "39.2"),
          MetricCard(title: "Minimum", value: "17.4"),
          MetricCard(title: "Points", value: "50"),
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
      children: const [
        MetricCard(title: "Average", value: "28.4"),
        MetricCard(title: "Maximum", value: "39.2"),
        MetricCard(title: "Minimum", value: "17.4"),
        MetricCard(title: "Points", value: "50"),
      ],
    );
  }
}
