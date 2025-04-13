import 'package:cloud_firestore/cloud_firestore.dart';

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
}
