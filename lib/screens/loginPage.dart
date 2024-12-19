import 'package:esthelogy_project/models/userModel.dart';
import 'package:esthelogy_project/screens/dashboardPage.dart';
import 'package:esthelogy_project/api/authApi.dart';
import 'package:esthelogy_project/screens/profilePage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Loginpage extends StatefulWidget {
  const Loginpage({super.key});

  @override
  State<Loginpage> createState() => _LoginpageState();
}

class _LoginpageState extends State<Loginpage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController username_contr = new TextEditingController();
    TextEditingController password_contr = new TextEditingController();
    return Scaffold(
        body: Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
          // image: DecorationImage(
          //     image: AssetImage("assets/images/bg_login.jpg"), fit: BoxFit.cover),
          color: Color(0xffFFD47F)),
      child: Container(
        margin: EdgeInsets.fromLTRB(20, 10, 20, 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                alignment: Alignment.center,
                child: Text(
                  'Log In',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 25,
                      fontWeight: FontWeight.w700),
                )),
            SizedBox(
              height: 10,
            ),
            Container(
              padding: EdgeInsets.fromLTRB(10, 2, 2, 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Colors.black, width: 2)),
              child: TextField(
                  controller: username_contr,
                  decoration: InputDecoration(
                      icon: Icon(Icons.email),
                      labelText: 'Email Address',
                      border: InputBorder.none)),
            ),
            SizedBox(height: 20),
            Container(
              padding: EdgeInsets.fromLTRB(10, 2, 2, 2),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(25)),
                  border: Border.all(color: Colors.black, width: 2)),
              child: TextField(
                  controller: password_contr,
                  obscureText: true,
                  decoration: InputDecoration(
                      icon: Icon(Icons.password),
                      labelText: 'Password',
                      border: InputBorder.none)),
            ),
            SizedBox(height: 20),
            FloatingActionButton.extended(
                elevation: 0,
                backgroundColor: Colors.blue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                onPressed: () async {
                  // Navigator.pushNamed(context, '/home');
                  showCupertinoDialog(
                    context: context,
                    builder: (context) {
                      getUsers().then(
                        (value) {
                          for (var element in value) {
                            if (element.username == username_contr.text &&
                                element.email == password_contr.text) {
                              Navigator.pop(context);
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Login Successfull')));
                              Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => ProfilePage(),
                              ));
                              return;
                            }
                          }
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                              const SnackBar(
                                  content: Text('Invalid Credentials')));
                          return;
                        },
                      );
                      return const CupertinoAlertDialog(
                        title: Text('Signing in'),
                        content: CupertinoActivityIndicator(),
                      );
                    },
                  );
                },
                label: Text('Login')),
            SizedBox(
              height: 10,
            ),
            Container(
              child: Text('Forgot Password?'),
              alignment: Alignment.center,
            ),
            SizedBox(height: 20),
            Container(
              child: Text('Register here'),
              alignment: Alignment.center,
            ),
          ],
        ),
      ),
    ));
  }

  Future<List<User>> getUsers() async {
    List<User> users = await AuthApi.getUsers();
    return users;
  }
}
