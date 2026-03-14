class ConsistencyData {
  final String day;
  final double value;
  final bool isHighlighted;

  ConsistencyData({
    required this.day,
    required this.value,
    this.isHighlighted = false,
  });
}

final consistencyData = [
  ConsistencyData(day: "Sun", value: 0.3),
  ConsistencyData(day: "Mon", value: 0.4),
  ConsistencyData(day: "Tue", value: 0.5),
  ConsistencyData(day: "Wed", value: 0.8),
  ConsistencyData(day: "Thu", value: 0.9, isHighlighted: true),
  ConsistencyData(day: "Fri", value: 0.4),
  ConsistencyData(day: "Sat", value: 0.3),
];
