import 'package:ecommerce_task/HomePage/categories_section.dart';
import 'package:ecommerce_task/HomePage/featured_products.dart';
import 'package:ecommerce_task/HomePage/new_arrival.dart';
import 'package:ecommerce_task/HomePage/search_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({super.key});
  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // Made constructor const for better performance
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            automaticallyImplyLeading: false,
            expandedHeight: height*0.12,
            floating: false,
            backgroundColor: Colors.transparent,
            flexibleSpace: Container(
              decoration: const BoxDecoration(color: Colors.blue),
              child: const FlexibleSpaceBar(
                centerTitle: true,
                titlePadding: EdgeInsets.symmetric(
                  horizontal: 16,
                  vertical: 16,
                ),
                title: Row(
                  children: [
                    CircleAvatar(
                      radius: 18,
                      backgroundColor: Colors.white10,
                      child: Icon(
                        Icons.location_on_outlined,
                        color: Colors.white,
                      ),
                    ),
                    SizedBox(width: 12),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Deliver to",
                          style: TextStyle(fontSize: 12, color: Colors.white70),
                        ),
                        Text(
                          "New Delhi",
                          style: TextStyle(fontSize: 14, color: Colors.white70),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              Padding(
                padding: const EdgeInsets.only(top: 20),
                child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.notifications_outlined,
                    color: Colors.white,
                    size: 30,
                  ),
                ),
              ),
            ],
          ),
          SliverToBoxAdapter(
            child: Column(
              children: [
                CategoriesSection(),
                SizedBox(height: 6),
                FeaturedProducts(),
                NewArrival(),
              ],
            ),
          ),

          // Category Grid
        ],
      ),
    );
  }
}
