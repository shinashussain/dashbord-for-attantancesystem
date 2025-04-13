import 'package:dashbordwebapp/firebase_options.dart';
import 'package:dashbordwebapp/view/Screens/Homescreen.dart';
import 'package:dashbordwebapp/viewmode/provider/Creat_employee_provider.dart';
import 'package:dashbordwebapp/viewmode/provider/Home_pagea_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  try {
    await Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    );
  } catch (e) {
    debugPrint('Firebase initialization error: $e');
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomePageProvider()),
          ChangeNotifierProvider(
            create: (context) => CreateEmployeeProvider(),
          ),
        ],
        child: MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Dashboard Web App',
          theme: ThemeData(
            useMaterial3: true,
            textTheme: const TextTheme(),
          ),
          home: const Homescreen(),
        ));
  }
}
