import 'package:api_practice_02/api/login_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'api_service.dart';

class LoginController extends GetxController{
  var authStatus = false.obs;
  var isLoading = false.obs;

  Future<void> auth(String username, String password) async {
    isLoading.value = true;
    var auth = await ApiService().loginAuth(username, password);
    if(auth.status == true){
      isLoading.value = false;
      authStatus.value = true;
    }
    else if(auth.status == false){
      isLoading.value = false;
      authStatus.value = false;
    }
    else {
      isLoading.value = false;
      print("Error while logging in occurred");
    }
  }

  Future<void> register(String username, String password, String fullname, String email) async{
    var auth = await ApiService().registerUser(username, password, fullname, email);
    if(auth.status == true){
      isLoading.value = false;
      authStatus.value = true;
    }
    else if(auth.status == false){
      isLoading.value = false;
      authStatus.value = false;
    }
    else {
      isLoading.value = false;
      print("Error while registering occurred");
    }
  }
}