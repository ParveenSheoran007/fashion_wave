import 'package:fashion_wave/auth/service/user_service.dart';
import 'package:fashion_wave/product/ui/product_screen.dart';
import 'package:flutter/material.dart';
import 'package:fashion_wave/auth/model/user_model.dart';

class UserProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password, BuildContext context) async {
    _isLoading = true;
    notifyListeners();

    UserModel user = UserModel(username: username, password: password);
    UserService apiService = UserService();

    var response = await apiService.login(user);

    _isLoading = false;
    notifyListeners();

    if (response != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    } else {
      // Show error message
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Login failed. Please try again.')),
      );
    }
  }
}
