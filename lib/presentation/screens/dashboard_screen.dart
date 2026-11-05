import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/presentation/widgets/current_temperature_card.dart';
import 'package:iot_dashboard_app/presentation/widgets/mertics_grid.dart';
import 'package:iot_dashboard_app/presentation/widgets/realtime_chart.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('IoT Dashboard'),
      ),
      body: const DashboardBody(),
    );
  }
}

class DashboardBody extends StatelessWidget {
  const DashboardBody({super.key});

  @override
  Widget build(BuildContext context) {

    return LayoutBuilder(
      builder: (context, constraints) {

        final isMobile = constraints.maxWidth < 600;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [

              const CurrentTemperatureCard(),

              const SizedBox(height: 16),

              MetricsGrid(
                isMobile: isMobile,
              ),

              const SizedBox(height: 16),

              const RealtimeChart(),
            ],
          ),
        );
      },
    );
  }
}