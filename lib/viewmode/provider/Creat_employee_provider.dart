import 'dart:math';

import 'package:dashbordwebapp/viewmode/Services/Firebase_Auth_Services.dart';
import 'package:dashbordwebapp/viewmode/Services/FirestoreServices.dart';
import 'package:flutter/foundation.dart';
import 'package:intl/intl.dart';

class CreateEmployeeProvider extends ChangeNotifier {
  bool isLoading = false;
  bool isEmployeeCreated = false;
  String generateJoiningDate() {
    final datetime = DateTime.now();
    final date = DateFormat('dd-MM-yyyy').format(datetime);
    return date;
  }

  String generateEmployeeId() {
    Random random = Random();
    String numberPart =
        List.generate(10, (index) => random.nextInt(10).toString()).join();
    return 'EMP$numberPart';
  }

  Future<void> createEmployee(
      {required String name,
      required String emailid,
      required String phonenumber,
      required String department,
      required String password}) async {
    print('#####################################3');
    final employeeid = generateEmployeeId();
    final joiningdate = generateJoiningDate();
    try {
      isLoading = true;
      print('Creating employee with ID: $employeeid');
      print('date is formatted $joiningdate');
      print('Employee creation initiated1111111111111111111111111111111111111');
      await FirebaseAuthServices().createUser(emailid, password);
      await FirestoreService().storeEmployeeData(employeeid, name, emailid,
          employeeid, phonenumber, joiningdate, department);
    } catch (e) {
      print('firebase create user error: $e');
      print('erorr !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!');
    } finally {
      isLoading = false;
      isEmployeeCreated = true;
      notifyListeners();
    }
  }
}
