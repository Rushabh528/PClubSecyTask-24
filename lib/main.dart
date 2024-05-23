import 'package:flutter/material.dart';
import 'package:secytask/navbar/homePage.dart';
import 'package:secytask/navbar/navBar.dart';
import 'package:secytask/navbar/profile/editProfile.dart';
import 'package:secytask/navbar/profile/profile.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Campus Ebay',
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0xff990011)),
          useMaterial3: true,
        ),
        home: navBar());
  }
}
