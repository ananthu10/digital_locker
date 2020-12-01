import 'package:flutter/material.dart';
import './rounded_button.dart';
import './rounded_input_field.dart';
import './rounded_password_field.dart';
import './constants.dart';
import './social_icon.dart';
 

class SignUp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(backgroundColor: Colors.deepOrange[100],
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Text(
                  "SIGN UP\n\n\n",
                  style: TextStyle(fontWeight: FontWeight.w900,fontSize :30 ),
                ),
                RoundedInputField(
                  hintText: " Email",
                  onChanged: (value) {},
                ),
                RoundedPasswordField(
                  onChanged: (value) {},
                ),
                RoundedButton(
                  text: "SIGN UP",
                   textColor: Colors.black,
                  press: () {},
                ),
                
              ],
            ),
          ),
        ),
      ),
    );
  }
}
