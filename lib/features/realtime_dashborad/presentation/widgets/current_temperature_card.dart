import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/temperature_stream_widget.dart';

class CurrentTemperatureCard extends StatelessWidget {
  final double value;

  const CurrentTemperatureCard({
    super.key,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(24),
        child: Column(
          children: [
            Icon(
              Icons.thermostat,
              size: 48,
            ),
            SizedBox(height: 12),
            TempeartureStreamWidget(value: value),
          ],
        ),
      ),
    );
  }
}