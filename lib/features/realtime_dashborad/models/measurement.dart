import 'package:iot_dashboard_app/features/realtime_dashborad/models/measurement_types.dart';

class Measurement {
  final double value;
  final DateTime timestamp;
  final MeasurementType measurementType;

  const Measurement({
    required this.value,
    required this.timestamp,
    required this.measurementType,
  });

  factory Measurement.fromJson(Map<String, dynamic> json) {
    return Measurement(
      value: (json['valeur'] as num?)?.toDouble() ?? 0.0,
      timestamp: DateTime.parse(json['date_prise']),
      measurementType: MeasurementType.temperature, // Assuming a default value for typeMeasurement, adjust as needed
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'valeur': value,
      'date_prise': timestamp.toIso8601String(),
    };
  }

  @override
  String toString() {
    return 'Measurement(value: $value, timestamp: $timestamp)';
  }
}
