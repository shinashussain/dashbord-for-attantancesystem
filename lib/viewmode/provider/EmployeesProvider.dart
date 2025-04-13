import 'package:dashbordwebapp/Model/Employee.dart';
import 'package:dashbordwebapp/viewmode/Services/FirestoreServices.dart';
import 'package:flutter/foundation.dart';

class EmployeesProvider extends ChangeNotifier {
  final FirestoreService _firestoreService = FirestoreService();

  List<Employee> _employees = [];
  int _selectedIndex = -1;

  Stream<List<Employee>> get employeesStream =>
      _firestoreService.getEmployeesStream();

  void setEmployeeList(List<Employee> list) {
    _employees = list;
  }

  void updateIndex(int index) {
    _selectedIndex = index;
    notifyListeners();
  }

  Employee? get selectedEmployee =>
      _selectedIndex >= 0 && _selectedIndex < _employees.length
          ? _employees[_selectedIndex]
          : null;

  List<Employee> get employeeList => _employees;
}
