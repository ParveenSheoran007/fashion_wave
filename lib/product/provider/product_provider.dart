import 'package:flutter/material.dart';
import 'package:fashion_wave/product/model/product_model.dart';
import 'package:fashion_wave/product/service/product_service.dart';
import 'package:fashion_wave/product/ui/cart_item.dart';

class ProductProvider with ChangeNotifier {
  final ProductService _productService = ProductService();

  List<ProductModel> _products = [];
  List<CartItem> _cartItems = [];
  List<ProductModel> _favoriteProducts = [];
  bool _isLoading = true;

  List<ProductModel> get products => _products;
  List<CartItem> get cartItems => _cartItems;
  List<ProductModel> get favoriteProducts => _favoriteProducts;
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

  void addToCart(ProductModel product, int quantity) {
    _cartItems.add(CartItem(product: product, quantity: quantity, onDelete: () {  },));
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    _cartItems.remove(cartItem);
    notifyListeners();
  }

  void incrementCount(ProductModel product) {
    product.clickCount++;
    notifyListeners();
  }

  double get totalPrice {
    return _cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void clearCart() {
    _cartItems.clear();
    notifyListeners();
  }

  void addFavorite(ProductModel product) {
    if (!_favoriteProducts.contains(product)) {
      _favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(ProductModel product) {
    _favoriteProducts.remove(product);
    notifyListeners();
  }

  bool isFavorite(ProductModel product) {
    return _favoriteProducts.contains(product);
  }
}
