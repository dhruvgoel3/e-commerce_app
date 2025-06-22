import 'package:get/get.dart';

import '../models/product_model.dart'; // use ProductModel

class CartController extends GetxController {
  var cartItems = <ProductModel>[].obs;

  void addToCart(ProductModel product) {
    cartItems.add(product);
  }

  void removeFromCart(ProductModel product) {
    cartItems.remove(product);
  }

  void clearCart() {
    cartItems.clear();
  }
}
