class MeasurementQuery {
  final int grandeurId;
  final DateTime start;
  final DateTime end;

  const MeasurementQuery({
    required this.grandeurId,
    required this.start,
    required this.end,
  });
}