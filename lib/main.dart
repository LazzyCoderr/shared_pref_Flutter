import 'package:flutter/material.dart';
import 'package:flutter_shar_pref/constants.dart';
import 'package:flutter_shar_pref/homePage.dart';
import 'package:flutter_shar_pref/loginPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// make sharedPreference class object
late SharedPreferences sharedPref;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  /// initialization  shared preferences
  ///
  sharedPref = await SharedPreferences.getInstance();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Shared Preference Flutter',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: checkUserLogin(),
    );
  }

  Widget checkUserLogin() {
    /// check user is login or not ?
    ///
    /// initially user is not login
    /// we set default value as false (user not login)
    if (sharedPref.getBool(USER_LOGIN) ?? false) {
      return HomePage();
    } else {
      return LoginPage();
    }
  }
}
