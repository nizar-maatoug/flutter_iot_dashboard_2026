import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/core/theme/app_theme.dart';
import 'package:iot_dashboard_app/features/analytics/presentation/screens/analytics_screen.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/models/measurement.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/presentation/screens/dashboard_screen.dart';
import 'package:iot_dashboard_app/features/realtime_dashborad/services/websocket_service.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  const DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Dashboard',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      home: AnalyticsScreen(), //DashboardScreen(),
    );
  }
}

class DashboardApp_ extends StatelessWidget {
  final WebSocketService _webSocketService = WebSocketService();
  final Logger _logger = Logger();

  DashboardApp_({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Dashboard',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        //appBar: AppBar(title: Text('IoT Dashboard')),
        body: StreamBuilder<Measurement>(
          stream: _webSocketService.measurements,
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.waiting:
                return const Center(
                  child: CircularProgressIndicator(),
                );

              case ConnectionState.active:
                final measurement = snapshot.data!;
                return Center(
                  child: Text(
                    '${measurement.value}',
                    style: const TextStyle(
                      fontSize: 50,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );

              case ConnectionState.done:
                return const Text('Disconnected');

              default:
                return const SizedBox();
            }
          },
        ),
      ),
    );
  }
}
