import 'package:fashion_wave/auth/model/user_model.dart';
import 'package:fashion_wave/auth/service/user_service.dart';
import 'package:flutter/material.dart';


class UserProvider extends ChangeNotifier {
  final UserService userService = UserService();
  UserModel? userModel;
  bool _isLoggedIn = false;
  bool _isLoading = false;

  UserModel? get user => userModel;
  bool get isLoggedIn => _isLoggedIn;
  bool get isLoading => _isLoading;

  Future<void> register(UserModel user, String email, String password) async {
    _setLoading(true);
    bool success = await userService.register(user, email, password);
    if (success) {
      userModel = user;
      _isLoggedIn = true;
      notifyListeners();
    } else {
      throw Exception('Registration failed');
    }
    _setLoading(false);
  }

  Future<bool> login(UserModel user, String text, BuildContext context) async {
    _setLoading(true);
    bool success = await userService.login(user);
    if (success) {
      userModel = user;
      _isLoggedIn = true;
      notifyListeners();
    }
    _setLoading(false);
    return success;
  }

  void logout() {
    userModel = null;
    _isLoggedIn = false;
    notifyListeners();
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }
}
