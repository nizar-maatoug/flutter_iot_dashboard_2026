import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/services/websocket_service.dart';
import 'package:logger/logger.dart';

void main() {
  runApp(DashboardApp());
}

class DashboardApp extends StatefulWidget {
  const DashboardApp({super.key});

  @override
  State<DashboardApp> createState() => _DashboardAppState();
}

class _DashboardAppState extends State<DashboardApp> {
  late final WebSocketService _webSocketService;
  final Logger _logger = Logger();

  @override
  void initState() {
    super.initState();
    _logger.i('Connecting to WebSocket...');
    _webSocketService = WebSocketService();
    _webSocketService.measurements.listen((measurement) {
      _logger.i("Received measurement: ${measurement.value}");
    });
  }

  @override
  void dispose() {
    _webSocketService.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
