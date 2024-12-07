import 'package:esthelogy_project/components/uploadImage.dart';
import 'package:esthelogy_project/components/uploadIndicator.dart';
import 'package:esthelogy_project/screens/dashboardPage.dart';
import 'package:flutter/material.dart';

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
            SizedBox(height: 30,),
            Text('Upload Document'),
            SizedBox(height: 20,),
            Container(alignment:Alignment.center,child: UploadIndicator(3)),
            SizedBox(height: 40,),
            UploadImage(title: 'Profile Picture', image: ''),
            SizedBox(height: 20,),
            UploadImage(title: 'Driving License', image: ''),
            SizedBox(height: 20,),
            UploadImage(title: 'Certificate', image: ''),
            SizedBox(height: 20,),
            UploadImage(title: 'Passport', image: ''),
            SizedBox(height: 40,),
            FloatingActionButton.extended(onPressed: () {
              Navigator.pushNamed(context, '/dashboard');
            }, label: Text('Done'),shape:RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20),
            ),)

          ],
        ),
      ),
    );
  }
}