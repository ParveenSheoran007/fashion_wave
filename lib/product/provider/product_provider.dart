import 'package:fashion_wave/product/ui/cart_item.dart';
import 'package:flutter/material.dart';
import 'package:fashion_wave/product/model/product_model.dart';
import 'package:fashion_wave/product/service/product_service.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  List<CartItem> _cart = [];
  bool _isLoading = true;

  List<ProductModel> get products => _products;
  List<CartItem> get cart => _cart;
  bool get isLoading => _isLoading;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      _products = await _productService.fetchProducts();
      print('Products loaded: ${_products.length}');
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      _isLoading = false;
      notifyListeners();
    }
  }

  void incrementCount(ProductModel product) {
    product.clickCount++;
    notifyListeners();
  }

  void addToCart(ProductModel product, int quantity) {
    final existingCartItem = _cart.firstWhere(
          (item) => item.product.id == product.id,
      orElse: () => CartItem(product: product, quantity: 0),
    );

    if (existingCartItem.quantity == 0) {
      _cart.add(CartItem(product: product, quantity: quantity));
    } else {
      existingCartItem.quantity += quantity;
    }

    notifyListeners();
  }
}


