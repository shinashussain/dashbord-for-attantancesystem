import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:dashbordwebapp/viewmode/provider/Home_pagea_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Employeesscreen extends StatelessWidget {
  const Employeesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
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
            child: Align(
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
                  child: ListView.builder(
                    itemCount: 10,
                    itemBuilder: (context, index) {
                      return Container(
                          height: 40,
                          padding: const EdgeInsets.all(8.0),
                          decoration: BoxDecoration(
                            border: Border(
                              top: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1.0,
                              ),
                              left: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1.0,
                              ),
                              right: BorderSide(
                                color: Colors.grey[300]!,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Employee ${index + 1}',
                                style: AppTheme.bodyStyle,
                              ),
                              Icon(Icons.arrow_forward_ios,
                                  size: 16, color: Colors.grey[600])
                            ],
                          ));
                    },
                  ),
                ),
                const SizedBox(width: 16),
                // Employee Details
                Expanded(
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
                                  'Jane Smith',
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  'Employee ID: EMP10023',
                                  style: TextStyle(color: Colors.grey[600]),
                                ),
                              ],
                            ),
                          ],
                        ),
                        const SizedBox(height: 16),
                        Text('Phone: (555) 123-4567'),
                        const SizedBox(height: 8),
                        Text('Email: jane.smith@logixe.com'),
                        const SizedBox(height: 8),
                        Text('Department: Human Resources'),
                        const SizedBox(height: 8),
                        Text('Position: HR Manager'),
                        const SizedBox(height: 16),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue, // Blue color
                            shape: RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.circular(0), // Square button
                            ),
                          ),
                          onPressed: () {
                            provider.changeIndex(3);
                          },
                          child: Text('Show Attendance'),
                        ),
                      ],
                    ),
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
