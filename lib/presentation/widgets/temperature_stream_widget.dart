import 'package:flutter/material.dart';
import 'package:iot_dashboard_app/models/measurement.dart';
import 'package:iot_dashboard_app/services/websocket_service.dart';
import 'package:logger/logger.dart';

class TempeartureStreamWidget extends StatelessWidget {
  TempeartureStreamWidget({super.key});

  final WebSocketService _webSocketService = WebSocketService();
  final Logger _logger = Logger();

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<Measurement>(
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
                style: Theme.of(context).textTheme.displaySmall,
              ),
            );

          case ConnectionState.done:
            return const Text('Disconnected');

          default:
            return const SizedBox();
        }
      },
    );
  }
}
