import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:dashbordwebapp/viewmode/provider/EmployeeAttendanceProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class EmplyeeMonthlyScreen extends StatefulWidget {
  final String userId;
  const EmplyeeMonthlyScreen({super.key, required this.userId});

  @override
  State<EmplyeeMonthlyScreen> createState() => _EmplyeeMonthlyScreenState();
}

class _EmplyeeMonthlyScreenState extends State<EmplyeeMonthlyScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final attendanceProvider =
          Provider.of<EmployeeAttendanceProvider>(context);
      attendanceProvider.fetchAttendance(widget.userId);
    });
  }

  @override
  Widget build(BuildContext context) {
    final attendanceProvider =
        Provider.of<EmployeeAttendanceProvider>(context, listen: false);

    return attendanceProvider.isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Header
                Row(
                  children: [
                    Text('Attendance for : ${widget.userId}',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold)),
                  ],
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
                            itemCount:
                                attendanceProvider.attendanceRecords.length,
                            itemBuilder: (context, index) {
                              final record =
                                  attendanceProvider.attendanceRecords[index];
                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Expanded(
                                      child: Text(
                                        record['date'] ?? '--/--/--',
                                        style: AppTheme.labelStyle,
                                      ),
                                    ),
                                    Expanded(
                                      child: Text(
                                        record['status'] ?? 'Absent',
                                        style: AppTheme.bodyStyle.copyWith(
                                          color: record['status'] == 'Present'
                                              ? Colors.green
                                              : Colors.red,
                                        ),
                                      ),
                                    ),
                                    Expanded(
                                        child: Text(record['timestamp'] ?? '--',
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
