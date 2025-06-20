import 'package:ecommerce_task/HomePage/home_screeen.dart';
import 'package:ecommerce_task/ProductDetails/details_body.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ProductDetails extends StatefulWidget {
  const ProductDetails({super.key});

  @override
  State<ProductDetails> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProductDetails> {
  int _selectImageIndex = 0;

  // int _selectedColor = 0;
  // bool _favourite = false;

  final PageController _pageController = PageController();

  final List<String> detailImages = [
    "assets/black t-shirt.png", // <-- Use underscore instead of spaces
    "assets/red t-shirt.png",
    "assets/cotton pant 1.png",
    "assets/grey cotton pant 2.png",
  ];

  //
  // Widget _buildFeature(IconData icon, String text) {
  //   return Container(
  //     padding: EdgeInsets.all(12),
  //     decoration: BoxDecoration(
  //       color: Colors.blue.withOpacity(0.1),
  //       shape: BoxShape.circle,
  //     ),
  //     child: Icon(icon, color: Colors.blue),
  //   );
  //
  //   SizedBox(height: 8);
  //   Text(
  //     text,
  //     style: TextStyle(fontSize: 12, color: Colors.black),
  //     textAlign: TextAlign.center,
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          CustomScrollView(
            slivers: [
              SliverAppBar(
                expandedHeight: 0,
                floating: true,
                pinned: true,
                backgroundColor: Colors.white,
                elevation: 0,
                leading: IconButton(
                  onPressed: () {
                    Get.back(result: () => HomeScreen());
                  },
                  icon: Icon(Icons.arrow_back, color: Colors.black),
                ),
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.share_outlined, color: Colors.black),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(Icons.favorite, color: Colors.red),
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: PageView.builder(
                        controller: _pageController,
                        onPageChanged: (index) {
                          setState(() {
                            _selectImageIndex = index;
                          });
                        },
                        itemCount: detailImages.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                              color: Colors.blue.withOpacity(0.1),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Center(
                              child: Padding(
                                padding: EdgeInsets.all(20),
                                child: Image.asset(
                                  detailImages[index],
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        },
                      ),
                    ),
                    Positioned(
                      bottom: 32,
                      left: 0,
                      right: 0,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: List.generate(
                          detailImages.length,
                          (index) => Container(
                            width: 8,
                            height: 8,
                            margin: EdgeInsets.symmetric(horizontal: 4),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: _selectImageIndex == index
                                  ? Colors.blue
                                  : Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ),
                    DetailsBody(),
                  ],
                ),
              ),
            ],
          ),
        ],
      ), // Just a placeholder
    );
  }
}
