import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_category_item.dart';

class ProductCategoryScreen extends StatefulWidget {
  const ProductCategoryScreen({super.key});
  static final String name = "/product_category";

  @override
  State<ProductCategoryScreen> createState() => _ProductCategoryScreenState();
}

class _ProductCategoryScreenState extends State<ProductCategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (_, _) {
        Get.find<MainBottomNavController>().moveToHome();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("Categories"),
          leading: IconButton(
            onPressed: () {
              Get.find<MainBottomNavController>().moveToHome();
            },
            icon: Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: GridView.builder(
            itemCount: 50,

            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 4,
              mainAxisSpacing: 8,
              crossAxisSpacing: 4,
            ),
            itemBuilder: (context, index) {
              return FittedBox(child: ProductCategoryItem());
            },
          ),
        ),
      ),
    );
  }
}
