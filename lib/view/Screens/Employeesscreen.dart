import 'package:dashbordwebapp/Model/Employee.dart';
import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:dashbordwebapp/view/DetaolsOfEmployee.dart';
import 'package:dashbordwebapp/viewmode/Services/FirestoreServices.dart';
import 'package:dashbordwebapp/viewmode/provider/EmployeesProvider.dart';
import 'package:dashbordwebapp/viewmode/provider/Home_pagea_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Employeesscreen extends StatelessWidget {
  Employeesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final employeeProvider = Provider.of<EmployeesProvider>(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Employees',
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  flex: 1,
                  child: StreamBuilder<List<Employee>>(
                    stream: employeeProvider.employeesStream,
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return const Center(child: CircularProgressIndicator());
                      }
                      if (snapshot.hasError) {
                        return const Center(
                            child: Text('Something went wrong'));
                      }

                      final employees = snapshot.data ?? [];

                      if (employees.isEmpty) {
                        return const Center(child: Text('No employees found'));
                      }

                      WidgetsBinding.instance.addPostFrameCallback((_) {
                        if (employeeProvider.employeeList.isEmpty) {
                          employeeProvider.setEmployeeList(employees);
                        }
                      });

                      return ListView.builder(
                        itemCount: employees.length,
                        itemBuilder: (context, index) {
                          final employee = employees[index];
                          return InkWell(
                            onTap: () {
                              employeeProvider.updateIndex(index);
                            },
                            child: Container(
                              height: 40,
                              padding: const EdgeInsets.all(8.0),
                              decoration: BoxDecoration(
                                border: Border.all(color: Colors.black12),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(employee.name,
                                      style: AppTheme.bodyStyle),
                                  Icon(Icons.arrow_forward_ios,
                                      size: 16, color: Colors.grey[600])
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  flex: 1,
                  child: Consumer<EmployeesProvider>(
                    builder: (context, employeeProvider, _) {
                      final selectedEmployee =
                          employeeProvider.selectedEmployee;
                      return selectedEmployee != null
                          ? DetaolsofEmployee(employee: selectedEmployee)
                          : const SizedBox();
                    },
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
