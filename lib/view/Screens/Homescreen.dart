import 'package:dashbordwebapp/view/Screens/Creat_Employee_screen.dart';
import 'package:dashbordwebapp/view/Screens/Employeesscreen.dart';
import 'package:dashbordwebapp/view/Screens/Emplyee_monthly_Screen.dart';
import 'package:dashbordwebapp/view/Screens/Today_dashbord_Screen.dart';
import 'package:dashbordwebapp/view/widgets/dashbordselectingbutton.dart';
import 'package:dashbordwebapp/viewmode/provider/Home_pagea_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<HomePageProvider>(context);
    return Scaffold(
      backgroundColor: const Color.fromARGB(31, 161, 161, 161),
      body: Row(
        children: [
          SizedBox(
            child: Container(
              width: 250,
              color: const Color.fromARGB(184, 155, 155, 155),
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  DashbordSelectingButton(
                      buttontitle: 'Today Dashboard',
                      onTap: () {
                        provider.changeIndex(0);
                      }),
                  SizedBox(height: 16),
                  DashbordSelectingButton(
                      buttontitle: 'Employees',
                      onTap: () {
                        provider.changeIndex(1);
                      }),
                  SizedBox(height: 16),
                  DashbordSelectingButton(
                      buttontitle: 'Create employee',
                      onTap: () {
                        provider.changeIndex(2);
                      }),
                  SizedBox(height: 16),
                ],
              ),
            ),
          ),
          Expanded(
            child: Container(
              color: Colors.white,
              child: IndexedStack(
                index: provider.currentIndex,
                children: [
                  const TodayDashboardScreen(),
                  const Employeesscreen(),
                  CreatEmployeeScreen(),
                  const EmplyeeMonthlyScreen(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
