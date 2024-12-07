import 'package:esthelogy_project/screens/dashboardPage.dart';
import 'package:esthelogy_project/screens/loginPage.dart';
import 'package:esthelogy_project/screens/profilePage.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: '/',
    routes: {
      '/':(context) => const Loginpage(),
      '/login': (context) => const Loginpage(),
      '/dashboard': (context) => const Dashboardpage(),
      '/profile': (context) => const ProfilePage(),
    },
  ));
}
