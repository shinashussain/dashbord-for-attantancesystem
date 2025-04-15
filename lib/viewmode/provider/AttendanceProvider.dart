import 'package:dashbordwebapp/Model/AttendanceRecord.dart';
import 'package:dashbordwebapp/viewmode/Services/FirestoreServices.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class AttendanceProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();
  List<AttendanceRecord> _records = [];
  bool _isLoading = false;

  List<AttendanceRecord> get records => _records;
  bool get isLoading => _isLoading;

  int get totalPresent => _records.where((record) => record.present).length;
  int get totalAbsent => _records.where((record) => !record.present).length;

  Future<void> fetchTodayAttendance() async {
    try {
      _isLoading = true;
      notifyListeners();

      // Generate today's date dynamically
      final today = DateTime.now();
      final formattedDate = DateFormat('dd-MM-yyyy').format(today);

      // Fetch attendance data for today's date
      final snapshot =
          await _firestoreService.fetchTodayAttendance(formattedDate);

      // Map Firestore data to AttendanceRecord
      _records = snapshot.docs.map((doc) {
        final data = doc.data();
        return AttendanceRecord(
          userId: doc.id,
          present: data['present'] ?? false,
          time: data['time'] ?? '',
        );
      }).toList();

      // Fetch names for each userId
      for (var record in _records) {
        final userSnapshot =
            await _firestoreService.fetchEmployeeData(record.userId);
        record.name = userSnapshot.data()?['name'] ?? 'Unknown';
      }
    } catch (e) {
      print('Error fetching attendance: $e !!!!!!!!!!!!!!!!!!!!!!!!!');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
