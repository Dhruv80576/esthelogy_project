import 'package:esthelogy_project/bloc/profileBloc/profile_bloc_bloc.dart';
import 'package:esthelogy_project/screens/dashboardPage.dart';
import 'package:esthelogy_project/screens/loginPage.dart';
import 'package:esthelogy_project/screens/profilePage.dart';
import 'package:esthelogy_project/utils/imagePick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(MultiBlocProvider(
    providers: [
      BlocProvider(create: (_)=>ProfileBlocBloc(ImagePick())),
    ],
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => const Loginpage(),
        '/login': (context) => const Loginpage(),
        '/dashboard': (context) => const Dashboardpage(),
        '/profile': (context) => const ProfilePage(),
      },
    ),
  ));
}
