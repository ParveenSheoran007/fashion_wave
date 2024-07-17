import 'package:fashion_wave/auth/service/user_service.dart';
import 'package:flutter/material.dart';
import 'package:fashion_wave/auth/model/user_model.dart';

class AuthProvider with ChangeNotifier {
  final ApiService apiService = ApiService();
  bool _isAuthenticated = false;
  String? tokens;

  bool get isAuthenticated => _isAuthenticated;
  String? get token => tokens;

  Future<void> login(UserModel user) async {
    var response = await apiService.login(user);
    if (response != null && response['token'] != null) {
      tokens = response['token'];
      _isAuthenticated = true;
      notifyListeners();
    } else {
      _isAuthenticated = false;
      tokens = null;
      notifyListeners();
    }
  }

  Future<void> register(UserModel user) async {
    var response = await apiService.register(user);
    if (response != null && response['token'] != null) {
      tokens = response['token'];
      _isAuthenticated = true;
      notifyListeners();
    } else {
      _isAuthenticated = false;
      tokens = null;
      notifyListeners();
    }
  }

  void logout() {
    _isAuthenticated = false;
    tokens = null;
    notifyListeners();
  }
}
