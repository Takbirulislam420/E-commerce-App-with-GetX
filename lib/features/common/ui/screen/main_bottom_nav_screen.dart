import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/features/cart/ui/screen/cart_screen.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:mkr_mart/features/home/ui/screen/home_screen.dart';
import 'package:mkr_mart/features/products/ui/screen/product_category_screen.dart';
import 'package:mkr_mart/features/wish_list/ui/screen/wish_list_screen.dart';

class MainBottomNavScreen extends StatefulWidget {
  const MainBottomNavScreen({super.key});

  static final String name = '/main_bottom_nav';

  @override
  State<MainBottomNavScreen> createState() => _MainBottomNavScreenState();
}

class _MainBottomNavScreenState extends State<MainBottomNavScreen> {
  final List<Widget> _screen = [
    HomeScreen(),
    ProductCategoryScreen(),
    CartScreen(),
    WishListScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainBottomNavController>(
      builder: (navController) {
        return Scaffold(
          body: _screen[navController.selectedIndex],
          bottomNavigationBar: NavigationBar(
            selectedIndex: navController.selectedIndex,
            onDestinationSelected: navController.changeIndex,

            destinations: [
              NavigationDestination(icon: Icon(Icons.home), label: "Home"),
              NavigationDestination(
                icon: Icon(Icons.category_outlined),
                label: "Category",
              ),
              NavigationDestination(
                icon: Icon(Icons.shopping_cart),
                label: "Card",
              ),
              NavigationDestination(
                icon: Icon(Icons.favorite_outline),
                label: "Favorite",
              ),
            ],
          ),
        );
      },
    );
  }
}
