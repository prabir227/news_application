import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:news_application/home_screen.dart';

class LoginController extends GetxController{
  final FirebaseAuth inst = FirebaseAuth.instance;
  final emailController = TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool flag = false.obs;
  void login() async{
    flag.value = true;
      try{
        UserCredential userCredential = await inst.signInWithEmailAndPassword(email: emailController.value.text, password: passController.value.text);
          if(userCredential.user != null){
            flag.value=false;
            Get.off(HomeScreen());
          }
      }
      catch(e){
        flag.value=false;
          Get.snackbar("Login failed", "Please try again");

      }

  }
}