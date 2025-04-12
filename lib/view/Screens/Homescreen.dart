import 'package:dashbordwebapp/view/Screens/Emplyee_monthly_Screen.dart';
import 'package:dashbordwebapp/view/widgets/dashbordselectingbutton.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                      buttontitle: 'Today Dashboard', onTap: () {}),
                  SizedBox(height: 16),
                  DashbordSelectingButton(
                      buttontitle: 'Employees', onTap: () {}),
                  SizedBox(height: 16),
                  DashbordSelectingButton(
                      buttontitle: 'Create employee', onTap: () {}),
                ],
              ),
            ),
          ),
          Expanded(child: EmplyeeMonthlyScreen())
        ],
      ),
    );
  }
}
