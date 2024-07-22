import 'package:flutter/material.dart';
import 'package:fashion_wave/product/model/product_model.dart';
import 'package:fashion_wave/product/service/product_service.dart';
import 'package:fashion_wave/product/ui/cart_item.dart';

class ProductProvider with ChangeNotifier {
  final ProductService productService = ProductService();

  List<ProductModel> products = [];
  List<CartItem> cartItems = [];
  List<ProductModel> favoriteProducts = [];
  bool isLoading = true;

  List<ProductModel> get productss => products;
  List<CartItem> get cartItemss => cartItems;
  List<ProductModel> get favoriteProductss => favoriteProducts;
  bool get isLoadings => isLoading;

  ProductProvider() {
    fetchProducts();
  }

  Future<void> fetchProducts() async {
    try {
      products = await productService.fetchProducts();
      print('Products loaded: ${products.length}');
    } catch (e) {
      print('Error fetching products: $e');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void addToCart(ProductModel product, int quantity) {
    cartItems.add(CartItem(product: product, quantity: quantity, onDelete: () {  },));
    notifyListeners();
  }

  void removeFromCart(CartItem cartItem) {
    cartItems.remove(cartItem);
    notifyListeners();
  }

  void incrementCount(ProductModel product) {
    product.clickCount++;
    notifyListeners();
  }

  double get totalPrice {
    return cartItems.fold(0, (sum, item) => sum + (item.product.price * item.quantity));
  }

  void clearCart() {
    cartItems.clear();
    notifyListeners();
  }

  void addFavorite(ProductModel product) {
    if (!favoriteProducts.contains(product)) {
      favoriteProducts.add(product);
      notifyListeners();
    }
  }

  void removeFavorite(ProductModel product) {
    favoriteProducts.remove(product);
    notifyListeners();
  }

  bool isFavorite(ProductModel product) {
    return favoriteProducts.contains(product);
  }
}
