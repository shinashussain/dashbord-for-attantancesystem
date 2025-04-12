import 'package:flutter/material.dart';

class Employeesscreen extends StatelessWidget {
  const Employeesscreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Employee Dashboard',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16),
          Expanded(
            child: Row(
              children: [
                // Employee List
                Expanded(
                  flex: 1,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[200],
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ListView(
                      children: [
                        ListTile(
                          title: Text('John Doe'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Jane Smith'),
                          onTap: () {},
                          selected: true,
                          selectedTileColor: Colors.blue[50],
                        ),
                        ListTile(
                          title: Text('Mike Johnson'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Sarah Williams'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Robert Brown'),
                          onTap: () {},
                        ),
                        ListTile(
                          title: Text('Emily Davis'),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(width: 16),
                // Employee Details
                Expanded(
                  flex: 2,
                  child: Container(
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
                            CircleAvatar(
                              radius: 30,
                              child: Text(
                                'JS',
                                style: TextStyle(fontSize: 20),
                              ),
                            ),
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
                          onPressed: () {},
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
