import 'package:dashbordwebapp/Model/Employee.dart';
import 'package:dashbordwebapp/viewmode/provider/Home_pagea_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DetaolsofEmployee extends StatelessWidget {
  Employee employee;
  DetaolsofEmployee({super.key, required this.employee});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
    return Expanded(
      flex: 1,
      child: Container(
        height: 300,
        width: 250,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                const SizedBox(width: 16),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      employee.name,
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Employee ID: ${employee.empId}',
                      style: TextStyle(color: Colors.grey[600]),
                    ),
                  ],
                ),
              ],
            ),
            const SizedBox(height: 16),
            Text('Phone: ${employee.phone}'),
            const SizedBox(height: 8),
            Text('Email: ${employee.email}'),
            const SizedBox(height: 8),
            Text('Department: ${employee.department}'),
            const SizedBox(height: 8),
            Text('Position: ${employee.department}'),
            const SizedBox(height: 16),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue, // Blue color
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0), // Square button
                ),
              ),
              onPressed: () {
                provider.changeIndex(3);
                provider.setUserId(employee.uid);
              },
              child: Text('Show Attendance'),
            ),
          ],
        ),
      ),
    );
  }
}
