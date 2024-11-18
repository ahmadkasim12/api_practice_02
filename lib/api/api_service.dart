import 'dart:convert';
import 'package:api_practice_02/api/login_model.dart';
import 'package:api_practice_02/api/register_model.dart';
import 'package:http/http.dart' as http;

class ApiService {
  final String baseUrl = 'https://mediadwi.com/api';

  Future<LoginModel> loginAuth (String username, String password) async {
    final response = await http.post(
      Uri.parse('$baseUrl/latihan/login'),
      headers: {
        'Content-Type': 'application/x-www-form-urlencoded',
      },
      body: {
        "username" : username,
        "password" : password
      }
    );
    final data = json.decode(response.body);

    if (data['status'] == true){
      return LoginModel.fromJson(data);
    }
    else {
      return LoginModel(
        status: data['status'],
        message: data['message'],
        token: "Error"
      );
    }
  }

  Future<RegisterModel> registerUser (String username, String password, String fullname, String email) async {
    final response = await http.post(
        Uri.parse('$baseUrl/latihan/register-user'),
        headers: {
          'Content-Type': 'application/x-www-form-urlencoded',
        },
        body: {
          "username" : username,
          "password" : password,
          "full_name" : fullname,
          "email" : email
        }
    );
    final data = json.decode(response.body);
    return RegisterModel.fromJson(data);
  }
}