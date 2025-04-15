class AttendanceRecord {
  final String userId;
  final bool present;
  final String? time;
  String? name;

  AttendanceRecord({
    required this.userId,
    required this.present,
    required this.time,
    this.name,
  });
}
