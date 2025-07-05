import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/app/app_assets_path.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_card.dart';
import 'package:mkr_mart/features/home/ui/widgets/app_bar_button.dart';
import 'package:mkr_mart/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_category_item.dart';
import 'package:mkr_mart/features/home/ui/widgets/product_search_bar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String name = "/home_page";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              ProductSearchBar(),
              const SizedBox(height: 8),
              HomeCarouselSlider(),
              _buildSectionHeader(
                title: "Category",
                onTapSeeAll: () {
                  Get.find<MainBottomNavController>().moveToCategory();
                },
              ),
              _getCategoryList(),
              _buildSectionHeader(title: "Popular", onTapSeeAll: () {}),
              _getPopularProduct(),
              _buildSectionHeader(title: "Special", onTapSeeAll: () {}),
              _getSpecialProducts(),
              _buildSectionHeader(title: "New", onTapSeeAll: () {}),
              _getNewProduct(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSectionHeader({
    required String title,
    required VoidCallback onTapSeeAll,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(title, style: Theme.of(context).textTheme.titleSmall),
        TextButton(
          onPressed: onTapSeeAll,
          child: Text(
            "See all",
            style: TextStyle(color: AppColors.themeColors),
          ),
        ),
      ],
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: SvgPicture.asset(AppAssetsPath.navLogoPath),
      actions: [
        AppBarButton(onTap: () {}, icons: Icons.person),
        SizedBox(width: 3),
        AppBarButton(onTap: () {}, icons: Icons.call),
        SizedBox(width: 3),
        AppBarButton(onTap: () {}, icons: Icons.notifications),
      ],
    );
  }

  Widget _getCategoryList() {
    return SizedBox(
      height: 120,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        // primary: false,
        // shrinkWrap: true,
        itemBuilder: (context, index) {
          return ProductCategoryItem();
        },
        separatorBuilder: (context, index) => const SizedBox(width: 5),
      ),
    );
  }

  Widget _getPopularProduct() {
    //return ProductCard();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
      ),
    );
  }

  Widget _getSpecialProducts() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          return ProductCard();
        },
        separatorBuilder: (context, index) {
          return SizedBox(width: 8);
        },
      ),
    );
  }

  Widget _getNewProduct() {
    //return ProductCard();
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        spacing: 8,
        children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
      ),
    );
  }
}
