import 'dart:ffi';

import 'package:esthelogy_project/components/uploadImage.dart';
import 'package:esthelogy_project/components/uploadIndicator.dart';
import 'package:esthelogy_project/screens/dashboardPage.dart';
import 'package:flutter/material.dart';

final active = ValueNotifier<int>(0);

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Upload Document',
                  style: TextStyle(
                      fontSize: 25,
                      color: Colors.black,
                      fontWeight: FontWeight.bold),
                )),
            SizedBox(
              height: 20,
            ),
            ValueListenableBuilder(
              valueListenable: active,
              builder: (context, value, child) {
                return Container(
                    height: 20,
                    margin: EdgeInsets.all(10),
                    alignment: Alignment.center,
                    child: UploadIndicator(
                      active: value,
                      count: 4,
                    ));
              },
            ),
            SizedBox(
              height: 40,
            ),
            UploadImage(title: 'Profile Picture', image: ''),
            SizedBox(
              height: 20,
            ),
            UploadImage(title: 'Driving License', image: ''),
            SizedBox(
              height: 20,
            ),
            UploadImage(title: 'Certificate', image: ''),
            SizedBox(
              height: 20,
            ),
            UploadImage(title: 'Passport', image: ''),
            SizedBox(
              height: 40,
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: FloatingActionButton.extended(
                onPressed: () {
                  Navigator.pushNamed(context, '/dashboard');
                },
                label: Text('Done'),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
