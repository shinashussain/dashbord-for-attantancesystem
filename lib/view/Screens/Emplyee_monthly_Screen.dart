import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:flutter/material.dart';

class EmplyeeMonthlyScreen extends StatelessWidget {
  const EmplyeeMonthlyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Header
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // Handle back navigation
                },
                child: Text(
                  '< Back to Employees',
                  style: TextStyle(color: Colors.blue),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Text(
            'John Doe - Attendance',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          // Attendance Table
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey[300]!),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Column(
                children: [
                  // Table Header
                  Container(
                    color: Colors.grey[200],
                    padding: const EdgeInsets.symmetric(
                        vertical: 8.0, horizontal: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: const [
                        Expanded(child: Text('Date')),
                        Expanded(child: Text('Status')),
                        Expanded(child: Text('Time')),
                      ],
                    ),
                  ),
                  const Divider(height: 1, color: Colors.grey),
                  // Table Rows
                  Expanded(
                    child: ListView.builder(
                      itemCount: 15,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Expanded(
                                child: Text(
                                  '2023-10-${index + 1}',
                                  style: AppTheme.labelStyle,
                                ),
                              ),
                              Expanded(
                                child: Text(
                                  'Present',
                                  style: AppTheme.bodyStyle.copyWith(
                                    color: Colors.green,
                                  ),
                                ),
                              ),
                              Expanded(
                                  child: Text('9:00 AM',
                                      style: AppTheme.labelStyle)),
                            ],
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
