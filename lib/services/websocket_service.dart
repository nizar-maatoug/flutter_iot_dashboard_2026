import 'dart:convert';

import 'package:logger/logger.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

import 'package:iot_dashboard_app/core/strings/connection.dart';

import '../models/measurement.dart';

class WebSocketService {
  late final WebSocketChannel _channel;
  final Logger _logger = Logger();

  WebSocketService() {
    _channel = WebSocketChannel.connect(Uri.parse(SOCKET_URL));
  }

  Stream<Measurement> get measurements =>
      _channel.stream.map((event) {
        _logger.i("Received raw event: $event");

        final json = jsonDecode(event);
        return Measurement.fromJson(json);
      });

  void dispose() {
    _channel.sink.close();
  }
}
