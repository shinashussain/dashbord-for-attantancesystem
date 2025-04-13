class AttendanceRecord {
  final String userId;
  final bool present;
  final String? timestamp;
  String? name;

  AttendanceRecord({
    required this.userId,
    required this.present,
    required this.timestamp,
    this.name,
  });
}
