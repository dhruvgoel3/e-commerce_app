import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../checkout/checkout_screen.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart'; //

class CartScreen extends StatelessWidget {
  final CartController cartController = Get.find<CartController>(); //

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Cart")),
      body: Obx(
        () => cartController.cartItems.isEmpty
            ? Center(
                child: Text(
                  "Your cart is empty",
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 14,
                    color: Colors.grey,
                  ),
                ),
              )
            : ListView.builder(
                itemCount: cartController.cartItems.length,
                itemBuilder: (_, index) {
                  final ProductModel item = cartController.cartItems[index];
                  return Card(
                    margin: EdgeInsets.all(10),
                    child: ListTile(
                      leading: Image.asset(item.image, width: 60),
                      title: Text(item.name),
                      subtitle: Text("\$${item.price}"),
                      trailing: IconButton(
                        icon: Icon(Icons.delete, color: Colors.red),
                        onPressed: () => cartController.removeFromCart(item),
                      ),
                    ),
                  );
                },
              ),
      ),
      bottomNavigationBar: Obx(() {
        double total = cartController.cartItems.fold(
          0,
          (sum, item) => sum + item.price,
        );
        return Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                "Total: \$${total.toStringAsFixed(2)}",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              ElevatedButton(
                onPressed: () {
                  Get.to(() => CheckoutScreen()); // Navigate to checkout screen
                },
                child: Text(
                  "Checkout",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                    color: Colors.white,
                  ),
                ),
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 48),
                  backgroundColor: Colors.blue,
                ),
              ),
            ],
          ),
        );
      }),
    );
  }
}
