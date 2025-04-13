// lib/view/today_dashboard_screen.dart
import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:dashbordwebapp/viewmode/provider/AttendanceProvider.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';
import 'package:provider/provider.dart';

class TodayDashboardScreen extends StatelessWidget {
  const TodayDashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final attendanceProvider = Provider.of<AttendanceProvider>(context);
    return attendanceProvider.isLoading
        ? Center(child: CircularProgressIndicator())
        : Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Today Dashboard',
                          style: AppTheme.headingStyle.copyWith(fontSize: 24)),
                      const SizedBox(height: 24),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text('Name', style: AppTheme.titleStyle),
                          Text('Check-in Time', style: AppTheme.titleStyle),
                        ],
                      ),
                      const SizedBox(height: 12),
                      Expanded(
                        child: attendanceProvider.records.isEmpty
                            ? Center(child: Text("No attendance records yet"))
                            : ListView.builder(
                                itemCount: attendanceProvider.records.length,
                                itemBuilder: (context, index) {
                                  final record =
                                      attendanceProvider.records[index];
                                  return Padding(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 6.0),
                                    child: Column(
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(record.name ?? '',
                                                style: AppTheme.bodyStyle),
                                            Text(record.timestamp ?? '',
                                                style: AppTheme.bodyStyle),
                                          ],
                                        ),
                                        const SizedBox(height: 2),
                                        Divider(
                                            color: Colors.black12,
                                            thickness: 1),
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
              // Right Panel
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: Container(
                  width: 250,
                  height: 300,
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 181, 249, 248),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text('Today', style: AppTheme.titleStyle),
                        const SizedBox(height: 20),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Present', style: AppTheme.bodyStyle),
                            Text(attendanceProvider.totalPresent.toString(),
                                style: AppTheme.bodyStyle),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Absent', style: AppTheme.bodyStyle),
                            Text(attendanceProvider.totalAbsent.toString(),
                                style: AppTheme.bodyStyle),
                          ],
                        ),
                        const SizedBox(height: 20),
                        PieChart(dataMap: {
                          'Present': attendanceProvider.totalPresent.toDouble(),
                          'Absent': attendanceProvider.totalAbsent.toDouble(),
                        }, chartType: ChartType.ring),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          );
  }
}
