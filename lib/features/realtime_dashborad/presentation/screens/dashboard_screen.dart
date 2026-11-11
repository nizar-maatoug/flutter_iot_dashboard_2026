import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/models/dashboard_data.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/current_temperature_card.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/mertics_grid.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/widgets/realtime_chart.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/services/dashboard_service.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/services/websocket_service.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() =>
      _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  late final DashboardService _dashboardService;

  @override
  void initState() {
    super.initState();

    _dashboardService = DashboardService(WebSocketService());

    _dashboardService.start();
  }

  @override
  void dispose() {
    _dashboardService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('IoT Dashboard')),
      body: StreamBuilder<DashboardData>(
        stream: _dashboardService.dashboardStream,
        builder: (context, asyncSnapshot) {
          if (!asyncSnapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final data = asyncSnapshot.data!;
          return DashboardBody(data: data);
        },
      ),
    );
  }
}

class DashboardBody extends StatelessWidget {
  final DashboardData data;
  const DashboardBody({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final isMobile = constraints.maxWidth < 600;

        return SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Column(
            children: [
              CurrentTemperatureCard(value: data.current.value),

              const SizedBox(height: 16),

              MetricsGrid(
                isMobile: isMobile,
                avg: data.avg,
                min: data.min,
                max: data.max,
                points: data.history.length,
              ),

              const SizedBox(height: 16),

              RealtimeChart(measurements: data.history),
            ],
          ),
        );
      },
    );
  }
}
