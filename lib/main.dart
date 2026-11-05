import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/models/measurement.dart';
import 'package:iot_dashboard_app/services/websocket_service.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatelessWidget {
  final WebSocketService _webSocketService = WebSocketService();
  final Logger _logger = Logger();

  DashboardApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IoT Dashboard',
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(title: Text('IoT Dashboard')),
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
