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
    final employeeid = generateEmployeeId();
    final joiningdate = generateJoiningDate();
    if (name.isNotEmpty &&
        emailid.isNotEmpty &&
        phonenumber.isNotEmpty &&
        department.isNotEmpty) {
      try {
        isLoading = true;
        bool isUserCreated =
            await FirebaseAuthServices().createUser(emailid, password);
        if (isUserCreated == true) {
          await FirestoreService().storeEmployeeData(employeeid, name, emailid,
              employeeid, phonenumber, joiningdate, department);
        }
        print('firebase create user error: $e !!!!!!!!!!!!!!!!!!!!!!!!11');
      } finally {
        isLoading = false;
        isEmployeeCreated = true;
        notifyListeners();
      }
    }
  }

  void resetEmployeeCreatedStatus() {
    Future.delayed(Duration(seconds: 2), () {
      isEmployeeCreated = false;
      notifyListeners();
      print(isEmployeeCreated);
    });
  }
}
