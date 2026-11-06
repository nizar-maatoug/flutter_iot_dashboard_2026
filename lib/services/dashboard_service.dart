import 'dart:async';

import 'package:iot_dashboard_app/models/dashboard_data.dart';
import 'package:iot_dashboard_app/models/measurement.dart';
import 'package:iot_dashboard_app/services/websocket_service.dart';

class DashboardService {
  final WebSocketService _webSocketService;

  DashboardService(this._webSocketService);

  final List<Measurement> _history = [];

  final StreamController<DashboardData> _controller =
      StreamController<DashboardData>.broadcast();

  StreamSubscription<Measurement>? _subscription;

  Stream<DashboardData> get dashboardStream =>
      _controller.stream;

  void start() {
    _subscription = _webSocketService.measurements.listen(
      _onMeasurementReceived,
      onError: _controller.addError,
    );
  }

  void _onMeasurementReceived(Measurement measurement) {
    _history.add(measurement);

    // Keep last 100 points
    if (_history.length > 100) {
      _history.removeAt(0);
    }

    final values = _history
        .map((measurement) => measurement.value)
        .toList();

    final min =
        values.reduce((current, next) => current < next ? current : next);

    final max =
        values.reduce((current, next) => current > next ? current : next);

    final avg =
        values.reduce((a, b) => a + b) / values.length;

    _controller.add(
      DashboardData(
        current: measurement,
        history: List.unmodifiable(_history),
        avg: avg,
        min: min,
        max: max,
      ),
    );
  }

  void dispose() {
    _subscription?.cancel();
    _controller.close();
  }
}