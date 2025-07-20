import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:mkr_mart/app/app_assets_path.dart';
import 'package:mkr_mart/app/app_colors.dart';
import 'package:mkr_mart/features/auth/ui/screen/login_screen.dart';
import 'package:mkr_mart/features/common/controller/auth_controller.dart';
import 'package:mkr_mart/features/common/controller/category_list_controller.dart';
import 'package:mkr_mart/features/common/ui/controller/main_bottom_nav_controller.dart';
import 'package:mkr_mart/features/common/ui/widgets/center_circular_progress_indicator.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_card.dart';
import 'package:mkr_mart/features/home/ui/controller/home_slider_controller.dart';
import 'package:mkr_mart/features/home/ui/widgets/app_bar_button.dart';
import 'package:mkr_mart/features/home/ui/widgets/home_carousel_slider.dart';
import 'package:mkr_mart/features/common/ui/widgets/product_category_item.dart';
import 'package:mkr_mart/features/home/ui/widgets/product_search_bar.dart';
import 'package:mkr_mart/features/products/controller/popular_product_controller.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});
  static final String name = "/home_page";

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final AuthController _authController = Get.find<AuthController>();

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
              GetBuilder<HomeSliderController>(
                builder: (sliderController) {
                  // Future.delayed(Duration.zero, () {
                  //   sliderController.update(); // ✅ বিল্ড শেষে কল হবে
                  // });
                  if (sliderController.inProgress) {
                    return SizedBox(
                      height: 200,
                      child: CenterCircularProgressIndicator(),
                    );
                  }
                  return HomeCarouselSlider(
                    slider: sliderController.sliderList,
                  );
                },
              ),
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
        AppBarButton(
          onTap: () async {
            await _authController.clearUserData();

            if (_authController.accessToken == null) {
              Navigator.pushNamedAndRemoveUntil(
                // ignore: use_build_context_synchronously
                context,
                LoginScreen.name,
                (predicate) => false,
              );
            }
          },
          icons: Icons.person,
        ),
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
      child: GetBuilder<CategoryListController>(
        builder: (categoryController) {
          return ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: categoryController.homeCategoryListLength,
            // primary: false,
            // shrinkWrap: true,
            itemBuilder: (context, index) {
              return ProductCategoryItem(
                categoryModel: categoryController.categoryList[index],
              );
            },
            separatorBuilder: (context, index) => const SizedBox(width: 5),
          );
        },
      ),
    );
  }

  Widget _getPopularProduct() {
    //return ProductCard();
    return GetBuilder<PopularProductController>(
      builder: (popularController) {
        return Visibility(
          visible: popularController.inProgress == false,
          replacement: CenterCircularProgressIndicator(),
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              spacing: 8,
              children: popularController.popularProductList
                  .map((product) => ProductCard(productModel: product))
                  .toList(),
            ),
          ),
        );
      },
    );
  }

  Widget _getSpecialProducts() {
    return SizedBox(
      height: 190,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: 10,
        itemBuilder: (context, index) {
          //return ProductCard();
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
        //children: [1, 2, 3, 4, 5].map((e) => ProductCard()).toList(),
      ),
    );
  }
}
