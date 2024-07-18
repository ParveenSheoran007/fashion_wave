import 'dart:convert';
import 'package:fashion_wave/auth/model/user_model.dart';
import 'package:http/http.dart' as http;

class UserService {
  final String baseUrl = 'http://localhost:3000/api';

  Future<bool> register(UserModel user, String email, String password) async {
    final url = Uri.parse('$baseUrl/register');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }

  Future<bool> login(UserModel user) async {
    final url = Uri.parse('$baseUrl/login');
    final response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode(user.toMap()),
    );

    if (response.statusCode == 200) {
      return true;
    } else {
      return false;
    }
  }
}
