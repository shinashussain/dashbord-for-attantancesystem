import 'package:dashbordwebapp/Model/Employee.dart';
import 'package:flutter/material.dart';

class Todaydashbordprovider extends ChangeNotifier {
  final List<Employee> _employees = [
    Employee(name: 'John Doe', checkInTime: '10:05 am'),
    Employee(name: 'Jane Smith', checkInTime: '10:05 am'),
    Employee(name: 'Michael Johnson', checkInTime: '10:05 am'),
    Employee(name: 'Emily Davis', checkInTime: '10:05 am'),
    Employee(name: 'James Brown', checkInTime: '10:05 am'),
    Employee(name: 'Jessica Wilson', checkInTime: '10:05 am'),
    Employee(name: 'David Martinez', checkInTime: '10:05 am'),
    Employee(name: 'Sarah Taylor', checkInTime: '10:05 am'),
    Employee(name: 'Daniel Anderson', checkInTime: '10:05 am'),
    Employee(name: 'Anne Hunt', checkInTime: '10:05 am'),
  ];

  int get presentCount => _employees.length;
  int get absentCount => 1;
  List<Employee> get employees => _employees;
}
