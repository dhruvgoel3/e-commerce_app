import 'package:flutter/material.dart';
import '../models/product_model.dart';

class SearchScreen extends StatelessWidget {
  final String query;
  final List<ProductModel> allProducts;

  const SearchScreen({super.key, required this.query, required this.allProducts});

  @override
  Widget build(BuildContext context) {
    final results = allProducts.where((product) =>
        product.name.toLowerCase().contains(query.toLowerCase())).toList();

    return Scaffold(
      appBar: AppBar(title: Text("Search Results")),
      body: results.isEmpty
          ? Center(child: Text("No products found."))
          : ListView.builder(
        itemCount: results.length,
        itemBuilder: (context, index) {
          final product = results[index];
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
