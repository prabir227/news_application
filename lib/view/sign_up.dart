import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:news_application/controllers/signup_controller.dart';
import 'package:news_application/utility/reusable_widgets.dart';

class SignupScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>SignupScreenState();

}
class SignupScreenState extends State<SignupScreen>{
  SignUpController signUpController = Get.put(SignUpController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            reusableTextField("Enter gmail", Icon(Icons.email_outlined), signUpController.emailController.value,false),
            SizedBox(height: 30,),
            reusableTextField("Enter password", Icon(Icons.keyboard_alt_outlined), signUpController.passController.value,true),
            SizedBox(height: 30,),
            Obx((){
              return  Container(
                child: signUpController.flag.value?CircularProgressIndicator():ElevatedButton(
                  onPressed: () {
                    signUpController.signUp();
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
              );}
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