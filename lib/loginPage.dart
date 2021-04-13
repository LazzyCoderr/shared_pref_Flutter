import 'package:flutter/material.dart';
import 'package:flutter_shar_pref/constants.dart';
import 'package:flutter_shar_pref/homePage.dart';
import 'package:flutter_shar_pref/main.dart';
import 'package:flutter_shar_pref/registerPage.dart';

class LoginPage extends StatefulWidget {
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Login Screen'),
      ),
      body: Form(
        key: _form,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Login', style: TextStyle(fontSize: 32)),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(labelText: 'Email'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Field must required';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: passController,
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(labelText: 'Password'),
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Field must required';
                    }
                    return null;
                  },
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_form.currentState!.validate()) {
                        if (emailController.text.trim() == sharedPref.getString(USER_EMAIL) && passController.text.trim() == sharedPref.getString(USER_PASSWORD)) {
                          /// Clear text form field
                          ///
                          emailController.clear();
                          passController.clear();

                          /// Check user is exists and set user_login to true and goto homepage
                          ///
                          sharedPref.setBool(USER_LOGIN, true);

                          /// Navigate to home page
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

                          /// close login page screen
                          Navigator.of(context).pop();
                        }
                      }
                    },
                    child: Text('login'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => RegisterPage()));
                    },
                    child: Text('Don\'t have an account? Sign Up..!'),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
