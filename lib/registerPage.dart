import 'package:flutter/material.dart';
import 'package:flutter_shar_pref/constants.dart';
import 'package:flutter_shar_pref/homePage.dart';
import 'package:flutter_shar_pref/loginPage.dart';
import 'package:flutter_shar_pref/main.dart';

class RegisterPage extends StatefulWidget {
  @override
  RegisterPageState createState() => RegisterPageState();
}

class RegisterPageState extends State<RegisterPage> {
  GlobalKey<FormState> _form = GlobalKey<FormState>();

  TextEditingController emailController = TextEditingController();
  TextEditingController passController = TextEditingController();
  TextEditingController nameController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text('Register Screen'),
      ),
      body: Form(
        key: _form,
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Register', style: TextStyle(fontSize: 32)),
                TextFormField(
                  controller: nameController,
                  decoration: InputDecoration(labelText: 'Username'),
                  keyboardType: TextInputType.name,
                  validator: (val) {
                    if (val!.isEmpty) {
                      return 'Field must required';
                    }
                    return null;
                  },
                ),
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
                      /// Check form validation
                      if (_form.currentState!.validate()) {
                        /// Store user data in shared preference
                        ///
                        sharedPref.setString(USER_NAME, nameController.text.trim());
                        sharedPref.setString(USER_EMAIL, emailController.text.trim());
                        sharedPref.setString(USER_PASSWORD, passController.text.trim());
                        sharedPref.setBool(USER_LOGIN, true);

                        /// Clear text form field
                        ///
                        nameController.clear();
                        emailController.clear();
                        passController.clear();

                        /// Navigate to home page
                        Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomePage()));

                        /// close register page screen
                        Navigator.of(context).pop();
                      }
                    },
                    child: Text('Register'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 16),
                  child: InkWell(
                    onTap: () {
                      Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage()));
                    },
                    child: Text('Already have an account? Sign in..!'),
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
