import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/presentation/widgets/temperature_stream_widget.dart';

class CurrentTemperatureCard extends StatelessWidget {

  const CurrentTemperatureCard({
    super.key,
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
            TempeartureStreamWidget(),
          ],
        ),
      ),
    );
  }
}