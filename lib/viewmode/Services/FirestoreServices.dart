import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dashbordwebapp/Model/Employee.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // create a new employee
  Future<void> storeEmployeeData(
      String uid,
      String name,
      String emailid,
      String employeeid,
      String phonenumber,
      String joiningdate,
      String department) async {
    await _firestore.collection('user').doc(employeeid).set({
      'name': name,
      'email id': emailid,
      'employee id': employeeid,
      'phone number': phonenumber,
      'joining date': joiningdate,
      'department': department
    });
  }

  Stream<List<Employee>> getEmployeesStream() {
    return _firestore.collection('user').snapshots().map((snapshot) {
      return snapshot.docs.map((doc) {
        final data = doc.data();
        return Employee.fromFirestore(doc.id, data);
      }).toList();
    });
  }

  Future<QuerySnapshot<Map<String, dynamic>>> fetchTodayAttendance(
      String todaydate) async {
    try {
      return await _firestore
          .collection('attendance')
          .doc(todaydate)
          .collection('records')
          .get();
    } catch (e) {
      print('Error fetching attendance data: $e !!!!!!!!!!!!!!!!!!!!!!!!1');
      rethrow;
    }
  }

  Future<DocumentSnapshot<Map<String, dynamic>>> fetchEmployeeData(
      String employeeId) async {
    try {
      return await _firestore.collection('user').doc(employeeId).get();
    } catch (e) {
      print('Error fetching employee data: $e !!!!!!!!!!!!!!!!!!!!!!!!!');
      rethrow;
    }
  }

  Future<List<Map<String, dynamic>>> fetchEmployeeAttendance(
      String userid) async {
    try {
      final snapshot = await _firestore.collection('attendance').get();
      List<Map<String, dynamic>> attendanceRecords = [];
      for (var doc in snapshot.docs) {
        final recordSnapshot = await _firestore
            .collection('attendance')
            .doc(doc.id)
            .collection('records')
            .doc(userid)
            .get();
        print(recordSnapshot.data());
        if (recordSnapshot.exists) {
          final data = recordSnapshot.data();
          attendanceRecords.add({
            'date': doc.id,
            'present': data?['present'] ?? false,
            'timestamp': data?['timestamp'],
          });
        } else {}
      }

      return attendanceRecords;
    } catch (e) {
      print('Error fetching employee attendance: $e');
      return [];
    }
  }
}

// Firestore
// │
// ├── Collection: "users"
// │      └── Document: {user_id}
// │               ├── name         : string
// │               ├── email        : string
// │               ├── emp_id       : string
// │               ├── phone        : string
// │               └── joining_date : Timestamp
// │
// └── Collection: "attendance"
//        └── Document: {YYYY-MM-DD}
//                 └── Subcollection: "records"
//                          └── Document: {user_id}
//                                   ├── present   : true
//                                   └── timestamp : FieldValue.serverTimestamp()
