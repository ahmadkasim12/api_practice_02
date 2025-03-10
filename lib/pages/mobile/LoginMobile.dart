import 'dart:ffi';
import 'dart:math';

import 'package:api_practice_02/api/api_service.dart';
import 'package:api_practice_02/api/login_controller.dart';
import 'package:api_practice_02/widgets/MyTextButton.dart';
import 'package:api_practice_02/widgets/MyTextField.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginMobile extends StatelessWidget {
  const LoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    final LoginController loginController = LoginController();
    var username = TextEditingController().obs;
    var password = TextEditingController().obs;
    var errorHandler = false.obs;


    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(30),
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Login", style: TextStyle(fontWeight: FontWeight.w900, fontSize: 24, color: Colors.white)),
              SizedBox(height: 10,),
              Text("To make use of our service, first thing that we asked you to login with your account first!", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white60)),
              SizedBox(height: 30,),
              MyTextField(hasLabel: true, controller: username.value, label: "Email",),
              SizedBox(height: 10,),
              MyTextField(hasLabel: true, controller: password.value, label: "Password",),
              Obx(() {
                return Column(
                  children: [
                    errorHandler.value ? SizedBox(height: 10,) : SizedBox(),
                    errorHandler.value ? Row(
                      children: [
                        Icon(Icons.info_outline, color: Colors.redAccent,),
                        Text(" Username or password are incorrect!", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.redAccent)),
                      ],
                    ) : SizedBox()
                  ],
                );
              }),
              SizedBox(height: 30,),
              Row(
                children: [
                  Text("Don't have an account? ", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white60)),
                  InkWell(
                    onTap: () {
                      Get.toNamed('/registrar');
                      loginController.authStatus.value = false;
                      loginController.isLoading.value = false;
                    },
                    child: Text("Create one here", style: TextStyle(fontWeight: FontWeight.w500, color: Colors.white))
                  ),
                ],
              ),
              SizedBox(height: 10,),
              Obx(() {
                return SizedBox(
                    width: double.infinity,
                    height: 44,
                    child: MyTextButton(
                      isLoading: loginController.isLoading.value,
                      text: "Login",
                      onTap: () async {
                        errorHandler.value = false;
                        await loginController.auth(username.value.text, password.value.text);
                        if(loginController.authStatus.value == true){
                          print("Login successful");
                          Get.toNamed('/registrar');
                        }
                        else if(loginController.authStatus.value == false){
                          errorHandler.value = true;
                          print("Login attempt incorrect");
                        }
                        else{
                          print("Error while attempting to login");
                        }
                      },)
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
