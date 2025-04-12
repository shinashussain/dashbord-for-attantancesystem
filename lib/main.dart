import 'package:dashbordwebapp/view/Screens/Homescreen.dart';
import 'package:dashbordwebapp/viewmode/provider/Home_pagea_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (context) => HomePageProvider(),
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
