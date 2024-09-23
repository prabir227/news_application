import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_application/controllers/login_controller.dart';
import 'package:news_application/reusable_widgets.dart';
import 'package:get/get.dart';
import 'package:news_application/sign_up.dart';

class LoginScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() =>LoginScreenState();

}
class LoginScreenState extends State<LoginScreen>{
  LoginController loginController = Get.put(LoginController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
            children: [
              reusableTextField("Enter gmail", Icon(Icons.email_outlined), loginController.emailController.value,false),
              reusableTextField("Enter password", Icon(Icons.keyboard_alt_outlined),loginController.passController.value,true),
              Obx((){
                return Container(
                  child: loginController.flag.value?CircularProgressIndicator():ElevatedButton(
                    onPressed: () {
                      loginController.login();
                    },
                    child: Text(
                      "LOGIN",
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
                  Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Get.to(SignupScreen());
                    },
                    child: Text("Sign Up"),
                  ),
                ],
              ),
            ],
        ),
      ),
    );
  }

}