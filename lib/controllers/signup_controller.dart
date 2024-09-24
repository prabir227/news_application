import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{
  final FirebaseAuth inst = FirebaseAuth.instance;
  final emailController= TextEditingController().obs;
  final passController = TextEditingController().obs;
  RxBool flag = false.obs;
  void signUp() async{
    flag.value =true;
    try {
      UserCredential userCredential = await inst.createUserWithEmailAndPassword(
          email: emailController.value.text,
          password: passController.value.text);
      if(userCredential.user != null){
        flag.value=false;
        Get.snackbar("User created successfully", "Go to the login page to proceed further");
      }
    }
    catch(e){
      flag.value=false;
      Get.snackbar("User creation unsuccessful!!!", "Please try again");
    }
  }
}