import 'package:flutter/material.dart';
import '../../viewmode/Services/FirestoreServices.dart';

class EmployeeAttendanceProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<Map<String, dynamic>> _attendanceRecords = [];
  bool _isLoading = false;

  List<Map<String, dynamic>> get attendanceRecords => _attendanceRecords;
  bool get isLoading => _isLoading;

  Future<void> fetchAttendance(String userId) async {
    try {
      _isLoading = true;
      notifyListeners();

      _attendanceRecords =
          await _firestoreService.fetchEmployeeAttendance(userId);
    } catch (e) {
      print('Error fetching attendance: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
