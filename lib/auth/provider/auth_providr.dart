import 'package:flutter/material.dart';
import 'package:fashion_wave/auth/model/auth_model.dart';
import 'package:fashion_wave/auth/service/auth_service.dart';
import 'package:fashion_wave/product/ui/product_screen.dart';

class AuthProvider with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> login(String username, String password, BuildContext context) async {
    _setLoading(true);

    AuthModel user = AuthModel(username: username, password: password);
    AuthService apiService = AuthService();

    var response = await apiService.login(user);

    _setLoading(false);

    if (response != null) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => ProductScreen()),
      );
    } else {
      _showError(context);
    }
  }

  void _setLoading(bool loading) {
    _isLoading = loading;
    notifyListeners();
  }

  void _showError(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Login failed. Please try again.')),
    );
  }
}
