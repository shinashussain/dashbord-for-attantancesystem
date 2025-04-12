import 'package:cloud_firestore/cloud_firestore.dart';

class FirestoreService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // create a new employee
  Future<void> createEmployee(String name, String checkInTime) async {
    await _firestore.collection('employees').add({
      'name': name,
      'checkInTime': checkInTime,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }
}
