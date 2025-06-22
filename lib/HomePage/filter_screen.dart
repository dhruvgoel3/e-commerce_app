import 'package:flutter/material.dart';
import '../models/product_model.dart';

class FilterScreen extends StatelessWidget {
  final List<ProductModel> allProducts;
  final String selectedCategory;

  const FilterScreen({super.key, required this.allProducts, required this.selectedCategory});

  @override
  Widget build(BuildContext context) {
    final filtered = allProducts.where((product) => product.category == selectedCategory).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Filtered by $selectedCategory")),
      body: ListView.builder(
        itemCount: filtered.length,
        itemBuilder: (context, index) {
          final product = filtered[index];
          return ListTile(
            leading: Image.asset(product.image, width: 50),
            title: Text(product.name),
            subtitle: Text(product.category),
            trailing: Text("\$${product.price}"),
          );
        },
      ),
    );
  }
}
