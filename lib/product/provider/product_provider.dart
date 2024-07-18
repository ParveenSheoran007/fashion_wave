import 'package:flutter/material.dart';
import 'package:fashion_wave/product/model/product_model.dart';
import 'package:fashion_wave/product/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  List<ProductModel> pModel = [];
  bool _isLoading = false;
  String _errorMessage = '';

  List<ProductModel> get products => pModel;
  bool get isLoading => _isLoading;
  String get errorMessage => _errorMessage;

  Future<void> fetchProducts() async {
    _isLoading = true;
    notifyListeners();
    try {
      pModel = await ProductService.fetchProducts();
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> fetchProduct(String productId) async {
    _isLoading = true;
    notifyListeners();
    try {
      ProductModel product = await ProductService.fetchProduct(productId);
      int index = pModel.indexWhere((p) => p.id == productId);
      if (index != -1) {
        pModel[index] = product;
      } else {
        pModel.add(product);
      }
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> addProduct(ProductModel productModel) async {
    _isLoading = true;
    notifyListeners();
    try {
      String response = await ProductService.addProduct(productModel);
      pModel.add(productModel);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> updateProduct(String productId, ProductModel productModel) async {
    _isLoading = true;
    notifyListeners();
    try {
      String response = await ProductService.updateProduct(productId, productModel);
      int index = pModel.indexWhere((p) => p.id == productId);
      if (index != -1) {
        pModel[index] = productModel;
      }
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  Future<void> deleteProduct(String productId) async {
    _isLoading = true;
    notifyListeners();
    try {
      await ProductService.deleteProduct(productId);
      pModel.removeWhere((p) => p.id == productId);
      _errorMessage = '';
    } catch (e) {
      _errorMessage = e.toString();
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }
}
