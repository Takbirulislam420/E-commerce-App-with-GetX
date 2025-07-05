import 'package:flutter/material.dart';
import 'package:mkr_mart/features/products/ui/widgets/product_carousel_slider.dart';

class ProductDetailsScreen extends StatefulWidget {
  final String productId;
  const ProductDetailsScreen({super.key, required this.productId});

  static final String name = "/product-details-screen";

  @override
  State<ProductDetailsScreen> createState() => _ProductDetailsScreenState();
}

class _ProductDetailsScreenState extends State<ProductDetailsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Product Details")),
      body: Column(children: [ProductCarouselSlider()]),
    );
  }
}
