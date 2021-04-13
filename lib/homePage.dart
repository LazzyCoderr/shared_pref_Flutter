import 'package:flutter/material.dart';
import 'package:flutter_shar_pref/constants.dart';
import 'package:flutter_shar_pref/loginPage.dart';
import 'package:flutter_shar_pref/main.dart';

class HomePage extends StatefulWidget {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Home Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('Welcome ${sharedPref.getString(USER_NAME)}', style: TextStyle(fontSize: 32)),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                /// Here remove all shared preference key
                ///
                sharedPref.remove(USER_NAME);
                sharedPref.remove(USER_EMAIL);
                sharedPref.remove(USER_PASSWORD);
                sharedPref.remove(USER_LOGIN);

                /// clear shared preference
                ///
                sharedPref.clear();

                /// Navigate to login page
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));

                /// close Home page screen
                Navigator.of(context).pop();
              },
              child: Text('logout'),
            ),
          ],
        ),
      ),
    );
  }
}
