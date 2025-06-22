import 'package:ecommerce_task/models/cart_product_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../HomePage/search_screen.dart';
import '../HomePage/filter_screen.dart';
import '../ProductDetails/product_details.dart';
import '../controllers/cart_controller.dart';
import '../models/product_model.dart';

class FeaturedProducts extends StatelessWidget {
  FeaturedProducts({super.key});
  final CartController cartController = Get.put(CartController());
  final List<ProductModel> products = [
    ProductModel(
      name: "Black t-shirt",
      image: "assets/black t-shirt.png",
      category: "T-Shirts",
      price: 299,
    ),
    ProductModel(
      name: "Red t-shirt",
      image: "assets/red t-shirt.png",
      category: "T-Shirts",
      price: 299,
    ),
    ProductModel(
      name: "Formal Trouser",
      image: "assets/grey cotton pant 2.png",
      category: "Trousers",
      price: 299,
    ),
    ProductModel(
      name: "Blue Trouser",
      image: "assets/cotton pant 1.png",
      category: "Trousers",
      price: 299,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final searchController = TextEditingController();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.all(16),
          child: Container(
            height: 50,
            padding: EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 20,
                  offset: Offset(0, 5),
                ),
              ],
            ),
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: searchController,
                    textInputAction: TextInputAction.search,
                    onSubmitted: (value) {
                      Get.to(
                        () => SearchScreen(query: value, allProducts: products),
                      );
                    },
                    decoration: InputDecoration(
                      hintText: 'Search Products...',
                      prefixIcon: Icon(Icons.search, color: Colors.black),
                      border: InputBorder.none,
                      hintStyle: TextStyle(color: Colors.black, fontSize: 16),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    _showFilterDialog(context);
                  },
                  child: Icon(Icons.tune, color: Colors.black),
                ),
              ],
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Featured",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              TextButton(
                onPressed: () {
                  Get.to(() => ProductDetails());
                }, // You can navigate to View All screen here
                child: Text(
                  "View All",
                  style: TextStyle(color: Colors.blue, fontSize: 15),
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 300,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: products.length,
            itemBuilder: (_, index) {
              final product = products[index];
              return InkWell(
                onTap: () {
                  Get.to(() => ProductDetails());
                },
                child: Container(
                  width: 200,
                  margin: EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        blurRadius: 20,
                        offset: Offset(0, 5),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.vertical(
                                top: Radius.circular(16),
                              ),
                            ),
                            child: Center(
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Image.asset(
                                  product.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 12,
                            right: 12,
                            child: Container(
                              padding: EdgeInsets.all(8),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                shape: BoxShape.circle,
                              ),
                              child: Icon(
                                Icons.favorite_border,
                                color: Colors.red,
                                size: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.all(12),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              product.name,
                              style: TextStyle(
                                fontWeight: FontWeight.w800,
                                fontSize: 16,
                                color: Colors.black,
                              ),
                            ),
                            SizedBox(height: 4),
                            Text(
                              "Category",
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey,
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "\$${product.price}",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 18,
                                    color: Colors.blue,
                                  ),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(8),
                                    color: Colors.blue,
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      cartController.addToCart(product); //
                                      Get.snackbar(
                                        "Added",
                                        "${product.name} added to cart",
                                      );
                                    },
                                    icon: Icon(Icons.shopping_cart),
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  void _showFilterDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return Wrap(
          children: [
            ListTile(
              title: Text("T-Shirts"),
              onTap: () {
                Get.to(
                  () => FilterScreen(
                    allProducts: products,
                    selectedCategory: "T-Shirts",
                  ),
                );
              },
            ),
            ListTile(
              title: Text("Trousers"),
              onTap: () {
                Get.to(
                  () => FilterScreen(
                    allProducts: products,
                    selectedCategory: "Trousers",
                  ),
                );
              },
            ),
          ],
        );
      },
    );
  }
}
