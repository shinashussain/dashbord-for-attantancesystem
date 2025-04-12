import 'package:dashbordwebapp/utils/AppTheme.dart';
import 'package:dashbordwebapp/view/Screens/Employeesscreen.dart';
import 'package:dashbordwebapp/view/Screens/Today_dashbord_Screen.dart';
import 'package:dashbordwebapp/view/widgets/dashbordselectingbutton.dart';
import 'package:dashbordwebapp/viewmode/provider/Todaydashbordprovider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homescreen extends StatelessWidget {
  const Homescreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<Todaydashbordprovider>(context);

    return Scaffold(
      backgroundColor: Colors.white,
      body: Row(
        children: [
          SizedBox(
            child: Container(
              width: 250,
              color: const Color.fromARGB(255, 243, 243, 243),
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
          Expanded(child: Employeesscreen())
        ],
      ),
    );
  }
}
