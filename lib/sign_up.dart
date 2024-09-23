import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/login_screen.dart';
import 'package:news_application/reusable_widgets.dart';

class SignupScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>SignupScreenState();

}
class SignupScreenState extends State<SignupScreen>{
  var userController = TextEditingController();
  var passController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableTextField("Enter gmail", Icon(Icons.email_outlined), userController,false),
            reusableTextField("Enter password", Icon(Icons.keyboard_alt_outlined), passController,true),
            ElevatedButton(
              onPressed: () {
              },
              child: Text(
                "REGISTER",
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 21,
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Color(0xff1A6158),
                minimumSize: Size(320, 55),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Already have an account?"),
                TextButton(
                  onPressed: () {
                    Get.back();
                  },
                  child: Text("Log In"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

}