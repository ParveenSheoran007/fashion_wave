import 'package:fashion_wave/product/model/product_model.dart';

class CartItem {
  final ProductModel product;
  int quantity;

  CartItem({required this.product, required this.quantity});
}
